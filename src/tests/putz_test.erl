%Putz Wärmekennwerte 20 bis 1200 Grad Celsius Test

-module(putz_test).
-include_lib("eunit/include/eunit.hrl").
-import(putz, [dichte/0, kapazitaet/0, leitfaehigkeit/0]).

%%%%%%%%%%
%Dichte Test
%%%%%%%%%%
dichte_test() ->
  ?_assert(dichte() =:= {kg_pro_m3, 550.0}).

%%%%%%%%%%
%Wärmekapazität Test
%%%%%%%%%%
kapazitaet_test() ->
  ?_assert(kapazitaet() =:= {j_pro_kgK, 1100.0}).

%%%%%%%%%%
%Wärmeleitfähigkeit Test
%%%%%%%%%%
leitfaehigkeit_test() ->
  ?_assert(leitfaehigkeit() =:= {w_pro_mK, 0.12}).


