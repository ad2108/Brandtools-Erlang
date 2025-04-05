%Matten Wärmekennwerte
%Author: ad2108
%Version: 1.0
%Date: 2025-04-05
%License: MIT

%Description:
%    Matten Wärmekennwerte 20 bis 1200 Grad Celsius


-module(matten).
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
  {kg_pro_m3, 150.0}.


%%%%%%%%%%
%Wärmekapazität J / (kg * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
kapazitaet() ->
  {j_pro_kgK, 1200.0}.


%%%%%%%%%%
%Wärmeleitfähigkeit W / (m * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
leitfaehigkeit() ->
  {w_pro_mK, 0.20}.

