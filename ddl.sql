CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `blog_name` varchar(50) DEFAULT NULL,
  `blog_url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comments` (
  `comment_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_by` varchar(50) NOT NULL,
  `comment_text` varchar(50) NOT NULL,
  KEY `post_comment` (`post_id`),
  CONSTRAINT `post_comment` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post_tag` (
  `tag_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tag_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subcat` (
  `subcat_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subcat_id`),
  KEY `cat_subcat` (`cat_id`),
  CONSTRAINT `cat_subcat` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `subcat_id` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_subcat` (`subcat_id`),
  CONSTRAINT `post_subcat` FOREIGN KEY (`subcat_id`) REFERENCES `subcat` (`subcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
post, CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `created_date` date DEFAULT NULL,
  `subcat_id` int(11) NOT NULL,
  `date_created` date DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `cat_post` (`subcat_id`),
  CONSTRAINT `cat_post` FOREIGN KEY (`subcat_id`) REFERENCES `category` (`subcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
