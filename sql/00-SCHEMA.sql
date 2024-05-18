DROP TABLE IF EXISTS `rosters`
CREATE TABLE `rosters` (
  `league_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `point` int(8) unsigned NOT NULL,
  `team_id` smallint(5) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `status` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `position` varchar(5) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`league_id`,`point`,`player_id`),
  KEY `league_player_team` (`league_id`,`team_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `schedule`
CREATE TABLE `schedule` (
  `league_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sport` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `season` smallint(4) unsigned NOT NULL,
  `data` json DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`league_id`,`sport`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `wildcards`
CREATE TABLE `wildcards` (
  `league_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `season` smallint(4) unsigned NOT NULL,
  `data` json DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`league_id`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `league`
CREATE TABLE `league` (
  `id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `season` smallint(4) unsigned NOT NULL,
  `league_type` varchar(16) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `waivers` json DEFAULT NULL,
  `trades` json DEFAULT NULL,
  `add_drops` json DEFAULT NULL,
  `block` json DEFAULT NULL,
  `custom_dates` json DEFAULT NULL,
  `commissioners_message` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `constitution` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`season`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `keepers`
CREATE TABLE `keepers` (
  `league_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `season` smallint(4) unsigned NOT NULL,
  `data` json DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`league_id`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
