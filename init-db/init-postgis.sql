-- Datei: init-db/01-init-postgis.sql
-- PostGIS Extension aktivieren
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- Prüfen ob PostGIS korrekt installiert ist
SELECT PostGIS_Version();

-- Tabelle für Tankstellen mit PostGIS-Geometrie (angepasst an aktuelle Struktur)
CREATE TABLE IF NOT EXISTS gas_stations (
    id SERIAL PRIMARY KEY,
    object_id INTEGER UNIQUE,
    adresse TEXT,  -- Spaltenname angepasst: address -> adresse
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    longitude DOUBLE PRECISION,
    latitude DOUBLE PRECISION,
    geometry GEOMETRY(POINT, 4326)  -- Spaltenname angepasst: position -> geometry
);

-- Spatial Index für bessere Performance
CREATE INDEX IF NOT EXISTS idx_gas_stations_geometry 
ON gas_stations USING GIST (geometry);

-- Index für Textsuche (angepasster Spaltenname)
CREATE INDEX IF NOT EXISTS idx_gas_stations_adresse 
ON gas_stations USING GIN (to_tsvector('german', adresse));

-- Index für Koordinaten (für Performance bei nicht-PostGIS Abfragen)
CREATE INDEX IF NOT EXISTS idx_gas_stations_coordinates 
ON gas_stations (longitude, latitude);

-- Trigger für automatische updated_at Aktualisierung
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_gas_stations_updated_at 
    BEFORE UPDATE ON gas_stations 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();
    