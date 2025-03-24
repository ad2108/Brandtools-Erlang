%Baustahl Wärmekennwerte 20 bis 1200 Grad Celsius Test

-module(baustahl_test).
-include_lib("eunit/include/eunit.hrl").
-import(baustahl, [dichte/0, emmisivitaet/1,
                   dehnung/1, kapazitaet/1, leitfaehigkeit/1]).

%%%%%%%%%%
%Dichte Test
%%%%%%%%%%
dichte_test() ->
  ?_assert(dichte() =:= {kg_pro_m3, 7850.0}).

%%%%%%%%%%
%Epsilon_m Test
%%%%%%%%%%
emmisivitaet_test() ->
  [?_assert(emmisivitaet(1) =:= {emmisivitaet, 0.8}),
   ?_assert(emmisivitaet(2) =:= {emmisivitaet, 0.7})].

%%%%%%%%%%
%Wärmedehnung Test
%%%%%%%%%%
dehnung_test() ->
  [?_assert(dehnung({celsius, 30}) =:= {deltal_pro_l, 1.2e-5 * 30 + 4.0e-9 * 30 * 30 - 2.416e-4}),
   ?_assert(dehnung({celsius, 800}) =:= {deltal_pro_l, 1.1e-2}),
   ?_assert(dehnung({celisus, 900}) =:= {deltal_pro_l, 2.0e-5 * 900 - 6.2e-3})].

%%%%%%%%%%
%Wärmekapazität Test
%%%%%%%%%%
kapazitaet_test() ->
  [?_assert(kapazitaet({celsius, 30}) =:= {j_pro_kgK, 425 + 7.73e-1 * 30 - 1.69e-3 * 30 * 30 + 2.22e-6 * 30 * 30 * 30}),
   ?_assert(kapazitaet({celsius, 601}) =:= {j_pro_kgK, 666 + 13002 / (738 - 601)}),
   ?_assert(kapazitaet({celsius, 736}) =:= {j_pro_kgK, 545 + 17820 / (736 - 731)}),
   ?_assert(kapazitaet({celsius, 1000}) =:= {j_pro_kgK, 650.0})].

%%%%%%%%%%
%Wärmeleitfähigkeit Test
%%%%%%%%%%
leitfaehigkeit_test() ->
  [?_assert(leitfaehigkeit({celsius, 600}) =:= {w_pro_mK, 54 - 3.33e-2 * 600}),
   ?_assert(leitfaehigkeit({celsius, 900}) =:= {w_pro_mK, 27.3})].

