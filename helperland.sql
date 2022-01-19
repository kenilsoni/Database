-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2022 at 01:49 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helperland`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UsertypeID` int(11) NOT NULL,
  `StreetName` varchar(100) NOT NULL,
  `HouseName` varchar(100) NOT NULL,
  `PostalCode` varchar(100) NOT NULL,
  `CityID` int(11) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `avatar`
--

CREATE TABLE `avatar` (
  `AvatarID` int(11) NOT NULL,
  `AvatarPath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `BlockID` int(11) NOT NULL,
  `BlockingUserID` int(11) NOT NULL,
  `BlockedUserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancelservice`
--

CREATE TABLE `cancelservice` (
  `CancelServiceID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `Message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(255) NOT NULL,
  `StateID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extraservice`
--

CREATE TABLE `extraservice` (
  `ExtraServiceID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `ExtraServiceTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `extraservicetype`
--

CREATE TABLE `extraservicetype` (
  `ExtraserviceTypeID` int(11) NOT NULL,
  `ExtraServiceName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `FavouriteID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ServiceProviderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `GenderID` int(11) NOT NULL,
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ratting`
--

CREATE TABLE `ratting` (
  `RattingID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ServiceProviderID` int(11) NOT NULL,
  `OnTime` int(11) NOT NULL,
  `Friendly` int(11) NOT NULL,
  `QualityOfService` int(11) NOT NULL,
  `Feedback` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `StartTime` varchar(10) NOT NULL,
  `TotalTime` varchar(20) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `HaveApet` int(11) NOT NULL,
  `Payment` decimal(10,0) NOT NULL,
  `IsAccept` int(11) NOT NULL,
  `IsCompleted` int(11) NOT NULL,
  `ServiceProviderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider`
--

CREATE TABLE `serviceprovider` (
  `ServiceProviderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `GenderID` int(11) NOT NULL,
  `AvatarID` int(11) NOT NULL,
  `BillingAddressID` int(11) NOT NULL,
  `Taxno` varchar(50) NOT NULL,
  `IsWorkWithPet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `StateID` int(11) NOT NULL,
  `StateName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(250) NOT NULL,
  `LastName` varchar(250) NOT NULL,
  `UserTypeID` int(11) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `MobileNumber` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `IsActive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `UserTypeID` int(11) NOT NULL,
  `UserType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `UsertypeID` (`UsertypeID`),
  ADD KEY `CityID` (`CityID`);

--
-- Indexes for table `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`AvatarID`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`BlockID`),
  ADD KEY `BlockedUserID` (`BlockedUserID`),
  ADD KEY `BlockingUserID` (`BlockingUserID`);

--
-- Indexes for table `cancelservice`
--
ALTER TABLE `cancelservice`
  ADD PRIMARY KEY (`CancelServiceID`),
  ADD KEY `ServiceID` (`ServiceID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`CityID`),
  ADD KEY `StateID` (`StateID`);

--
-- Indexes for table `extraservice`
--
ALTER TABLE `extraservice`
  ADD PRIMARY KEY (`ExtraServiceID`),
  ADD KEY `ExtraServiceTypeID` (`ExtraServiceTypeID`),
  ADD KEY `ServiceID` (`ServiceID`);

--
-- Indexes for table `extraservicetype`
--
ALTER TABLE `extraservicetype`
  ADD PRIMARY KEY (`ExtraserviceTypeID`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`FavouriteID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ServiceProviderID` (`ServiceProviderID`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GenderID`);

--
-- Indexes for table `ratting`
--
ALTER TABLE `ratting`
  ADD PRIMARY KEY (`RattingID`),
  ADD KEY `ServiceID` (`ServiceID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ServiceProviderID` (`ServiceProviderID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `AddressID` (`AddressID`),
  ADD KEY `ServiceProviderID` (`ServiceProviderID`);

--
-- Indexes for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD PRIMARY KEY (`ServiceProviderID`),
  ADD KEY `AvatarID` (`AvatarID`),
  ADD KEY `GenderID` (`GenderID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BillingAddressID` (`BillingAddressID`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`StateID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `UserTypeID` (`UserTypeID`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`UserTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avatar`
--
ALTER TABLE `avatar`
  MODIFY `AvatarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `BlockID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancelservice`
--
ALTER TABLE `cancelservice`
  MODIFY `CancelServiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extraservice`
--
ALTER TABLE `extraservice`
  MODIFY `ExtraServiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extraservicetype`
--
ALTER TABLE `extraservicetype`
  MODIFY `ExtraserviceTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `FavouriteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratting`
--
ALTER TABLE `ratting`
  MODIFY `RattingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  MODIFY `ServiceProviderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `StateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `UserTypeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`UsertypeID`) REFERENCES `usertype` (`UserTypeID`),
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`);

--
-- Constraints for table `block`
--
ALTER TABLE `block`
  ADD CONSTRAINT `block_ibfk_1` FOREIGN KEY (`BlockedUserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `block_ibfk_2` FOREIGN KEY (`BlockingUserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `cancelservice`
--
ALTER TABLE `cancelservice`
  ADD CONSTRAINT `cancelservice_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `state` (`StateID`);

--
-- Constraints for table `extraservice`
--
ALTER TABLE `extraservice`
  ADD CONSTRAINT `extraservice_ibfk_1` FOREIGN KEY (`ExtraServiceTypeID`) REFERENCES `extraservicetype` (`ExtraserviceTypeID`),
  ADD CONSTRAINT `extraservice_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`);

--
-- Constraints for table `favourite`
--
ALTER TABLE `favourite`
  ADD CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`ServiceProviderID`) REFERENCES `serviceprovider` (`ServiceProviderID`);

--
-- Constraints for table `ratting`
--
ALTER TABLE `ratting`
  ADD CONSTRAINT `ratting_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`),
  ADD CONSTRAINT `ratting_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `ratting_ibfk_3` FOREIGN KEY (`ServiceProviderID`) REFERENCES `serviceprovider` (`ServiceProviderID`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`ServiceProviderID`) REFERENCES `serviceprovider` (`ServiceProviderID`);

--
-- Constraints for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD CONSTRAINT `serviceprovider_ibfk_1` FOREIGN KEY (`AvatarID`) REFERENCES `avatar` (`AvatarID`),
  ADD CONSTRAINT `serviceprovider_ibfk_2` FOREIGN KEY (`GenderID`) REFERENCES `gender` (`GenderID`),
  ADD CONSTRAINT `serviceprovider_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `serviceprovider_ibfk_4` FOREIGN KEY (`BillingAddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserTypeID`) REFERENCES `usertype` (`UserTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
