%Edelstahl Wärmekennwerte 20 bis 1200 Grad Celsius

-module(edelstahl).
-import(umrechnung, [zu_celsius/1]).
-export([kennwerte/1, dichte/0, emmisivitaet/0, dehnung/1, kapazitaet/1, leitfaehigkeit/1]).


%%%%%%%%%%
%Alle Kennwerte
%%%%%%%%%%

%%Auswertung
kennwerte(Temperatur) ->
  {{dichte, dichte()},
   {emmisivitaet_m, emmisivitaet()},
   {waermedehnung, dehnung(Temperatur)},
   {waermekapazitaet, kapazitaet(Temperatur)},
   {waermeleitfaehigkeit, leitfaehigkeit(Temperatur)}}.


%%%%%%%%%%
%Dichte in kg/m³
%%%%%%%%%%

%%Auswertung
dichte() ->
  {kg_pro_m3, 7850.0}.


%%%%%%%%%%
%Emmisivität Epsilon_m
%%%%%%%%%%

%%Auswertung
emmisivitaet() ->
  {emmisivitaet, 0.4}.



%%%%%%%%%%
%Wärmedehnung \Delta l / l
%%%%%%%%%%

%%Einheiten Standartisierung
dehnung(Temperatur) ->
  dehnung(zu_celsius(Temperatur), ok).

%%Auswertung
dehnung({celsius, Temperatur}, ok) ->
  Dehnung = (16 + 4.79e-3 * Temperatur - 1.243e-6 * Temperatur * Temperatur) * (Temperatur - 20)* 1.0e-6,
  {deltal_pro_l, Dehnung}.


%%%%%%%%%%
%Wärmekapazität J / (kg * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
kapazitaet(Temperatur) ->
  kapazitaet(zu_celsius(Temperatur), ok).

%%Auswertung
kapazitaet({celsius, Temperatur}, ok) ->
  Kapazitaet = 450 + 0.28 * Temperatur - 2.91e-4 * Temperatur * Temperatur + 1.34e-7 * Temperatur * Temperatur * Temperatur,
  {j_pro_kgK, Kapazitaet}.


%%%%%%%%%%
%Wärmeleitfähigkeit W / (m * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
leitfaehigkeit(Temperatur) ->
  leitfaehigkeit(zu_celsius(Temperatur), ok).

%%Auswertung
leitfaehigkeit({celsius, Temperatur}, ok) ->
  Leitfaehigkeit = 14.6 + 1.27e-2 * Temperatur,
  {w_pro_mK, Leitfaehigkeit}.

