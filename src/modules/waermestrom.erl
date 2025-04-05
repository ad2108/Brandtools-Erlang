%wärmestrom
%Author: ad2108
%Version: 1.0
%Date: 2025-04-05
%License: MIT

%Description:
%    Wärmestrom Gleichungen


-module(waermestrom).
-import(umrechnung, [zu_kelvin/1, von_prozent/1]).
-export([konvektion/3, strahlung/5]).


%%%%%%%%%%
%Wärmestrom durch Konvektion in W / m²
%%%%%%%%%%

%%Einheiten Standartisierung
konvektion(Alpha, Temperatur_g, Temperatur_m) ->
  konvektion(Alpha, zu_kelvin(Temperatur_g), zu_kelvin(Temperatur_m), ok).

%%Auswertung
konvektion({w_pro_m2K, Alpha_c}, {kelvin, Theta_g}, {kelvin, Theta_m}, ok) ->
  {w_pro_m2, Alpha_c * (Theta_g - Theta_m)}.


%%%%%%%%%%
%Wärmestrom durch Strahlung in W / m²
%%%%%%%%%%

%%Einheiten Standartisierung
strahlung(Phi, {emmisivitaet, Epsilon_m}, {emmisivitaet, Epsilon_t}, Temperatur_r, Temperatur_m) ->
  strahlung(Phi, {emmisivitaet, von_prozent(Epsilon_m)}, {emmisivitaet, von_prozent(Epsilon_t)}, zu_kelvin(Temperatur_r), zu_kelvin(Temperatur_m), ok).

%%Auswertung
strahlung({phi, Phi}, {emmisivitaet, Epsilon_m}, {emmisivitaet, Epsilon_t},
          {kelvin, Theta_r}, {kelvin, Theta_m}, ok) ->
  {w_pro_m2, Phi * Epsilon_m * Epsilon_t * math:pow((Theta_r - Theta_m), 4) * 5.6704e-8}.
  

