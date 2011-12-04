----------------------------------------------------------------------------------
-- Author: Mark Pictor, mpictor -- gmail -- com
--
-- Create Date:     19:30:17 01/21/2011
-- Target Devices:  XC2C32A CoolRunner-II CPLD
-- Tool versions:   ISE WebPack 13.1
-- Description:     Allows Bus Blaster v2 to work as a 3.3V serial adapter.
--                  The only signals connected are RXD and TXD.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bbserial is
    Port ( FT_TXD : in  STD_LOGIC;
           FT_RXD : out  STD_LOGIC;
           JP2_TXD : out  STD_LOGIC;
           JP2_RXD : in  STD_LOGIC
          );
end bbserial;

architecture Behavioral of bbserial is

begin
    -- pass through to jp2
    JP2_TXD <= FT_TXD;
    FT_RXD <= JP2_RXD;
end Behavioral;

