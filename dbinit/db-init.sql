USE [master]
GO

IF DB_ID('fruits') IS NOT NULL
  set noexec on               -- prevent creation when already exists

/****** Object:  Database [cars]    Script Date: 18.10.2019 18:33:09 ******/
CREATE DATABASE [fruits];
GO