%Umrechnungen

-module(umrechnung).
-export([zu_prozent/1, von_prozent/1,
         zu_celsius/1, zu_fahrenheit/1, zu_kelvin/1,
         zu_sekunden/1, zu_minuten/1, zu_stunden/1,
         zu_gram/1, zu_kilogram/1, zu_tonne/1,
         zu_milimeter/1, zu_centimeter/1, zu_meter/1, zu_kilometer/1,
         zu_newton/1, zu_kilopond/1, zu_kilonewton/1, zu_meganewton/1,
         zu_pascal/1, zu_kilopascal/1, zu_megapascal/1, 
         zu_newton_pro_mm2/1, zu_kilonewton_pro_cm2/1,
         zu_meganewton_pro_m2/1]).


%%%%%%%%%%
%Prozent
%%%%%%%%%%

%%Umwandlung zu Prozent
%%%Prozent zu Prozent
zu_prozent({prozent, Zahl}) ->
  {prozent, Zahl};

%%%Prozent zu Decimal
zu_prozent(Zahl) ->
  {prozent, Zahl * 100}.


%%Umwandlung von Prozent
%%%Prozent zu Decimal
von_prozent({prozent, Zahl}) ->
  Zahl / 100;

%%%Decimal zu Decimal
von_prozent(Zahl) ->
  Zahl.


%%%%%%%%%%
%Temperatur
%%%%%%%%%%

%%Umwandlung zu Celsius
%%%Celsius zu Celsius
zu_celsius({celsius, Temperatur}) ->
  {celsius, Temperatur};

%%%Fahrenheit zu Celsius
zu_celsius({fahrenheit, Temperatur}) ->
  {celsius, (Temperatur - 32) * 5 / 9};

%%%Kelvin zu Celsius
zu_celsius({kelvin, Temperatur}) ->
  {celsius, Temperatur - 273.15}.


%%Umwandlung zu Fahrenheit
%%%Celsius zu Fahrenheit
zu_fahrenheit({celsius, Temperatur}) ->
  {fahrenheit, (Temperatur * 9 / 5) + 32};

%%%Fahrenheit zu Fahrenheit
zu_fahrenheit({fahrenheit, Temperatur}) ->
  {fahrenheit, Temperatur};

%%%Kelvin zu Fahrenheit
zu_fahrenheit({kelvin, Temperatur}) ->
  {fahrenheit, ((Temperatur - 273.15) * 9 / 5) + 32}.


%%Umwandlung zu Kelvin
%%%Celsius zu Kelvin
zu_kelvin({celsius, Temperatur}) ->
  {kelvin, Temperatur + 273.15};

%%%Fahrenheit zu Kelvin
zu_kelvin({fahrenheit, Temperatur}) ->
  {kelvin, ((Temperatur - 32) * 5 / 9) + 273.15};

%%%Kelvin zu Kelvin
zu_kelvin({kelvin, Temperatur}) ->
  {kelvin, Temperatur}.


%%%%%%%%%%
%Zeit
%%%%%%%%%%

%%Umwandlung zu Sekunden
%%%Sekunden zu Sekunden
zu_sekunden({s, Zeit}) ->
  {s, Zeit};
  
%%%Minuten zu Sekunden
zu_sekunden({min, Zeit}) ->
  {s, Zeit * 60};

%%%Stunden zu Sekunden
zu_sekunden({h, Zeit}) ->
  {s, Zeit * 60 * 60}.


%%Umwandlung zu Minuten
%%%Sekunden zu Minuten
zu_minuten({s, Zeit}) ->
  {min, Zeit / 60};

%%%Minuten zu Minuten
zu_minuten({min, Zeit}) ->
  {min, Zeit};

%%%Stunden zu Minuten
zu_minuten({h, Zeit}) ->
  {min, Zeit * 60}.


%%Umwandlung zu Stunden
%%%Sekunden zu Stunden
zu_stunden({s, Zeit}) ->
  {h, Zeit / (60 * 60)};

%%%Minuten zu Stunden
zu_stunden({min, Zeit}) ->
  {h, Zeit / 60};

%%%Stunden zu Stunden
zu_stunden({h, Zeit}) ->
  {h, Zeit}.
  

%%%%%%%%%%
%Masse
%%%%%%%%%%

%%Umwandlung zu Gram
%%%Gram zu Gram
zu_gram({g, Masse}) ->
  {g, Masse};

%%%Kilogram zu Gram
zu_gram({kg, Masse}) ->
  {g, Masse * 1000};

%%%Tonnen zu Gram
zu_gram({t, Masse}) ->
  {g, Masse * 1000000}.


%%Umwandlung zu Kilogram
%%%Gram zu Kilogram
zu_kilogram({g, Masse}) ->
  {kg, Masse / 1000};

%%%Kilogram zu Kilogram
zu_kilogram({kg, Masse}) ->
  {kg, Masse};

%%%Tonnen zu Kilogram
zu_kilogram({t, Masse}) ->
  {kg, Masse * 1000}.


%%Umwandlung zu Tonne
%%%Gram zu Tonne
zu_tonne({g, Masse}) ->
  {t, Masse / 1000000};

%%%Kilogram zu Tonne
zu_tonne({kg, Masse}) ->
  {t, Masse / 1000};

%%%Tonne zu Tonne
zu_tonne({t, Masse}) ->
  {t, Masse}.


%%%%%%%%%%
%Längen
%%%%%%%%%%

%%Umwandlung zu Milimeter
%%%Milimeter zu Milimeter
zu_milimeter({mm, Laenge}) ->
  {mm, Laenge};

%%%Centimeter zu Milimeter
zu_milimeter({cm, Laenge}) ->
  {mm, Laenge * 10};

%%%Meter zu Milimeter
zu_milimeter({m, Laenge}) ->
  {mm, Laenge * 1000};

%%%Kilometer zu Milimeter
zu_milimeter({km, Laenge}) ->
  {mm, Laenge * 1000000}.


%%Umwandlung zu Centimeter
%%%Milimeter zu Centimeter
zu_centimeter({mm, Laenge}) ->
  {cm, Laenge / 10};

%%%Centimeter zu Centimeter
zu_centimeter({cm, Laenge}) ->
  {cm , Laenge};

%%%Meter zu Centimeter
zu_centimeter({m, Laenge}) ->
  {cm, Laenge * 100};

%%%Kilometer zu Centimeter
zu_centimeter({km, Laenge}) ->
  {cm, Laenge * 100000}.


%%Umwandlung zu Meter
%%%Milimeter zu Meter
zu_meter({mm, Laenge}) ->
  {m, Laenge / 1000};

%%%Centimeter zu Meter
zu_meter({cm, Laenge}) ->
  {m, Laenge / 100};

%%%Meter zu Meter
zu_meter({m, Laenge}) ->
  {m, Laenge};

%%%Kilometer zu Meter
zu_meter({km, Laenge}) ->
  {m, Laenge * 1000}.


%%Umrechnung zu Kilometer
%%%Milimeter zu Kilometer
zu_kilometer({mm, Laenge}) ->
  {km, Laenge / 1000000};

%%%Centimeter zu Kilometer
zu_kilometer({cm, Laenge}) ->
  {km, Laenge / 100000};

%%%Meter zu Kilometer
zu_kilometer({m, Laenge}) ->
  {km, Laenge / 1000};

%%%Kilometer zu Kilometer
zu_kilometer({km, Laenge}) ->
  {km, Laenge}.


%%%%%%%%%%
%Kräfte
%%%%%%%%%%

%%Umwandlung zu Newton
%%%Newton zu Newton
zu_newton({newton, Kraft}) ->
  {newton, Kraft};

%%%Kilopond zu Newton
zu_newton({kp, Kraft}) ->
  {newton, Kraft * 9.8067};

%%%Kilonewton zu Newton
zu_newton({kilonewton, Kraft}) ->
  {newton, Kraft * 1000};

%%%Meganewton zu Newton
zu_newton({meganewton, Kraft}) ->
  {newton, Kraft * 1000000}.

%%Umwandlung zu Kilopond
%%%Newton zu Kilopond
zu_kilopond({newton, Kraft}) ->
  {kp, Kraft / 9.8067};

%%%Kilopond zu Kilopond
zu_kilopond({kp, Kraft}) ->
  {kp, Kraft};

%%%Kilonewton zu Kilopond
zu_kilopond({kilonewton, Kraft}) ->
  {kp, (Kraft * 1000) / 9.8067};

%%%Meganewton zu Kilopond
zu_kilopond({meganewton, Kraft}) ->
  {kp, Kraft * 1000000 / 9.8067}.


%%Umwandlung zu Kilonewton
%%%Newton zu Kilonewton
zu_kilonewton({newton, Kraft}) ->
  {kilonewton, Kraft / 1000};

%%%Kilopond zu Kilonewton
zu_kilonewton({kp, Kraft}) ->
  {kilonewton, Kraft * 9.8067 / 1000};

%%%Kilonewton zu Kilonewton
zu_kilonewton({kilonewton, Kraft}) ->
  {kilonewton, Kraft};

%%%Meganewton zu Kilonewton
zu_kilonewton({meganewton, Kraft}) ->
  {kilonewton, Kraft * 1000}.


%%Umwandlung zu Meganewton
%%%Newton zu Meganewton
zu_meganewton({newton, Kraft}) ->
  {meganewton, Kraft / 1000000};

%%%Kilopond zu Meganewton
zu_meganewton({kp, Kraft}) ->
  {meganewton, Kraft * 9.8067 / 1000000};

%%%Kilonewton zu Meganewton
zu_meganewton({kilonewton, Kraft}) ->
  {meganewton, Kraft / 1000};

%%%Meganewton zu Meganewton
zu_meganewton({meganewton, Kraft}) ->
  {meganewton, Kraft}.


%%%%%%%%%%
%Druck
%%%%%%%%%%

%%Umwandlung zu Pascal
%%%Pascal zu Pascal
zu_pascal({pascal, Druck}) ->
  {pascal, Druck};

%%%Kilopascal zu Pascal
zu_pascal({kilopascal, Druck}) ->
  {pascal, Druck * 1000};

%%%Megapascal zu Pascal
zu_pascal({megapascal, Druck}) ->
  {pascal, Druck * 1000000};

%%%Newton pro mm2 zu Pascal
zu_pascal({newton_pro_mm2, Druck}) ->
  {pascal, Druck * 1000000};

%%%Kilonewton pro cm2 zu Pascal
zu_pascal({kilonewton_pro_cm2, Druck}) ->
  {pascal, Druck * 100000};

%%%Meganewton pro m2 zu Pascal
zu_pascal({meganewton_pro_m2, Druck}) ->
  {pascal, Druck * 1000000}.


%%Umwandlung zu Kilopascal
%%%Pascal zu Kilopascal
zu_kilopascal({pascal, Druck}) ->
  {kilopascal, Druck / 1000};

%%%Kilopascal zu Kilopascal
zu_kilopascal({kilopascal, Druck}) ->
  {kilopascal, Druck};

%%%Megapascal zu Kilopascal
zu_kilopascal({megapascal, Druck}) ->
  {kilopascal, Druck * 1000};

%%%Newton pro mm2 zu Kilopascal
zu_kilopascal({newton_pro_mm2, Druck}) ->
  {kilopascal, Druck * 1000};

%%%Kilonewton pro cm2 zu Kilopascal
zu_kilopascal({kilonewton_pro_cm2, Druck}) ->
  {kilopascal, Druck * 100};

%%%Meganewton pro m2 zu Kilopascal
zu_kilopascal({meganewton_pro_m2, Druck}) ->
  {kilopascal, Druck * 1000}.


%%Umwandlung zu Megapascal
%%%Pascal zu Megapascal
zu_megapascal({pascal, Druck}) ->
  {megapascal, Druck / 1000000};

%%%Kilopascal zu Megapascal
zu_megapascal({kilopascal, Druck}) ->
  {megapascal, Druck / 1000};

%%%Megapascal zu Megapascal
zu_megapascal({megapascal, Druck}) ->
  {megapascal, Druck};

%%%Newton pro mm2 zu Megapascal
zu_megapascal({newton_pro_mm2, Druck}) ->
  {megapascal, Druck};

%%%Kilonewton pro cm2 zu Megapascal
zu_megapascal({kilonewton_pro_cm2, Druck}) ->
  {megapascal, Druck * 10};

%%%Meganewton pro m2 zu Megapascal
zu_megapascal({meganewton_pro_m2, Druck}) ->
  {megapascal, Druck}.


%%Umwandlung zu Newton pro mm2
%%%Pascal zu Newton pro mm2
zu_newton_pro_mm2({pascal, Druck}) ->
  {newton_pro_mm2, Druck / 1000000};

%%%Kilopascal zu Newton pro mm2
zu_newton_pro_mm2({kilopascal, Druck}) ->
  {newton_pro_mm2, Druck / 1000};

%%%Megapascal zu Newton pro mm2
zu_newton_pro_mm2({megapascal, Druck}) ->
  {newton_pro_mm2, Druck};

%%%Newton pro mm2 zu Newton pro mm2
zu_newton_pro_mm2({newton_pro_mm2, Druck}) ->
  {newton_pro_mm2, Druck};

%%%Kilonewton pro cm2 zu Newton pro mm2
zu_newton_pro_mm2({kilonewton_pro_cm2, Druck}) ->
  {newton_pro_mm2, Druck * 10};

%%%Meganewton pro m2 zu Newton pro mm2
zu_newton_pro_mm2({meganewton_pro_m2, Druck}) ->
  {newton_pro_mm2, Druck}.


%%Umwandlung zu Kilonewton pro cm2
%%%Pascal zu Kilonewton pro cm2
zu_kilonewton_pro_cm2({pascal, Druck}) ->
  {kilonewton_pro_cm2, Druck / 100000};

%%%Kilopascal zu Kilonewton pro cm2
zu_kilonewton_pro_cm2({kilopascal, Druck}) ->
  {kilonewton_pro_cm2, Druck / 100};

%%%Megapascal zu Kilonewton pro cm2
zu_kilonewton_pro_cm2({megapascal, Druck}) ->
  {kilonewton_pro_cm2, Druck / 10};

%%%Newton pro mm2 zu Kiloewton pro cm2
zu_kilonewton_pro_cm2({newton_pro_mm2, Druck}) ->
  {kilonewton_pro_cm2, Druck / 10};

%%%Kilonewton pro cm2 zu Kilonewton pro cm2
zu_kilonewton_pro_cm2({kilonewton_pro_cm2, Druck}) ->
  {kilonewton_pro_cm2, Druck};

%%%Meganewton pro m2 zu Kilonewton pro cm2
zu_kilonewton_pro_cm2({meganewton_pro_m2, Druck}) ->
  {kilonewton_pro_m2, Druck / 10}.


%%Umwandlung zu Meganewton pro m2
%%%Pascal zu Meganewton pro m2
zu_meganewton_pro_m2({pascal, Druck}) ->
  {meganewton_pro_m2, Druck / 1000000};

%%%Kilopascal zu Meganewton pro m2
zu_meganewton_pro_m2({kilopascal, Druck}) ->
  {meganewton_pro_m2, Druck / 1000};

%%%Megapascal zu Meganewton pro m2
zu_meganewton_pro_m2({megapascal, Druck}) ->
  {meganewton_pro_m2, Druck};

%%%Newton pro mm2 zu Meganewton pro m2
zu_meganewton_pro_m2({newton_pro_mm2, Druck}) ->
  {meganewton_pro_m2, Druck};

%%%Kilonewton pro cm2 zu Meganewton pro m2
zu_meganewton_pro_m2({kilonewton_pro_cm2, Druck}) ->
  {meganewton_pro_m2, Druck * 10};

%%%Meganewton pro m2 zu Meganewton pro m2
zu_meganewton_pro_m2({meganewton_pro_m2, Druck}) ->
  {magenewton_pro_m2, Druck}.
  










