%Wärmestrom Test

-module(waermestrom_test).
-include_lib("eunit/include/eunit.hrl").
-import(waermestrom, [konvektion/3, strahlung/5]).

%%%%%%%%%%
%Konvektion Test
%%%%%%%%%%
konvektion_test() ->
  ?_assert(konvektion({w_pro_m2K, 1}, {kelvin, 10}, {kelvin, 8}) =:= {w_pro_m2, 1 * (10 - 8)}).

%%%%%%%%%%
%Strahlung Test
%%%%%%%%%%
strahlung_test() ->
  ?_assert(strahlung({phi, 1}, {emmisivitaet, 1}, {emmisivitaet, 1}, {kelvin, 10}, {kelvin, 8}) =:= {w_pro_m2, 1 * 1 * 1 * math:pow(10 - 8, 4) * 5.6704e-8}).


