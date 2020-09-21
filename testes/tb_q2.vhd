library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_q2 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_q2 is

  component q2 is port (
    p : in  STD_LOGIC;
    q : in  STD_LOGIC;
    r : in  STD_LOGIC;
    s : out STD_LOGIC);
  end component;

signal a : std_logic_vector(3 downto 0);

begin

  u1 : q2 port map(a(3), a(2), a(1), a(0));

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    a(3 downto 1) <= "000";
    wait for 200 ps;
    assert(a(0) = '1')  report "Falha em teste" severity error;

    a(3 downto 1) <= "001";
    wait for 200 ps;
    assert(a(0) = '1')  report "Falha em teste" severity error;

    a(3 downto 1) <= "100";
    wait for 200 ps;
    assert(a(0) = '0')  report "Falha em teste" severity error;

    a(3 downto 1) <= "101";
    wait for 200 ps;
    assert(a(0) = '0')  report "Falha em teste" severity error;

    a(3 downto 1) <= "111";
    wait for 200 ps;
    assert(a(0) = '1')  report "Falha em teste" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
