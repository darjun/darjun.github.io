CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(64),
  `email` varchar(128),
  `register_at` datetime,
  `password` varchar(128)
);

CREATE TABLE `posts` (
  `id` int PRIMARY KEY,
  `content` varchar(1024),
  `created_at` datetime,
  `updated_at` datetime,
  `user_id` int
);

CREATE TABLE `comments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `content` varchar(256),
  `created_at` datetime,
  `post_id` int,
  `user_id` int
);

CREATE TABLE `follows` (
  `follower_id` int,
  `followed_id` int,
  PRIMARY KEY (`follower_id`, `followed_id`)
);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

ALTER TABLE `comments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`);

CREATE UNIQUE INDEX `users_index_0` ON `users` (`username`);

CREATE UNIQUE INDEX `users_index_1` ON `users` (`email`);

CREATE INDEX `posts_index_2` ON `posts` (`created_at`);

CREATE INDEX `comments_index_3` ON `comments` (`created_at`);
