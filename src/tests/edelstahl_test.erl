%Edelstahl Wärmekennwerte 20 bis 1200 Grad Celsius Test

-module(edelstahl_test).
-include_lib("eunit/include/eunit.hrl").
-import(edelstahl, [dichte/0, emmisivitaet/0, dehnung/1,
                    kapazitaet/1, leitfaehigkeit/1]).

%%%%%%%%%%
%Dichte Test
%%%%%%%%%%
dichte_test() ->
  ?_assert(dichte() =:= {kg_pro_m3, 7850.0}).

%%%%%%%%%%
%Epsilon_m Test
%%%%%%%%%%
emmisivitaet_test() ->
  ?_assert(emmisivitaet() =:= {emmisivitaet, 0.4}).

%%%%%%%%%%
%Wärmedehnung Test
%%%%%%%%%%
dehnung_test() ->
  ?_assert(dehnung({celsius, 600}) =:= {j_pro_kgK, (16 + 4.79e-3 * 600 - 1.243e-6 * 600 * 600) * (600 - 20) * 1.0e-6}).

%%%%%%%%%%
%Wärmekapazitaetn Test
%%%%%%%%%%
kapazitaet_test() ->
  ?_assert(kapazitaet({celsius, 600}) =:= {j_pro_kgK, 450 + 0.28 * 600 - 2.91e-4 * 600 * 600 + 1.34e-7 * 600 * 600 * 600}).

%%%%%%%%%%
%Wärmeleitfaehigkeit Test
%%%%%%%%%%
leitfaehigkeit_test() ->
  ?_assert(leitfaehigkeit({celsius, 600}) =:= {w_pro_mK, 14.6 + 1.27e-2 * 600}).


