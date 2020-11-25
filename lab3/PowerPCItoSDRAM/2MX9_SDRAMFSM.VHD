--
--  File: D:\FNDTN\ACTIVE\PROJECTS\POWERPC2\2Mx9_SDRAMfsm.vhd
-- created: 05/09/99 01:22:49
--  from: 'D:\FNDTN\ACTIVE\PROJECTS\POWERPC2\2Mx9_SDRAMfsm.asf'
--  by fsm2hdl - version: 2.0.1.49
--
library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library SYNOPSYS;
use SYNOPSYS.attributes.all;

entity sdramfsm is 
  port (CAS: in STD_LOGIC;
        CLK: in STD_LOGIC;
        CS: in STD_LOGIC;
        RAS: in STD_LOGIC;
        WE: in STD_LOGIC;
        A: inout STD_LOGIC_VECTOR (0 to 11);
        DQ: inout STD_LOGIC_VECTOR (0 to 7));
end;

architecture sdramfsm_arch of sdramfsm is


-- SYMBOLIC ENCODED state machine: Sreg0
type Sreg0_type is (S1, S2, S3, S4, S5, S6);
signal Sreg0: Sreg0_type;

begin
--concurrent signal assignments
--diagram ACTIONS;


Sreg0_machine: process (CLK)
--machine variables declarations
variable Memorie: STD_LOGIC_VECTOR (0 to 7);

begin

if CLK'event and CLK = '1' then
	case Sreg0 is
		when S1 =>
			if CS/='1' then
				Sreg0 <= S1;
			elsif CS='1' then
				Sreg0 <= S2;
			end if;
		when S2 =>
			if RAS/='1' or CAS/='1' then
				Sreg0 <= S1;
			elsif RAS='1' and CAS='1' then
				Sreg0 <= S3;
			end if;
		when S3 =>
			Memorie:=DQ;
			if WE/='1' then
				Sreg0 <= S6;
			elsif WE='1' then
				Sreg0 <= S4;
			end if;
		when S4 =>
			Sreg0 <= S5;
		when S5 =>
			Sreg0 <= S1;
		when S6 =>
			Sreg0 <= S5;
		when others =>
			null;
	end case;
end if;
end process;

end sdramfsm_arch;
