%Brandkurven
%Author: ad2108
%Version: 1.0
%Date: 2025-04-05
%License: MIT

%Description:
%    Brandkurven:
%       1. Einheits-Temperaturzeitkurve
%       2. Externe Brandkurve
%       3. Hydro-Karbon Brandkurve

-module(brandkurven).
-import(umrechnung, [zu_minuten/1, zu_celsius/1]).
-export([brandkurven/2, iteration/2]).


%%%%%%%%%%
%Brandkurven Gleichungen
%%%%%%%%%%

%%Einheiten Standartisierung
brandkurven(Brandkurve, Zeit) ->
  brandkurven(Brandkurve, zu_minuten(Zeit), ok).

%%Einheitstemperaturzeitkurve
brandkurven(einheits, {min, Zeit}, ok) ->
  {celsius, 20 + 345 * math:log10(8 * Zeit + 1)};

%%Externe Brandkurve
brandkurven(externe, {min, Zeit}, ok) ->
  {celsius, 20 + 660 * (1 - 0.687 * math:exp(-0.32 * Zeit) - 0.313 * math:exp(-3.8 * Zeit))};

%%HydroKarbon Brandkurve
brandkurven(hydro, {min, Zeit}, ok) ->
  {celsius,20 + 1080 * (1 - 0.325 * math:exp(-0.167 * Zeit) - 0.675 * math:exp(-2.5 * Zeit))}.


%%%%%%%%%%
%Brandkurven Iteration der Temeratur mit Hilfe der Zeit
%%%%%%%%%%

%%Einheiten Standartisierung
iteration(Brandkurve, Temperatur) ->
  iteration(Brandkurve, zu_celsius(Temperatur), {min, 0}, ok).

%%Brute Force mit Limitationen
iteration(Brandkurve, {celsius, Temperatur}, {min, Zeit}, ok) ->
  {celsius, Temperatur_i} = brandkurven(Brandkurve, {min, Zeit}),
  if
    (Brandkurve == externe) and (Temperatur > 860) ->
      io:format("Externe Brandkurve max bis 680 Celsius~n", []);
    (Brandkurve == hydro) and (Temperatur > 1100) ->
      io:format("HydroKarbon Brandkurve max bis 1100 Celsius~n", []);
    (Temperatur_i - Temperatur) < 0 ->
      iteration(Brandkurve, {celsius, Temperatur}, {min, Zeit + 0.01}, ok);
    true ->
      {min, Zeit}
  end.

