%Putz Wärmekennwerte 20 bis 1200 Grad Celsius

-module(putz).
-export([kennwerte/0, dichte/0, kapazitaet/0, leitfaehigkeit/0]).


%%%%%%%%%%
%Alle Kennwerte
%%%%%%%%%%

%%Auswertung
kennwerte() ->
  {{dichte, dichte()},
   {waermekapazitaet, kapazitaet()},
   {waermeleitfaehigkeit, leitfaehigkeit()}}.


%%%%%%%%%%
%Dichte in kg/m³
%%%%%%%%%%

%%Auswertung
dichte() ->
  {kg_pro_m3, 550.0}.


%%%%%%%%%%
%Wärmekapazität J / (kg * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
kapazitaet() ->
  {j_pro_kgK, 1100.0}.


%%%%%%%%%%
%Wärmeleitfähigkeit W / (m * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
leitfaehigkeit() ->
  {w_pro_mK, 0.12}.

