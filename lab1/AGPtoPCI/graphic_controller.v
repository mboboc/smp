module graphic_controller( pipe, sba, rbf, st, gnt, ad_stb0, ad_stb1, sb_stb,
                           clk, irdy, trdy, serr, req, rst, ad, c_be, inta, intb ); // AGP master

  // AGP bus
  output        pipe;      
  output [ 7:0] sba; 
  output        rbf;
  input  [ 2:0] st;
  input         gnt;
  inout         ad_stb0;
  inout         ad_stb1;
  output        sb_stb;
  input         clk;
  output        irdy;
  input         trdy;
  output        serr;
  output        req;
  inout         rst;
  inout  [31:0] ad;
  inout  [ 3:0] c_be;
  output        inta;
  output        intb;

  // internal registers & wires
  reg [63:0] readDataReturnQueue[6:0];
  reg [ 6:0] pFirstRDQ;
  reg [ 6:0] pLastRDQ;

  reg [29:0] requestQueue[6:0]; // msb = req. type (r=0/w=1) , 28:0 address.
  reg [ 6:0] pFirstRQ;
  reg [ 6:0] pLastRQ;

  reg [63:0] writeDataQueue[6:0];
  reg [ 6:0] pFirstWDQ;
  reg [ 6:0] pLastWDQ;

  // registers used just for testing
  // they represent the part of the
  // graphic controller which will never :)
  // be designed here... (non AGP)
  reg [63:0] data;
  reg [28:0] addr;

  reg req;
  reg pipe;

  tri [31:0] ad;
  reg [31:0] _ad;
  assign ad = _ad;

  tri [ 3:0] c_be;
  reg [ 3:0] _c_be;
  assign  c_be= _c_be;

  tri irdy;
  reg _irdy;
  assign irdy = _irdy;

  tri trdy;
  reg _trdy;
  assign trdy = _trdy;

  reg op;
  reg full;
  reg [29:0] trdata;

  reg lww; // low word written
  reg lwr; // low word read
  reg [63:0] lgdata;

  parameter iidle = 3'b110;
  reg [2:0] ist; // internal state ( iidle => internal idle )

  // end reg. section


  initial begin
    // read data return queue is empty
    pFirstRDQ = 0;
    pLastRDQ = 0;
    // write request queue is empty
    pFirstRQ = 0;
    pLastRQ = 0;
    // write data queue is empty
    pFirstWDQ = 0;
    pLastWDQ = 0;
  end

  task incPointer;
    inout [ 6:0] _ptr;
    _ptr = ( _ptr + 1 ) % 64;
  endtask

  task decPointer;
    inout [ 6:0] _ptr;
    _ptr = ( _ptr - 1 ) % 64;
  endtask

  task enqueueWriteRequest;
    input [28:0] _addr;
    input [31:0] _data;
    output _reqBufferFull;
    begin
      // assuming Write Data Queue never becomes full
      // before Request Queue does
      if( (pLastRQ+1)%64 != pFirstRQ ) // not full
        begin
          requestQueue[ pLastRQ ] = { 1, _addr };
          writeDataQueue[ pLastWDQ ] = _data;
          incPointer( pLastRQ );
          incPointer( pLastWDQ );
          _reqBufferFull = 0;
        end
      else _reqBufferFull = 1;
    end
  endtask

  task enqueueReadRequest;
    input [28:0] _addr;
    output _reqBufferFull;
    begin
      if( (pLastRQ+1)%64 != pFirstRQ )
        begin
          requestQueue[ pLastRQ ] = { 0, _addr };
          incPointer( pLastRQ );
          _reqBufferFull = 0;
        end
       else _reqBufferFull = 1;
    end
  endtask

  task dequeueReadData;
    output _readDataReturnQueueEmpty;
    begin
      if( pFirstRDQ != pLastRDQ ) // not empty
        begin
          data = readDataReturnQueue[ pFirstRDQ ];
          incPointer( pFirstRDQ );
          _readDataReturnQueueEmpty = 0;
        end                
      else
        _readDataReturnQueueEmpty = 1;
    end      
  endtask

  always begin
    @(negedge clk);
    if( pFirstRQ != pLastRQ && pipe == 1) begin
      req = 0;  // request
      trdata = requestQueue[pFirstRQ];
      end
  end

  always begin
    @(negedge clk);
    if( gnt == 0 )
    begin
      ist = st;
    end
    if( ist != iidle ) begin
      case( st )
      3'b111: // start
        if( req == 0 || pipe == 0) begin
          if( (pLastRQ+64 - pFirstRQ)%64 <= 1 ) req = 1;
          if( (pLastRQ-pFirstRQ) == 0 ) begin
            pipe = 1;
            _ad = 29'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
            _c_be = 4'bzzz;
            ist = iidle;
          end
          else begin
            incPointer(pFirstRQ);
            pipe = 0; // agp. transfer
            if( trdata[29] == 0 ) // read request
              begin
                _ad = {trdata[28:0],3'b000};
                _c_be = 4'b000;
              end
            else
              begin
                _ad = {trdata[28:0],3'b000};
                _c_be = 4'b0100;
              end
            trdata = requestQueue[pFirstRQ];
            end
        end
      3'b000: // req. accepted: read data (low priority)
        if( lwr==0 )
          begin
            while ( trdy!=0 ) @(posedge clk); // waiting for trdy
            lgdata[31:0] = ad; // & ignoring C/BE
            lwr = 1;
          end
        else
          begin
          @(posedge clk);
            lgdata[63:32] = ad; // & ignoring C/BE
          ist = iidle;
          end
      3'b001: // req. accepted: read data (high priority)
        begin
        end
      3'b010: // req. accepted: write data (low priority)
        if( lww==0 )
          begin
            _irdy = 0;
            lgdata = writeDataQueue[ pFirstWDQ ]; // transmit lower word
            _ad = lgdata[31:0];
            _c_be = 4'b1111; // all data bytes are valid
            lww = 1; // low word written
          end
        else
          begin
            _irdy = 1;
            _ad = lgdata[63:32]; // transmit higher word
            _c_be = 4'b1111; // all data bytes are valid
            lww = 0;
            incPointer( pFirstWDQ );
            ist = iidle;
          end
      3'b011: // req. accepted: write data (high priority)
        begin
        end
      endcase
   end 
 end

  // setup
  initial begin
    req = 1;  // no request
    pipe = 1; // no agp transfer
    _ad = 29'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
    _c_be = 3'bzzz;
    _irdy = 1'bz;
    _trdy = 1'bz;
    lww = 0;
    lwr = 0;
    ist = iidle;
  end
  // end setup

  always @(posedge clk) begin
    // data consumer
    data = readDataReturnQueue[ pFirstRDQ ];
    incPointer( pFirstRDQ );
  end

  // # TEST AREA #
  initial begin
    full = 0;
    addr = 1;
    data = 255;
    enqueueReadRequest(addr,full);
    #5;
    addr = 2;
    enqueueReadRequest(addr,full);
    #5;
    addr = 3;
    enqueueWriteRequest(addr,data,full);
    #5;
    addr = 4;
    data = 64'hFE0;
    enqueueWriteRequest(addr,data,full);
  end
endmodule
