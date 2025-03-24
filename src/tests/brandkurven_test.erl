%Brandkurven Test

-module(brandkurven_test).
-include_lib("eunit/include/eunit.hrl").
-import(brandkurven, [brandkurven/2, iteration/2]).

%%%%%%%%%%
%Brandkurven Test
%%%%%%%%%%
brandkurven_test() ->
  [?_assert(brandkurven(einheits, {min, 30}) =:= 20 + 345 * math:log(8 * 30 + 1)),
   ?_assert(brandkurven(externe, {min, 30}) =:= 20 + 660 * (1 - 0.687 * math:exp(-0.32 * 30) - 0.313 * math:exp(-3.8 * 30))),
   ?_assert(brandkurven(hydro, {min, 30}) =:=  20 + 1080 * (1 - 0.325 * math:exp(-0.167 * 30) - 0.675 * math:exp(-2.5 * 30)))].

%%%%%%%%%%
%Iteration Test
%%%%%%%%%%
iteration_test() ->
  [?_assert(iteration(einheits, {celsius, 300}) =:= {min, 0.6900000000000004}),
   ?_assert(iteration(externe, {celsius, 300}) =:= {min, 0.6900000000000004}),
   ?_assert(iteration(hydro, {celsius, 600}) =:= {min, 0.5600000000000003})].


