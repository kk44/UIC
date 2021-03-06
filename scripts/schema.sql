create database uic;
use uic;
set names utf8;

drop table if exists team;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `resume` varchar(255) not null default '',
  `creator` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `secretkey` varchar(32) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_team_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
 * role: -1:blocked 0:normal 1:admin 2:root
 */
drop table if exists `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(64) not null default '',
  `cnname` varchar(128) not null default '',
  `email` varchar(255) not null default '',
  `phone` varchar(16) not null default '',
  `im` varchar(32) not null default '',
  `qq` varchar(16) not null default '',
  `role` tinyint not null default 0,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `rel_team_user`;
CREATE TABLE `rel_team_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned not null,
  `uid` int(10) unsigned not null,
  `is_admin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tiduid` (`tid`,`uid`),
  KEY `idx_is_admin` (`is_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `session`;
CREATE TABLE `session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned not null,
  `sig` varchar(128) not null,
  `expired` int(10) unsigned not null,
  PRIMARY KEY (`id`),
  KEY `idx_session_uid` (`uid`),
  UNIQUE KEY `idx_session_sig` (`sig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
