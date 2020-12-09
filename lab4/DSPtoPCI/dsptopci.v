
module arbiter(br,ba,bl,bb,bg,req,gnt,lock,clkpci,clk);

// simulez doar semnalele care ma intereseaza
input br,ba,bl,gnt,clkpci;
output bb,bg,clk,req,lock;
reg bg;
assign clk=clkpci;
assign req=br;
assign lock=bl;
assign bb=~gnt;
initial begin
bg=1;
end

always @(negedge br) 
begin
  #10;bg=0;
end
endmodule


module bus(req,gnt,lock,clk);
input req,lock;
output gnt,clk;
reg clk,gnt;

initial begin
  clk=0;gnt=1;
  forever begin
    #5;clk=~clk;
  end
end

always @(negedge req)
begin
  #30;gnt=0;
end

always @(posedge req) gnt=1;
endmodule


module dsp(br,ba,bl,bb,bg,clk);
// BR (Bus Request) � activat atunci c�nd DSP96002 face o cerere de acces la magistrala
// BG (Bus Grant) � activat de arbitrul extern c�nd DSP96002 ar putea deveni urmatorul bus master
// BA (Bus Acknowledge) � activat c�nd DSP96002 este bus master.
// BB (Bus Busy) � activat de arbitrul extern cand magistrala este ocupata
input bb,bg,clk;
output br,ba,bl;
reg br,bl;
assign ba=~bb;

initial begin
  br=1;bl=1;
  #10;
  br=0;
  #100;
  br=1;
end
endmodule


//module interfatare;
//bus PCI(req,gnt,lock,clk);
//arbiter ARB(br,ba,bl,bb,bg,req,gnt,lock,clk,clk2);
//dsp DSP(br,ba,bl,bb,bg,clk2);

//initial begin
//// initializari
//#130;
//$finish;
//end
//always @(negedge clk) $display("time:%d br:%b ba:%b bl:%b bb:%b bg:%b bl:%b",$time,br,ba,bl,bb,bg,bl);

//endmodule
