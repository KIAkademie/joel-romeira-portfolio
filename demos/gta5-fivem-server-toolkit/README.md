# GTA 5 / FiveM – Fahrzeug-HUD & SQL-Garage

Ein kleines Freizeit-Projekt aus dem Bereich GTA-5-Modding: Ein Lua-Skript zur Abfrage von Fahrzeugdaten (Geschwindigkeit, Tankstand, Motorzustand) kombiniert mit einer SQL-Datenbanktabelle zum Speichern von Fahrzeugen in einer Garage.

- **Live-Vorschau:** [https://kiakademie.github.io/gta5-fivem-server-toolkit/](https://kiakademie.github.io/gta5-fivem-server-toolkit/)
- **Autor:** Joel Neto Romeira

## Aufbau

- `scripts/vehicle_telemetry_hud.lua` – Client-Skript in Lua, das die aktuellen Fahrzeugwerte ausliest und an das HTML/JS-Overlay (NUI) übergibt sowie den Befehl `/savecar` bereitstellt.
- `sql/garage_vehicles.sql` – SQL-Tabellenstruktur (`player_vehicles`) für Kennzeichen, Tankfüllung, Zustand und Garagen-Standort.
- `index.html` – Schlichte Browser-Vorschau für die Tacho-Anzeige, die SQL-Tabelle und den Quellcode.
