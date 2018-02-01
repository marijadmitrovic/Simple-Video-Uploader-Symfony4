-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 01, 2018 at 11:31 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videodata`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `video_id`, `name`, `text`) VALUES
(1, 2, 'Milica', 'Nulla facilisi. Praesent accumsan nisi lectus, et pulvinar turpis facilisis ut. Proin suscipit eget justo id facilisis. Sed et mauris feugiat, lacinia sapien vel, euismod diam. Donec massa dolor, fringilla tristique congue at, mattis sit amet purus. Praesent vitae maximus leo, eu tincidunt erat. Cras mattis elit quis sem condimentum pretium. In ut erat pellentesque, vehicula justo nec, commodo arcu. In velit mi, tempor eget ante et, faucibus tempor ante.'),
(2, 3, 'Rina', 'Quisque venenatis sit amet sem in porta. Vestibulum a molestie risus, et venenatis sem. Quisque pulvinar vulputate auctor. In bibendum libero ut velit consectetur pulvinar. Curabitur et magna est. Vivamus turpis mi, sollicitudin id turpis a, scelerisque venenatis ipsum. Donec sed suscipit lectus. Nulla facilisi. Suspendisse sodales neque quam, nec pellentesque eros porta accumsan. Praesent eu enim maximus neque placerat pretium. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sagittis enim vitae mattis. Nunc ipsum turpis, mattis eu massa a, eleifend aliquet nibh. Aenean ut facilisis neque, eu consectetur purus. Nulla risus massa, blandit a elementum quis, rhoncus in felis'),
(3, 2, 'Rina', 'Nulla facilisi. Praesent accumsan nisi lectus, et pulvinar turpis facilisis ut. Proin suscipit eget justo id facilisis. Sed et mauris feugiat, lacinia sapien vel, euismod diam. Donec massa dolor, fringilla tristique congue at, mattis sit amet purus. Praesent vitae maximus leo, eu tincidunt erat. Cras mattis elit quis sem condimentum pretium. In ut erat pellentesque, vehicula justo nec, commodo arcu. In velit mi, tempor eget ante et, faucibus tempor ante.');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20180201082746');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(1, 'test', '$2y$13$GTLoJePd05ZkXZzbmv/pReKj9fpky6fW1D9Ae/SSt75NUnUwTb.zW', 'test@gmail.com'),
(2, 'test2', '$2y$13$PZBAF45MP/C9sSPi8LXDZOkHoEyZ8VuwIvocLdy1Jq7Mpy5Hx2S4W', 'test2@gmail.com'),
(3, 'test3', '$2y$13$L2XqG0dwy/YNSUl.kiEmEucmQT/H.TEGKUehAl19CBLb6mkqHlX2K', 'test3@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `user_id`, `title`, `description`, `file`) VALUES
(1, 1, 'Prvi video', 'Etiam rutrum enim nibh, vel convallis mauris porta eget. Nam dapibus odio sit amet posuere malesuada. Proin dapibus, mi ac dapibus hendrerit, libero nulla ultricies enim, in laoreet magna erat eu massa. Vivamus libero dolor, scelerisque nec interdum eu, posuere vel ante. Proin elementum sapien eros, sit amet ultrices nunc viverra in. Sed lobortis est vitae molestie lobortis. Nunc iaculis interdum magna sed ultricies. Maecenas eu elementum neque. Sed enim odio, imperdiet placerat nisi id, rutrum mollis nunc. Donec non leo ut leo venenatis facilisis. Vestibulum nec consectetur sem, eu euismod nibh. Donec quis commodo turpis. Vivamus ut efficitur lacus. Nunc a dui commodo libero aliquet feugiat. Curabitur rutrum tincidunt elit, id fringilla nisl facilisis sit amet. Donec eu nunc faucibus, commodo erat non, convallis sapien.', '9c6d0f0953400f77597673fa434a0d8b.mp4'),
(2, 1, 'drugi video', 'Etiam rutrum enim nibh, vel convallis mauris porta eget. Nam dapibus odio sit amet posuere malesuada. Proin dapibus, mi ac dapibus hendrerit, libero nulla ultricies enim, in laoreet magna erat eu massa. Vivamus libero dolor, scelerisque nec interdum eu, posuere vel ante. Proin elementum sapien eros, sit amet ultrices nunc viverra in. Sed lobortis est vitae molestie lobortis. Nunc iaculis interdum magna sed ultricies. Maecenas eu elementum neque. Sed enim odio, imperdiet placerat nisi id, rutrum mollis nunc. Donec non leo ut leo venenatis facilisis. Vestibulum nec consectetur sem, eu euismod nibh. Donec quis commodo turpis. Vivamus ut efficitur lacus. Nunc a dui commodo libero aliquet feugiat. Curabitur rutrum tincidunt elit, id fringilla nisl facilisis sit amet. Donec eu nunc faucibus, commodo erat non, convallis sapien.', '97453dd62b3b0581c5df0fed83737248.mp4'),
(3, 3, 'Treci video', 'Quisque venenatis sit amet sem in porta. Vestibulum a molestie risus, et venenatis sem. Quisque pulvinar vulputate auctor. In bibendum libero ut velit consectetur pulvinar. Curabitur et magna est. Vivamus turpis mi, sollicitudin id turpis a, scelerisque venenatis ipsum. Donec sed suscipit lectus. Nulla facilisi. Suspendisse sodales neque quam, nec pellentesque eros porta accumsan. Praesent eu enim maximus neque placerat pretium. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sagittis enim vitae mattis. Nunc ipsum turpis, mattis eu massa a, eleifend aliquet nibh. Aenean ut facilisis neque, eu consectetur purus. Nulla risus massa, blandit a elementum quis, rhoncus in felis', '8997f4c27b4dfc94d0be42b95044f35a.mp4'),
(4, 3, 'Video', 'Quisque venenatis sit amet sem in porta. Vestibulum a molestie risus, et venenatis sem. Quisque pulvinar vulputate auctor. In bibendum libero ut velit consectetur pulvinar. Curabitur et magna est. Vivamus turpis mi, sollicitudin id turpis a, scelerisque venenatis ipsum. Donec sed suscipit lectus. Nulla facilisi. Suspendisse sodales neque quam, nec pellentesque eros porta accumsan. Praesent eu enim maximus neque placerat pretium. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque dictum sagittis enim vitae mattis. Nunc ipsum turpis, mattis eu massa a, eleifend aliquet nibh. Aenean ut facilisis neque, eu consectetur purus. Nulla risus massa, blandit a elementum quis, rhoncus in felis', '50c86f2eeecb10ea53e93efda8e784d0.mp4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C29C1004E` (`video_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CC7DA2CA76ED395` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C29C1004E` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
