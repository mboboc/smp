--
--  File: D:\FNDTN\ACTIVE\PROJECTS\POWERPC2\PowerpcFSM.vhd
-- created: 05/09/99 00:51:58
--  from: 'D:\FNDTN\ACTIVE\PROJECTS\POWERPC2\PowerpcFSM.asf'
--  by fsm2hdl - version: 2.0.1.49
--
library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library SYNOPSYS;
use SYNOPSYS.attributes.all;

entity powerpcfsm is 
  port (AACK: in STD_LOGIC;
        BG: in STD_LOGIC;
        CLK: in STD_LOGIC;
        DBG: in STD_LOGIC;
        TA: in STD_LOGIC;
        BR: out STD_LOGIC;
        WT: out STD_LOGIC;
        A: inout STD_LOGIC_VECTOR (0 to 31);
        ARTRY: inout STD_LOGIC;
        DH: inout STD_LOGIC_VECTOR (0 to 31);
        DL: inout STD_LOGIC_VECTOR (0 to 31);
        TBST: inout STD_LOGIC;
        TS: inout STD_LOGIC;
        TSIZ: inout STD_LOGIC_VECTOR (0 to 2);
        TT: inout STD_LOGIC_VECTOR (0 to 4));
end;

architecture powerpcfsm_arch of powerpcfsm is


-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (Cerere_bus, Fara_date, S1, Transmisie_adresa, Transmisie_date);
signal Sreg0: Sreg0_type;

begin
--concurrent signal assignments
--diagram ACTIONS;


Sreg0_machine: process (CLK)
--machine variables declarations
variable Trans: STD_LOGIC_VECTOR (0 to 4);

begin

if CLK'event and CLK = '1' then
	case Sreg0 is
		when Cerere_bus =>
			if BG/='0' then
				Sreg0 <= Cerere_bus;
			elsif BG='0' then
				Sreg0 <= Transmisie_adresa;
			end if;
		when Fara_date =>
			Sreg0 <= S1;
		when S1 =>
			Sreg0 <= Cerere_bus;
		when Transmisie_adresa =>
			Trans:="00010";
			if DBG/='0' then
				Sreg0 <= Fara_date;
			elsif DBG='0' then
				Sreg0 <= Transmisie_date;
			end if;
		when Transmisie_date =>
			Sreg0 <= S1;
		when others =>
			null;
	end case;
end if;
end process;

-- signal assignment statements for combinatorial outputs
BR_assignment:
BR <= '0' when (Sreg0 = Cerere_bus) else
      'Z' when (Sreg0 = Fara_date) else
      'Z' when (Sreg0 = S1) else
      '1' when (Sreg0 = Transmisie_adresa) else
      '0' when (Sreg0 = Transmisie_adresa and DBG/='0') else
      '0' when (Sreg0 = Transmisie_adresa and DBG='0') else
      'Z' when (Sreg0 = Transmisie_date) else
      'Z';

A_assignment:
A <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (Sreg0 = Cerere_bus) else
     "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (Sreg0 = S1) else
     "10101010101010101010101010101000" when (Sreg0 = Transmisie_adresa) else
     "10101010101010101010101010101000";

DH_assignment:
DH <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (Sreg0 = Cerere_bus) else
      "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (Sreg0 = Fara_date) else
      "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (Sreg0 = S1) else
      "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when (Sreg0 = Transmisie_adresa) else
      "10101010000000000000000000000000" when (Sreg0 = Transmisie_date) else
      "10101010000000000000000000000000";

TT_assignment:
TT <= "ZZZZZ" when (Sreg0 = Cerere_bus) else
      "ZZZZZ" when (Sreg0 = S1) else
      "00010" when (Sreg0 = Transmisie_adresa) else
      "00010";

TBST_assignment:
TBST <= TBST when (Sreg0 = Cerere_bus) else
        '1' when (Sreg0 = Transmisie_adresa) else
        '1';

TSIZ_assignment:
TSIZ <= TSIZ when (Sreg0 = Cerere_bus) else
        "001" when (Sreg0 = Transmisie_adresa) else
        "001";

TS_assignment:
TS <= '1' when (Sreg0 = Cerere_bus) else
      '0' when (Sreg0 = Transmisie_adresa) else
      '0' when (Sreg0 = Transmisie_adresa and DBG/='0') else
      '0' when (Sreg0 = Transmisie_adresa and DBG='0') else
      '0';

ARTRY_assignment:
ARTRY <= ARTRY when (Sreg0 = Cerere_bus) else
         ARTRY;

WT_assignment:
WT <= '0' when (Sreg0 = Transmisie_adresa) else
      '0';

end powerpcfsm_arch;
