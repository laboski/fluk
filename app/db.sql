-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 30, 2020 at 11:47 AM
-- Server version: 5.7.15
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `fluk`
--

-- --------------------------------------------------------

--
-- Table structure for table `fk_app`
--

CREATE TABLE `fk_app` (
  `appID` int(11) NOT NULL,
  `appname` varchar(100) DEFAULT NULL,
  `appmail` varchar(100) DEFAULT NULL,
  `appbio` text,
  `app_token` varchar(24) DEFAULT NULL,
  `app_publickey` varchar(36) DEFAULT NULL,
  `app_secretkey` varchar(36) DEFAULT NULL,
  `app_url` text,
  `app_callbackurl` text,
  `app_webhookurl` text,
  `app_protocol` varchar(11) DEFAULT NULL,
  `is_allowed` int(11) DEFAULT NULL,
  `dateCreated` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fk_app`
--

INSERT INTO `fk_app` (`appID`, `appname`, `appmail`, `appbio`, `app_token`, `app_publickey`, `app_secretkey`, `app_url`, `app_callbackurl`, `app_webhookurl`, `app_protocol`, `is_allowed`, `dateCreated`) VALUES
(1, 'Fluk', 'hello@fluk.space', 'Connecting Neighbors &amp; friends ', 'TK150fc4a23406b', 'PKc7a40d1901fffa09c6dab92e488c6e50', 'SKb1e4720eb2fd363a3000a3f92f9c7920', 'https://fluk.space/', 'http://fluk.space/callback', 'http://fluk.space/webhook', 'http://', 1, 'Sat, 24 Oct 2020 19:22:01 +0000');

-- --------------------------------------------------------

--
-- Table structure for table `fk_group`
--

CREATE TABLE `fk_group` (
  `groupID` int(11) NOT NULL,
  `group_ownerID` int(11) DEFAULT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `group_bio` text,
  `group_memberscount` int(11) DEFAULT NULL,
  `group_profile` int(11) DEFAULT NULL,
  `group_key` varchar(40) DEFAULT NULL,
  `group_visibility` int(11) DEFAULT NULL,
  `dateCreated` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_group_members`
--

CREATE TABLE `fk_group_members` (
  `memID` int(11) NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL,
  `is_restricted` int(11) DEFAULT NULL,
  `dateJoined` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_notification`
--

CREATE TABLE `fk_notification` (
  `notificationID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `notif_icon_url` varchar(500) DEFAULT NULL,
  `notif_title` varchar(200) DEFAULT NULL,
  `notif_message` text,
  `is_seen` int(11) DEFAULT NULL,
  `dateSent` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_report`
--

CREATE TABLE `fk_report` (
  `reportID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `reported_userID` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `is_resolved` int(11) DEFAULT NULL,
  `dateResolved` varchar(60) DEFAULT NULL,
  `dateSent` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_settings`
--

CREATE TABLE `fk_settings` (
  `settingID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `last_seen` int(11) DEFAULT NULL,
  `profile_photo` int(11) DEFAULT NULL,
  `bio` int(11) DEFAULT NULL,
  `groups` int(11) DEFAULT NULL,
  `live_location` int(11) DEFAULT NULL,
  `finger_lock` int(11) DEFAULT NULL,
  `two_step_verification` int(11) DEFAULT NULL,
  `push_notification` int(11) DEFAULT NULL,
  `theme` varchar(20) DEFAULT NULL,
  `is_business` int(11) DEFAULT NULL,
  `is_deativated` int(11) DEFAULT NULL,
  `dateChanged` varchar(60) DEFAULT NULL,
  `dateCreated` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_status`
--

CREATE TABLE `fk_status` (
  `statusID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `status_type` int(11) DEFAULT NULL,
  `status_text` varchar(700) DEFAULT NULL,
  `status_image_url` text,
  `status_video_url` text,
  `status_update_seconds` varchar(11) DEFAULT NULL,
  `status_update_mins` varchar(11) DEFAULT NULL,
  `status_update_hours` varchar(11) DEFAULT NULL,
  `dateUploaded` varchar(60) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_status_settings`
--

CREATE TABLE `fk_status_settings` (
  `statusID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `dateLastSet` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fk_users`
--

CREATE TABLE `fk_users` (
  `userID` int(11) NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dp_src` text,
  `age` int(11) DEFAULT NULL,
  `userToken` varchar(30) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `dateJoined` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fk_users`
--

INSERT INTO `fk_users` (`userID`, `name`, `email`, `password`, `phone`, `gender`, `dp_src`, `age`, `userToken`, `is_admin`, `dateJoined`) VALUES
(1, 'abed edet', 'tom@gmail.com', '0a8487ee5c2e7799e3b2350be6a13b56760372a1', NULL, NULL, NULL, NULL, 'hzoi2no', 0, 'Wed, 14 Oct 2020 15:11:54 +0000');

-- --------------------------------------------------------

--
-- Table structure for table `fk_verification`
--

CREATE TABLE `fk_verification` (
  `verID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `phone_token` int(11) DEFAULT NULL,
  `email_token` varchar(11) DEFAULT NULL,
  `phone_used` int(11) DEFAULT NULL,
  `email_used` int(11) DEFAULT NULL,
  `dateSent` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fk_verification`
--

INSERT INTO `fk_verification` (`verID`, `userID`, `phone_token`, `email_token`, `phone_used`, `email_used`, `dateSent`) VALUES
(1, 1, 62413, 'hzoi2no', 0, 0, 'Wed, 14 Oct 2020 15:11:54 +0000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fk_app`
--
ALTER TABLE `fk_app`
  ADD PRIMARY KEY (`appID`);

--
-- Indexes for table `fk_group`
--
ALTER TABLE `fk_group`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `fk_group_members`
--
ALTER TABLE `fk_group_members`
  ADD PRIMARY KEY (`memID`);

--
-- Indexes for table `fk_notification`
--
ALTER TABLE `fk_notification`
  ADD PRIMARY KEY (`notificationID`);

--
-- Indexes for table `fk_report`
--
ALTER TABLE `fk_report`
  ADD PRIMARY KEY (`reportID`);

--
-- Indexes for table `fk_settings`
--
ALTER TABLE `fk_settings`
  ADD PRIMARY KEY (`settingID`);

--
-- Indexes for table `fk_status`
--
ALTER TABLE `fk_status`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `fk_status_settings`
--
ALTER TABLE `fk_status_settings`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `fk_users`
--
ALTER TABLE `fk_users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `fk_verification`
--
ALTER TABLE `fk_verification`
  ADD PRIMARY KEY (`verID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fk_app`
--
ALTER TABLE `fk_app`
  MODIFY `appID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fk_group`
--
ALTER TABLE `fk_group`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_group_members`
--
ALTER TABLE `fk_group_members`
  MODIFY `memID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_notification`
--
ALTER TABLE `fk_notification`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_report`
--
ALTER TABLE `fk_report`
  MODIFY `reportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_settings`
--
ALTER TABLE `fk_settings`
  MODIFY `settingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_status`
--
ALTER TABLE `fk_status`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_status_settings`
--
ALTER TABLE `fk_status_settings`
  MODIFY `statusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fk_users`
--
ALTER TABLE `fk_users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fk_verification`
--
ALTER TABLE `fk_verification`
  MODIFY `verID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
