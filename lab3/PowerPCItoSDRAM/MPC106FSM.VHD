--
--  File: D:\FNDTN\ACTIVE\PROJECTS\POWERPC2\MPC106FSM.vhd
-- created: 05/09/99 01:09:53
--  from: 'D:\FNDTN\ACTIVE\PROJECTS\POWERPC2\MPC106FSM.asf'
--  by fsm2hdl - version: 2.0.1.49
--
library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library SYNOPSYS;
use SYNOPSYS.attributes.all;

entity mpc106fsm is 
  port (BR0: in STD_LOGIC;
        CLK: in STD_LOGIC;
        DL: in STD_LOGIC_VECTOR (0 to 31);
        TBST: in STD_LOGIC;
        TS: in STD_LOGIC;
        TSIZ: in STD_LOGIC_VECTOR (0 to 2);
        WT: in STD_LOGIC;
        AACK: out STD_LOGIC;
        ARTRY: out STD_LOGIC;
        BG0: out STD_LOGIC;
        CS: out STD_LOGIC_VECTOR (0 to 7);
        DBG0: out STD_LOGIC;
        DH: out STD_LOGIC_VECTOR (0 to 31);
        SDCAS: out STD_LOGIC;
        SDMA: out STD_LOGIC_VECTOR (0 to 11);
        SDRAS: out STD_LOGIC;
        TA: out STD_LOGIC;
        WE: out STD_LOGIC;
        A: inout STD_LOGIC_VECTOR (0 to 31);
        TT: inout STD_LOGIC_VECTOR (0 to 4));
end;

architecture mpc106fsm_arch of mpc106fsm is


-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (Arb	, Arbi	, Arbit, Arbitrare, Asteapta_date, Astpt_dat, Scr_dat, Scr_mem, Scriere_date, Scriu_mem);
signal Sreg0: Sreg0_type;

begin
--concurrent signal assignments
--diagram ACTIONS;


Sreg0_machine: process (CLK)
--machine variables declarations
variable adr: STD_LOGIC_VECTOR (0 to 31);
variable chip: STD_LOGIC_VECTOR (0 to 7);
variable date: STD_LOGIC_VECTOR (0 to 31);
variable Siz: STD_LOGIC_VECTOR (0 to 2);
variable X: INTEGER range 0 to 255;

begin

if CLK'event and CLK = '1' then
	case Sreg0 is
		when Arb	 =>
			if BR0='0' then
				Sreg0 <= Arbi	;
			elsif BR0/='0' then
				Sreg0 <= Arb	;
			end if;
		when Arbi	 =>
			if BR0='1' then
				Sreg0 <= Arbi	;
			elsif BR0/='1' then
				Sreg0 <= Astpt_dat;
			end if;
		when Arbit =>
			if BR0/='1' then
				Sreg0 <= Arbit;
			elsif BR0='1' then
				Sreg0 <= Asteapta_date;
			end if;
		when Arbitrare =>
			if BR0='0' then
				Sreg0 <= Arbit;
			elsif BR0/='0' then
				Sreg0 <= Arbitrare;
			end if;
		when Asteapta_date =>
			adr:=A;
			Sreg0 <= Scriere_date;
		when Astpt_dat =>
			adr:=A;
			--SDMA[0:2]<=A[7:9];
			--SDMA[3:11]<=A[21:28];
			Sreg0 <= Scr_dat;
		when Scr_dat =>
			chip:="11111110";
			Sreg0 <= Scr_mem;
		when Scr_mem =>
			--DL<="10101011000000000000000000000000";
			Sreg0 <= Arbitrare;
		when Scriere_date =>
			chip:="11111110";
			Sreg0 <= Scriu_mem;
		when Scriu_mem =>
			--DL<="10101011000000000000000000000000";
			Sreg0 <= Arb	;
		when others =>
			null;
	end case;
end if;
end process;

-- signal assignment statements for combinatorial outputs
AACK_assignment:
AACK <= '1' when (Sreg0 = Arb	) else
        '1' when (Sreg0 = Arbitrare) else
        '0' when (Sreg0 = Scr_dat) else
        '1' when (Sreg0 = Scr_mem) else
        '0' when (Sreg0 = Scriere_date) else
        '1' when (Sreg0 = Scriu_mem) else
        '1';

ARTRY_assignment:
ARTRY <= '1' when (Sreg0 = Arb	) else
         '1' when (Sreg0 = Arbitrare) else
         '1' when (Sreg0 = Asteapta_date) else
         '1' when (Sreg0 = Astpt_dat) else
         '1';

TA_assignment:
TA <= '1' when (Sreg0 = Arb	) else
      '1' when (Sreg0 = Arbitrare) else
      '0' when (Sreg0 = Scr_mem) else
      '1' when (Sreg0 = Scr_mem) else
      '0' when (Sreg0 = Scriu_mem) else
      '1' when (Sreg0 = Scriu_mem) else
      '1';

CS_assignment:
CS <= "11111111" when (Sreg0 = Arb	) else
      "11111111" when (Sreg0 = Arbitrare) else
      "11111110" when (Sreg0 = Scr_dat) else
      "11111110" when (Sreg0 = Scriere_date) else
      "11111110";

SDRAS_assignment:
SDRAS <= '1' when (Sreg0 = Arb	) else
         '1' when (Sreg0 = Arbitrare) else
         '1' when (Sreg0 = Scr_dat) else
         '1' when (Sreg0 = Scr_mem) else
         '0' when (Sreg0 = Scriere_date) else
         '1' when (Sreg0 = Scriu_mem) else
         '1';

SDCAS_assignment:
SDCAS <= '0' when (Sreg0 = Arb	) else
         '1' when (Sreg0 = Arbitrare) else
         '0' when (Sreg0 = Scr_dat) else
         '1' when (Sreg0 = Scr_mem) else
         '1' when (Sreg0 = Scriere_date) else
         '1' when (Sreg0 = Scriu_mem) else
         '1';

WE_assignment:
WE <= '1' when (Sreg0 = Arb	) else
      '1' when (Sreg0 = Arbitrare) else
      '0' when (Sreg0 = Scr_mem) else
      '0' when (Sreg0 = Scriu_mem) else
      '0';

BG0_assignment:
BG0 <= '1' when (Sreg0 = Arb	) else
       '0' when (Sreg0 = Arbi	) else
       '0' when (Sreg0 = Arbit) else
       '1' when (Sreg0 = Arbitrare) else
       'Z' when (Sreg0 = Asteapta_date) else
       'Z' when (Sreg0 = Astpt_dat) else
       'Z' when (Sreg0 = Scr_dat) else
       'Z' when (Sreg0 = Scr_mem) else
       'Z' when (Sreg0 = Scriere_date) else
       'Z' when (Sreg0 = Scriu_mem) else
       'Z';

DBG0_assignment:
DBG0 <= 'Z' when (Sreg0 = Arb	) else
        'Z' when (Sreg0 = Arbi	) else
        'Z' when (Sreg0 = Arbit) else
        'Z' when (Sreg0 = Arbitrare) else
        '0' when (Sreg0 = Asteapta_date) else
        '0' when (Sreg0 = Astpt_dat) else
        'Z' when (Sreg0 = Scr_dat) else
        'Z' when (Sreg0 = Scriere_date) else
        'Z';

TT_assignment:
TT <= TT when (Sreg0 = Arb	) else
      TT when (Sreg0 = Arbitrare) else
      TT;

A_assignment:
A <= A when (Sreg0 = Arbitrare) else
     A;

DH_assignment:
DH <= DL when (Sreg0 = Asteapta_date) else
      DL when (Sreg0 = Astpt_dat) else
      DL;

SDMA_0_assignment:
SDMA(0) <= A(9) when (Sreg0 = Asteapta_date) else
           A(6) when (Sreg0 = Astpt_dat) else
           A(6);

SDMA_1_assignment:
SDMA(1) <= A(10) when (Sreg0 = Asteapta_date) else
           A(9) when (Sreg0 = Astpt_dat) else
           A(9);

SDMA_2_assignment:
SDMA(2) <= A(11) when (Sreg0 = Asteapta_date) else
           A(7) when (Sreg0 = Astpt_dat) else
           A(7);

SDMA_3_assignment:
SDMA(3) <= A(12) when (Sreg0 = Asteapta_date) else
           A(8) when (Sreg0 = Astpt_dat) else
           A(8);

SDMA_4_assignment:
SDMA(4) <= A(13) when (Sreg0 = Asteapta_date) else
           A(21) when (Sreg0 = Astpt_dat) else
           A(21);

SDMA_5_assignment:
SDMA(5) <= A(14) when (Sreg0 = Asteapta_date) else
           A(22) when (Sreg0 = Astpt_dat) else
           A(22);

SDMA_6_assignment:
SDMA(6) <= A(15) when (Sreg0 = Asteapta_date) else
           A(23) when (Sreg0 = Astpt_dat) else
           A(23);

SDMA_7_assignment:
SDMA(7) <= A(16) when (Sreg0 = Asteapta_date) else
           A(24) when (Sreg0 = Astpt_dat) else
           A(24);

SDMA_8_assignment:
SDMA(8) <= A(17) when (Sreg0 = Asteapta_date) else
           A(25) when (Sreg0 = Astpt_dat) else
           A(25);

SDMA_9_assignment:
SDMA(9) <= A(18) when (Sreg0 = Asteapta_date) else
           A(26) when (Sreg0 = Astpt_dat) else
           A(26);

SDMA_10_assignment:
SDMA(10) <= A(19) when (Sreg0 = Asteapta_date) else
            A(27) when (Sreg0 = Astpt_dat) else
            A(27);

SDMA_11_assignment:
SDMA(11) <= A(20) when (Sreg0 = Asteapta_date) else
            A(28) when (Sreg0 = Astpt_dat) else
            A(28);

end mpc106fsm_arch;
