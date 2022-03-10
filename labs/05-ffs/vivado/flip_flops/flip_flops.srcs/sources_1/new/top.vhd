library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( BTNU : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           SW : out STD_LOGIC_VECTOR (1 downto 0);
           LED : in STD_LOGIC_VECTOR (4 downto 0));
end top;


architecture Behavioral of top is

  -- Internal signals between flip-flops
  -- WRITE YOUR CODE HERE

begin
  d_ff_0 : entity work.d_ff_rst
      port map(
          clk   => BTNU,
          rst   => BTNC,
          -- WRITE YOUR CODE HERE

          q_bar => '0'
      );

  d_ff_1 : entity work.d_ff_rst
      port map(
          clk   => BTNU,
          rst   => BTNC,
          -- WRITE YOUR CODE HERE

          q_bar => '0'
      );

  -- PUT OTHER TWO INSTANCES HERE

end architecture Behavioral;