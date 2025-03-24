%Matten Wärmekennwerte 20 bis 1200 Grad Celsius Test

-module(matten_test).
-include_lib("eunit/include/eunit.hrl").
-import(matten, [kennwerte/0, dichte/0, 
                 kapazitaet/0, leitfaehigkeit/0]).

%%%%%%%%%%
%Dichte Test
%%%%%%%%%%
dichte_test() ->
  ?_assert(dichte() =:= {kg_pro_m3, 150.0}).

%%%%%%%%%%
%Wärmekapazitaet Test
%%%%%%%%%%
kapazitaet_test() ->
  ?_assert(kapazitaet() =:= {j_pro_kgK, 1200.0}).

%%%%%%%%%%
%Wärmeleitfähigkeit
%%%%%%%%%%
leitfaehigkeit_test() ->
  ?_assert(leitfaehigkeit() =:= {w_pro_mK, 0.20}).


