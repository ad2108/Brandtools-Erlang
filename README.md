# Brandtools in Erlang

## Erlang

Um den in diesem Repositorium enthaltenen Code zu nutzen ist es notwendig einen Zugang zur E-Shell von Erlang zu haben.

### Projekt herunterladen

Dies kann mit Hilfe der unter dem <> Code Button enthaltenen zip erfolgen, oder über git:

```bash
git clone https://github.com/ad2108/Brandtools-Erlang.git
```

### Compilation

Um Dateien mit der Endung \*.erl nutzen zu könne sollten diese Compiliert werden. Die kann mit Hilfe dem von Erlang zur Verfügung gestellten Compiler erlc erfolgen. Dieser kann über die offizielle Webseite von [Erlang](https://www.erlang.org/) heruntergeladen werden.

Automatisiert kann Erlang mit Hilfe von Make compiliert werden. Dazu ist es notwendig make(Achtung nicht cmake) installiert zu haben.

Dies kann z.B. wie fogt erfolgen:

Linux:

```bash
sudo apt install make
```

Msys2(Windows):

```bash
pacman -S make
```

Bei Windows ist es dabei sehr wichtig darauf zu achten die TEMP Variablen richtig zu setzen.

### Interaktion

Um mit dem compilierten Dateien(\*.beam) zu interagieren kann man in dem build Ordner das Terminal starten und die E-Shell starten. Dies geht über den Befehl erl:

```bash
erl
```

Um einen Befehl in der E-Shell auszuführen ist es wichtig diesen mit einem . abzuschließen!

## 1. Umrechnungs Modul

Dieses Modul enthält Umrechnungen von Einheiten. In diesen Projekt wird es verwendet um die Eingabewerte vor den aufrufen der Funktion in die nativen Einheiten der nachfolgenden Funktion umzuwandeln.

### 1.1 Umrechnung von und zu Prozent

zu\_prozent, von\_prozent

```erlang
umrechnung:zu_prozent(0.4)
=> {prozent, 40}

umrechnung:von_prozent({prozent, 14})
=> 0.14
```

### 1.2 Umrechnung zu Celsius, Fahrenheit und Kelvin

zu\_celius, zu\_fahrenheit, zu\_kelvin

```erlang
umrechnung:zu_celsius({kelvin, 15})
=> {celsius, -258.15}

umrechnung:zu_fahrenheit({celsius, 10})
=> {fahrenheit, 50}

umrechnung:zu_kelvin({fahrenheit, 50}) 
=> {kelvin, 283.15}
```

### 1.3 Umrechnung zu Sekunden, Minuten und Stunden

zu\_sekunden, zu\_minuten, zu\_stunden

```erlang
umrechnung:zu_sekunden({min, 2})
=> {s, 120}

umrechnung:zu_minuten({s, 600})
=> {min, 10}

umrechnung:zu_stunden({min, 180})
=> {h, 3}
```

### 1.4 Umrechnung von Gram, Kilogram und Tonne

 zu\_gram, zu\_kilogram, zu\_tonne

```erlang
umrechnung:zu_gram({kg, 15})
=> {g, 15000}

umrechnung:zu_kilogram({t, 1})
=> {kg, 1000}

umrechnung:zu_tonne({kg, 1500})
=> {t, 1.5}
```

### 1.5 Umrechnung zu Milimeter, Centimeter, Meter und Kilometer

zu\_milimeter, zu\_centimeter, zu\_meter, zu\_kilometer

```erlang
umrechnung:zu_milimeter({m, 0.15})
=> {mm, 150}

umrechnung:zu_centimeter({mm, 10})
=> {cm, 10}

umrechnung:zu_meter({km, 1.75})
=> {m, 1750}

umrechnung:zu_kilometer({m, 15})
=> {km, 0.015}
```

### 1.6 Umrechnung zu Newton, Kilopond, Kilonewton und Meganewton

zu\_newton, zu\_kilopond, zu\_kilonewton, zu\_meganewton

```erlang
umrechnung:zu_newton({kilonewton, 0.16})
=> {newton, 160}

umrechnung:zu_kilopond({newton, 9.8067})
=> {kp, 1}

umrechnung:zu_kilonewton({newton, 1500})
=> {kilonewton, 1.5}

umrechnung:zu_meganewton({kilonewton, 21650})
=> {meganewton, 21.65}
```

### 1.7 Umrechnung zu Pascal, Kilopascal, Megapascal, N/mm², kN/cm² und MN/m²

zu\_pascal, zu\_kilopascal, zu\_megapascal, zu\_newton\_pro\_mm2, zu\_kilonewton\_pro\_cm2, zu\_meganewton\_pro\_m2

```erlang
umrechnung:zu_pascal({kilopascal, 1})
=> {pascal, 1000}

umrechnung:zu_kilopascal({megapascal, 1.2})
=> {kilopascal, 1200}

umrechnung:zu_megapascal({newton_pro_mm2, 1.354})
=> {megapascal, 1.354}

umrechnung:zu_newton_pro_mm2({kilonewton_pro_cm2, 23.5})
=> {newton_pro_mm2, 235}

umrechnung:zu_meganewton_pro_m2({megapascal, 1.57})
=> {meganewton_pro_m2, 1.57}
```

## 2. Brandkurven Modul

Dieses Modul beinhaltet die Einheitstemperaturzeitkurve, die Externe Brandkurve und die HydroKarbon Brandkurve. Über die Funktion brandkurven kann die Temperatur des Brandes mit Hilfe der Zeit bestimmt werden. Über die Funktion iteration kann zur Temperatur der Zeitpunkt nach begin des Brandes an dem diese Temperatur auftritt bestimmt werden. Dabei können alle passenden Einheiten die in Umrechnung erwähnt sind angewendet werden.

```erlang
%Brandkurven
brandkurven:brandkurven(einheits, {min, 15})
=> {celsius,738.5609527591754}

brandkurven:brandkurven(externe, {s, 500})
=> {celsius,648.4948135465537}

brandkurven:brandkurven(hydro, {h, 1.5})
=> {celsius,1099.9998958015992}

%Iteration
brandkurven:iteration(einheits, {fahrenheit, 600})
=> {min,0.7800000000000005}

brandkurven:iteration(externe, {kelvin, 800})
=> {min,3.3999999999999715}

brandkurven:iteration(hydro, {celsius, 1000})
=> {min,7.519999999999884}
```

## 3. Materialkennwerte

Hier sind einige der wichtigsten Materialkennwerte für die Baustoffe Baustahl, Edelstahl, Beton, Putz, Wärmedämmplatten und Wärmedämmmatten eingespeichert. Jedes dieser Baustoffe hat ein eigenes gesondertes modul. Dabei werden nur Temperaturen zwischen 20 und 1200 Grad Celsius berücksichtigt!

```erlang
%Baustahl
baustahl:kennwerte({celsius, 500})
=> {{dichte,{kg_pro_m3,7850.0}},
    {emmisivitaet_m,{emmisivitaet,0.8}},
    {waermedehnung,{deltal_pro_l,0.0067584}},
    {waermekapazitaet,{j_pro_kgK,666.4999999999999}},
    {waermeleitfaehigkeit,{w_pro_mK,37.349999999999994}}}

%Edelstahl
edelstahl:kennwerte({celsius, 600})
=> {{dichte,{kg_pro_m3,7850.0}},
    {emmisivitaet_m,{emmisivitaet,0.4}},
    {waermedehnung,{deltal_pro_l,0.0106873816}},
    {waermekapazitaet,{j_pro_kgK,542.184}},
    {waermeleitfaehigkeit,{w_pro_mK,22.22}}}

%Beton
%%Optionen (quarz, kalk) und (ober, unter)
beton:kennwerte(quarz, ober, {celsius, 500})
=> {{dichte,{kg_pro_m3,2259.0}},
    {emmisivitaet_m,{emmisivitaet,0.55}},
    {waermedehnung,{deltal_pro_l,0.007195000000000001}},
    {waermekapazitaet,{j_pro_kgK,1100}},
    {waermeleitfaehigkeit,{w_pro_mK,1.042}}}

%Putz
putz:kennwerte()
=> {{dichte,{kg_pro_m3,550.0}},
    {waermekapazitaet,{j_pro_kgK,1.1e3}},
    {waermeleitfaehigkeit,{w_pro_mK,0.12}}}

%Platten
platten:kennwerte()
=> {{dichte,{kg_pro_m3,945.0}},
    {waermekapazitaet,{j_pro_kgK,1.7e3}},
    {waermeleitfaehigkeit,{w_pro_mK,0.2}}}

%Matten
matten:kennwert()
=> {{dichte,{kg_pro_m3,150.0}},
    {waermekapazitaet,{j_pro_kgK,1.2e3}},
    {waermeleitfaehigkeit,{w_pro_mK,0.2}}}
```

## 4. Wärmestrom Modul

Dieses Modul berechnet den Wärmestrom durch Konvektion und Strahlung. Auch hier könne die Temperaturen in den 3 Haupteinheiten angegeben werden.

```erlang
%Konvektion
waermestrom:konvektion({w_pro_m2K, 9}, {celsius, 15}, {celsius, 10})
=> {w_pro_m2,45.0}

%Strahlung
waermestrom:strahlung({phi, 1}, {emmisivitaet, {prozent, 70}},
                      {emmisivitaet, 0.6}, {celsius, 500}, {kelvin, 800})
=> {w_pro_m2,0.01237770552860457}
```

## 5. Tests

Achtung alle Tests sind unvollständig und müssen noch auf alle Anwendungsfälle vervollständigt werden. Besonders die If-Statements. Beton ist auch noch nicht getestet.

