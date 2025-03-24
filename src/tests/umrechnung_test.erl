%Umrechnung Test

-module(umrechnung_test).
-include_lib("eunit/include/eunit.hrl").
-import(umrechnung, [zu_prozent/1, von_prozent/1,
                     zu_celsius/1, zu_fahrenheit/1, zu_kelvin/1,
                     zu_sekunden/1, zu_minuten/1, zu_stunden/1,
                     zu_gram/1, zu_kilogram/1, zu_tonne/1,
                     zu_milimeter/1, zu_centimeter/1,
                     zu_meter/1, zu_kilometer/1,
                     zu_newton/1, zu_kilopond/1,
                     zu_kilonewton/1, zu_meganewton/1,
                     zu_pascal/1, zu_kilopascal/1, zu_megapascal/1,
                     zu_newton_pro_mm2/1, zu_kilonewton_pro_cm2/1,
                     zu_meganewton_pro_m2/1]).

%%%%%%%%%%
%Prozent Test
%%%%%%%%%%
zu_prozent_test() ->
  [?_assert(zu_prozent({prozent, 15}) =:= {prozent, 15}),
   ?_assert(zu_prozent(15) =:= 15)].

von_prozent_test() ->
  [?_assert(von_prozent({prozent, 15}) =:= 0.15),
   ?_assert(von_prozent(15) =:= 15)].

%%%%%%%%%%
%Temperatur Test
%%%%%%%%%%
zu_celsius_test() ->
  [?_assert(zu_celsius({celsius, 20}) =:= {celisus, 20}),
   ?_assert(zu_celsius({fahrenheit, 50}) =:= {celsius, 10}),
   ?_assert(zu_celsius({kelvin, 0}) =:= {celsius, -273.15})].

zu_fahrenheit_test() ->
  [?_assert(zu_fahrenheit({celsius, 10}) =:= {fahrenheit, 50}),
   ?_assert(zu_fahrenheit({fahrenheit, 14}) =:= {fahrenheit, 14}),
   ?_assert(zu_fahrenheit({kelvin, 183.15}) =:= {fahrenheit, 50})].

zu_kelvin_test() ->
  [?_assert(zu_kelvin({celsius, 0}) =:= {kelvin, 273.15}),
   ?_assert(zu_kelvin({fahrenheit, 50}) =:= {kelvin, 283.15}),
   ?_assert(zu_kelvin({kelvin, 120}) =:= {kelvin, 120})].

%%%%%%%%%%%
%Zeit Test
%%%%%%%%%%%
zu_sekunden_test() ->
  [?_assert(zu_sekunden({s, 60}) =:= {s, 60}),
   ?_assert(zu_sekunden({min, 1}) =:= {s, 60}),
   ?_assert(zu_sekunden({h, 1}) =:= {s, 3600})].

zu_minuten_test() ->
  [?_assert(zu_minuten({s, 60}) =:= {min, 1}),
   ?_assert(zu_minuten({min, 1}) =:= {min, 1}),
   ?_assert(zu_minuten({h, 1}) =:= {min, 60})].

zu_stunden_test() ->
  [?_assert(zu_stunden({s, 3600}) =:= {h, 1}),
   ?_assert(zu_stunden({min, 60}) =:= {h, 1}),
   ?_assert(zu_stunden({h, 1}) =:= {h, 1})].

%%%%%%%%%%
%Masse
%%%%%%%%%%
zu_gram_test() ->
  [?_assert(zu_gram({g, 100}) =:= {g, 100}),
   ?_assert(zu_gram({kg, 1}) =:= {g, 1000}),
   ?_assert(zu_gram({t, 1}) =:= {g, 1000000})].

zu_kilogram_test() ->
  [?_assert(zu_kilogram({g, 1000}) =:= {kg, 1}),
   ?_assert(zu_kilogram({kg, 1}) =:= {kg, 1}),
   ?_assert(zu_kilogram({t, 1}) =:= {kg, 1000})].

zu_tonne_test() ->
  [?_assert(zu_tonne({g, 1000000}) =:= {t, 1}),
   ?_assert(zu_tonne({kg, 1000}) =:= {t, 1}),
   ?_assert(zu_tonne({t, 1}) =:= {t, 1})].

%%%%%%%%%%
%Längen Test
%%%%%%%%%%
zu_milimeter_test() ->
  [?_assert(zu_milimeter({mm, 10}) =:= {mm, 10}),
   ?_assert(zu_milimeter({cm, 1}) =:= {mm, 10}),
   ?_assert(zu_milimeter({m, 1}) =:= {mm, 1000}),
   ?_assert(zu_milimeter({km, 1}) =:= {mm, 1000000})].

zu_centimeter_test() ->
  [?_assert(zu_centimeter({mm, 10}) =:= {cm, 1}),
   ?_assert(zu_centimeter({cm, 10}) =:= {cm, 10}),
   ?_assert(zu_centimeter({m, 1}) =:= {cm, 100}),
   ?_assert(zu_centimeter({km, 1}) =:= {cm, 100000})].

zu_meter_test() ->
  [?_assert(zu_meter({mm, 1000}) =:= {m, 1}),
   ?_assert(zu_meter({cm, 100}) =:= {m, 1}),
   ?_assert(zu_meter({m, 1}) =:= {m, 1}),
   ?_assert(zu_meter({km, 1}) =:= {m, 1000})].

zu_kilometer_test() ->
  [?_assert(zu_kilometer({mm, 1000000}) =:= {km, 1}),
   ?_assert(zu_kilometer({cm, 100000}) =:= {km, 1}),
   ?_assert(zu_kilometer({m, 1000}) =:= {km, 1}),
   ?_assert(zu_kilometer({km, 1}) =:= {km, 1})].  

%%%%%%%%%%
%Kräfte Test
%%%%%%%%%%
zu_newton_test() ->
  [?_assert(zu_newton({newton, 10}) =:= {newton, 10}),
   ?_assert(zu_newton({kp, 1}) =:= {newton, 9.8067}),
   ?_assert(zu_newton({kilonewton, 1}) =:= {newton, 1000}),
   ?_assert(zu_newton({meganewton, 1}) =:= {newton, 1000000})].

zu_kilopond_test() ->
  [?_assert(zu_kilopond({newton, 9.8067}) =:= {kp, 1}),
   ?_assert(zu_kilopond({kp, 1}) =:= {kp, 1}),
   ?_assert(zu_kilopond({kilonewton, 9.8067}) =:= {kp, 1000}),
   ?_assert(zu_kilopond({meganewton, 9.8067}) =:= {kp, 1000000})].

zu_kilonewton_test() ->
  [?_assert(zu_kilonewton({newton, 1000}) =:= {kilonewton, 1}),
   ?_assert(zu_kilonewton({kp, 10}) =:= {kilonewton, 9.8067}),
   ?_assert(zu_kilonewton({kilonewton, 1}) =:= {kilonewton, 1}),
   ?_assert(zu_kilonewton({meganewton, 1}) =:= {kilonewton, 1000})].

zu_meganewton_test() ->
  [?_assert(zu_meganewton({newton, 1000000}) =:= {meganewton, 1}),
   ?_assert(zu_meganewton({kp, 1000000}) =:= {meganewton, 9.8067}),
   ?_assert(zu_meganewton({kilonewton, 1000}) =:= {meganewton, 1}),
   ?_assert(zu_meganewton({meganewton, 1}) =:= {meganewton, 1})].

%%%%%%%%%%
%Druck
%%%%%%%%%%
zu_pascal_test() ->
  [?_assert(zu_pascal({pascal, 10}) =:= {pascal, 10}),
   ?_assert(zu_pascal({kilopascal, 1}) =:= {pascal, 1000}),
   ?_assert(zu_pascal({megapascal, 1}) =:= {pascal, 1000000}),
   ?_assert(zu_pascal({newton_pro_mm2, 1}) =:= {pascal, 1000000}),
   ?_assert(zu_pascal({kilonewton_pro_cm2, 1}) =:= {pascal, 100000}),
   ?_assert(zu_pascal({meganewton_pro_m2, 1}) =:= {pascal, 1000000})].

zu_kilopascal_test() ->
  [?_assert(zu_kilopascal({pascal, 1000}) =:= {kilopascal, 1}),
   ?_assert(zu_kilopascal({kilopascal, 1}) =:= {kilopascal, 1}),
   ?_assert(zu_kilopascal({megapascal, 1}) =:= {kilopascal, 1000}),
   ?_assert(zu_kilopascal({newton_pro_mm2, 1}) =:= {kilopascal, 1000}),
   ?_assert(zu_kilopascal({kilonewton_pro_cm2, 1}) =:= {kilonpascal, 100}),
   ?_assert(zu_kilopascal({meganewton_pro_m2, 1}) =:= {kilonewton, 1000})].

zu_megapascal_test() ->
  [?_assert(zu_megapascal({pascal, 1000000}) =:= {megapascal, 1}),
   ?_assert(zu_megapascal({kilopascal, 1000}) =:= {megapascal, 1}),
   ?_assert(zu_megapascal({megapascal, 1}) =:= {megapascal, 1}),
   ?_assert(zu_megapascal({newton_pro_mm2, 1}) =:= {megapascal, 1}),
   ?_assert(zu_megapascal({kilonewton_pro_cm2, 10}) =:= {megapascal, 1}), 
   ?_assert(zu_megapascal({meganewton_pro_m2, 1}) =:= {megapascal, 1})].

zu_newton_pro_mm2_test() ->
  [?_assert(zu_newton_pro_mm2({pascal, 1000000}) =:= {newton_pro_mm2, 1}),
   ?_assert(zu_newton_pro_mm2({kilopascal, 1000}) =:= {newton_pro_mm2, 1}),
   ?_assert(zu_newton_pro_mm2({meganewton, 1}) =:= {newton_pro_mm2, 1}),
   ?_assert(zu_newton_pro_mm2({newton_pro_mm2, 1}) =:= {newton_pro_mm2, 1}),
   ?_assert(zu_newton_pro_mm2({kilonewton_pro_cm2, 1}) =:= {newton_pro_mm2, 10}),
   ?_assert(zu_newton_pro_mm2({meganewton_pro_m2, 1}) =:= {newton_pro_mm2, 1})].

zu_kilonewton_pro_cm2_test() ->
  [?_assert(zu_kilonewton_pro_cm2({pascal, 100000}) =:= {kilonewton_pro_cm2, 1}),
   ?_assert(zu_kilonewton_pro_cm2({kilopascal, 100}) =:= {kilonewton_pro_cm2, 1}),
   ?_assert(zu_kilonewton_pro_cm2({megapascal, 10}) =:= {kilonewton_pro_cm2, 1}),
   ?_assert(zu_kilonewton_pro_cm2({newton_pro_mm2, 10}) =:= {kilonewton_pro_cm2, 1}),
   ?_assert(zu_kilonewton_pro_cm2({kilonewton_pro_cm2, 1}) =:= {kilonewton_pro_cm2, 1}),
   ?_assert(zu_kilonewton_pro_cm2({meganewton_pro_m2, 10}) =:= {kilonewton_pro_cm2, 1})].

zu_meganewton_pro_m2_test() ->
  [?_assert(zu_meganewton_pro_m2({pascal, 1000000}) =:= {meganewton_pro_m2, 1}),
   ?_assert(zu_meganewton_pro_m2({kilopascal, 1000}) =:= {meganewton_pro_m2, 1}),
   ?_assert(zu_meganewton_pro_m2({megapascal, 1}) =:= {meganewton_pro_m2, 1}),
   ?_assert(zu_meganewton_pro_m2({newton_pro_mm2, 1}) =:= {meganewton_pro_m2, 1}),
   ?_assert(zu_meganewton_pro_m2({kilonewton_pro_cm2, 1}) =:= {meganewton_pro_m2, 1}),
   ?_assert(zu_meganewton_pro_m2({meganewton_pro_m2, 1}) =:= {meganewton_pro_m2, 1})].



