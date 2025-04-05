%Beton Wärmekennwerte
%Author: ad2108
%Version: 1.0
%Date: 2025-04-05
%License: MIT

%Description:
%    Beton Wärmekennwerte 20 bis 1200 Grad Celsius

-module(beton).
-import(umrechnung, [zu_celsius/1]).
-export([kennwerte/3, dichte/1, emmisivitaet/1, dehnung/2, kapazitaet/1, leitfaehigkeit/2]).


%%%%%%%%%%
%Alle Kennwerte
%%%%%%%%%%

%%Auswertung
kennwerte(Artd, Artl, Temperatur) ->
  {{dichte, dichte(Temperatur)},
   {emmisivitaet_m, emmisivitaet(1)},
   {waermedehnung, dehnung(Artd, Temperatur)},
   {waermekapazitaet, kapazitaet(Temperatur)},
   {waermeleitfaehigkeit, leitfaehigkeit(Artl, Temperatur)}}.


%%%%%%%%%%
%Dichte in kg/m³
%%%%%%%%%%

%%Einheiten Standartisierung
dichte(Temperatur) ->
  dichte(zu_celsius(Temperatur), ok).
  
%%Auswertung
dichte({celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur =< 115) ->
      Dichte = 2400;
    
    (Temperatur > 115) and (Temperatur =< 200) ->
      Dichte = 2400 * (1 - 0.02 * (Temperatur - 115) / 85);
  
    (Temperatur > 200) and (Temperatur =< 400) ->
      Dichte = 2400 * (0.98 - 0.03 * (Temperatur - 200) / 200);
  
    (Temperatur > 400) and (Temperatur =< 1200) ->
      Dichte = 2400 * (0.95 - 0.07 * (Temperatur - 400) / 800)
  end,
  {kg_pro_m3, Dichte}.


%%%%%%%%%%
%Emmisivität Epsilon_m
%%%%%%%%%%

%%Auswertung
emmisivitaet(Number) ->
  if
    Number == 1 ->
      {emmisivitaet, 0.55};
    Number == 2 ->
      {emmisivitaet, 0.63}
  end.


%%%%%%%%%%
%Wärmedehnung \Delta l / l
%%%%%%%%%%

%%Einheiten Standartisierung
dehnung(Art, Temperatur) ->
  dehnung(Art, zu_celsius(Temperatur), ok).

%%Auswertung
%%%Quarzhaltige Zuschläge
dehnung(quarz, {celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur =< 700) ->
      Dehnung = -1.8e-4 + 9.0e-6 * Temperatur + 2.3e-11 * Temperatur * Temperatur * Temperatur;

    (Temperatur > 700) and (Temperatur =< 1200) ->
      Dehnung = 1.4e-2
  end,
  {deltal_pro_l, Dehnung};

%%%Kalkhaltige Zuschläge
dehnung(kalk, {celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur =< 805) ->
      Dehnung = -1.2e-4 + 6.0e-6 * Temperatur + 1.4e-11 * Temperatur * Temperatur * Temperatur;

    (Temperatur > 805) and (Temperatur =< 1200) ->
      Dehnung = 1.2e-2
  end,
  {deltal_pro_l, Dehnung}.


%%%%%%%%%%
%Wärmekapazität J / (kg * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
kapazitaet(Temperatur) ->
  kapazitaet(zu_celsius(Temperatur), ok).

%%Auswertung
kapazitaet({celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur =< 100) ->
      Kapazitaet = 900;
 
    (Temperatur > 100) and (Temperatur =< 200) ->
      Kapazitaet = 900 + (Temperatur - 100);
      
    (Temperatur > 200) and (Temperatur =< 400) ->
      Kapazitaet = 1000 + (Temperatur - 200) / 2;

    (Temperatur > 400) and (Temperatur =< 1200) ->
      Kapazitaet = 1100
  end,
  {j_pro_kgK, Kapazitaet}.


%%%%%%%%%%
%Wärmeleitfähigkeit W / (m * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
leitfaehigkeit(Art, Temperatur) ->
  leitfaehigkeit(Art, zu_celsius(Temperatur), ok).

%%Auswertung
%%%Obere Grenze
leitfaehigkeit(ober, {celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur =< 1200) ->
      Leitfaehigkeit = 2 - 2.451e-1 * (Temperatur / 100) + 1.07e-2 * (Temperatur / 100) * (Temperatur / 100)
  end,
  {w_pro_mK, Leitfaehigkeit};

%%%Untere Grenze
leitfaehigkeit(unter, {celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur =< 1200) ->
      Leitfaehigkeit = 1.36 - 1.36e-1 * (Temperatur / 100) + 5.7e-3 * (Temperatur / 100) * (Temperatur / 100)
  end,
  {w_pro_mK, Leitfaehigkeit}.

