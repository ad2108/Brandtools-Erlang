%Baustahl Wärmekennwerte 20 bis 1200 Grad Celsius

-module(baustahl).
-import(umrechnung, [zu_celsius/1]).
-export([kennwerte/1, dichte/0, emmisivitaet/1, dehnung/1, kapazitaet/1, leitfaehigkeit/1]).

%%%%%%%%%%
%Alle Kennwerte
%%%%%%%%%%

%%Auswertung
kennwerte(Temperatur) ->
  {{dichte, dichte()},
   {emmisivitaet_m, emmisivitaet(1)},
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
emmisivitaet(Number) ->
  if
    Number == 1 ->
      {emmisivitaet, 0.8};
    Number == 2 ->
      {emmisivitaet, 0.7}
  end.


%%%%%%%%%%
%Wärmedehnung \Delta l / l
%%%%%%%%%%

%%Einheiten Standartisierung
dehnung(Temperatur) ->
  dehnung(zu_celsius(Temperatur), ok).

%%Auswertung
dehnung({celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur < 750) ->
      Dehnung = 1.2e-5 * Temperatur + 4.0e-9 * Temperatur * Temperatur - 2.416e-4;

    (Temperatur >= 750) and (Temperatur < 860) ->
      Dehnung = 1.1e-2;

    (Temperatur >= 860) and (Temperatur =< 1200) ->
      Dehnung = 2.0e-5 * Temperatur - 6.2e-3
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
    (Temperatur >= 20) and (Temperatur < 600) ->
      Kapazitaet = 425 + 7.73e-1 * Temperatur - 1.69e-3 * Temperatur * Temperatur + 2.22e-6 * Temperatur * Temperatur * Temperatur;
 
    (Temperatur >= 600) and (Temperatur < 735) ->
      Kapazitaet = 666 + 13002 / (738 - Temperatur);
 
    (Temperatur >= 735) and (Temperatur < 900) ->
      Kapazitaet = 545 + 17820 / (Temperatur - 731);

    (Temperatur >= 900) and (Temperatur =< 1200) ->
      Kapazitaet = 650.0
  end,
  {j_pro_kgK, Kapazitaet}.


%%%%%%%%%%
%Wärmeleitfähigkeit W / (m * °C)
%%%%%%%%%%

%%Einheiten Standartisierung
leitfaehigkeit(Temperatur) ->
  leitfaehigkeit(zu_celsius(Temperatur), ok).

%%Auswertung
leitfaehigkeit({celsius, Temperatur}, ok) ->
  if
    (Temperatur >= 20) and (Temperatur < 800) ->
      Leitfaehigkeit = 54 - 3.33e-2 * Temperatur;

    (Temperatur >= 800) and (Temperatur =< 1200) ->
      Leitfaehigkeit = 27.3
  end,
  {w_pro_mK, Leitfaehigkeit}.

