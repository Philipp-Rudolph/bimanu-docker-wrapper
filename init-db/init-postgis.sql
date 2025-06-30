-- Datei: init-db/01-init-postgis.sql
-- PostGIS Extension aktivieren
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- Prüfen ob PostGIS korrekt installiert ist
SELECT PostGIS_Version();

-- Tabelle für Tankstellen mit PostGIS-Geometrie
CREATE TABLE IF NOT EXISTS gas_stations (
    id SERIAL PRIMARY KEY,
    objectid INTEGER UNIQUE,
    address TEXT NOT NULL,
    position GEOMETRY(POINT, 4326) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Spatial Index für bessere Performance
CREATE INDEX IF NOT EXISTS idx_gas_stations_position 
ON gas_stations USING GIST (position);

-- Index für Textsuche
CREATE INDEX IF NOT EXISTS idx_gas_stations_address 
ON gas_stations USING GIN (to_tsvector('german', address));