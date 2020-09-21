library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_q1 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_q1 is

component q1 is  port (
  a,b,c : in  STD_LOGIC;
	    q : out STD_LOGIC);
end component;

signal a,b,c,q : std_logic;

begin

  u1 : q1 port map(a,b,c,q);

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    a<= '1'; b<= '1'; c<='0';
    wait for 200 ps;
    assert(q = '1')  report "Falha em teste: 1" severity error;

    a<= '1'; b<= '1'; c<='1';
    wait for 200 ps;
    assert(q = '1')  report "Falha em teste: 1" severity error;

    a<= '0'; b<= '1'; c<='1';
    wait for 200 ps;
    assert(q = '1')  report "Falha em teste: 1" severity error;

    a<= '0'; b<= '1'; c<='0';
    wait for 200 ps;
    assert(q = '0')  report "Falha em teste: 1" severity error;

    a<= '0'; b<= '0'; c<='1';
    wait for 200 ps;
    assert(q = '0')  report "Falha em teste: 1" severity error;

    a<= '1'; b<= '0'; c<='1';
    wait for 200 ps;
    assert(q = '0')  report "Falha em teste: 1" severity error;

    test_runner_cleanup(runner); -- Simulacao acaba aqui

  end process;
end architecture;
