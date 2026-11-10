-- ============================================================================
-- SQL Schema: GTA 5 Custom Garage & Vehicle Telemetry Database
-- Author: Joel Neto Romeira
-- ============================================================================

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `owner_identifier` VARCHAR(64) NOT NULL,
  `plate` VARCHAR(12) NOT NULL UNIQUE,
  `vehicle_model` VARCHAR(64) NOT NULL,
  `fuel_level` INT NOT NULL DEFAULT 100,
  `engine_health` INT NOT NULL DEFAULT 1000,
  `body_health` INT NOT NULL DEFAULT 1000,
  `garage_zone` VARCHAR(48) NOT NULL DEFAULT 'Central Garage',
  `mods_json` JSON DEFAULT NULL,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX `idx_owner` (`owner_identifier`),
  INDEX `idx_garage` (`garage_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Beispiel-Datensätze
INSERT INTO `player_vehicles` (`owner_identifier`, `plate`, `vehicle_model`, `fuel_level`, `engine_health`, `garage_zone`, `mods_json`)
VALUES
  ('steam:11000010a8f2b1c', 'LS-2004', 'comet6', 86, 980, 'Central Garage', '{"turbo":true,"engineLevel":4}'),
  ('steam:11000010a8f2b1c', 'LS-8841', 'omnisegt', 94, 1000, 'West Garage', '{"turbo":true,"armor":5}');
