CREATE TABLE IF NOT EXISTS `identities_imap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `iid` int(10) unsigned NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` text,
  `server` varchar(256) DEFAULT NULL,
  `enabled` int(1) unsigned NOT NULL DEFAULT '0',
  `label` text,
  `preferences` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `iid` (`iid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `system` (
  `name` varchar(64) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY(`name`)
);

INSERT INTO `system` (name, value) VALUES ('myrc_identities_imap', 'initial');

ALTER TABLE `identities_imap`
  ADD CONSTRAINT `identities_imap_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `identities` (`identity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `identities_imap_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;