-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 10 2020 г., 21:16
-- Версия сервера: 8.0.20
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `newbase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `storage_id` int UNSIGNED NOT NULL DEFAULT '1',
  `account_login` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_pass` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `files_count` int UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`storage_id`, `account_login`, `account_pass`, `registration_date`, `files_count`) VALUES
(1, 'bAU1USTErmJDkO4MW5JJw', 'BSYX3IjGE90Q', '2020-05-10 17:04:36', 0),
(1, 'bnCE2lozqHog', '57dtM29qghQr', '2020-05-10 17:04:01', 0),
(1, 'cLT9U0qJhQuW', '92', '2020-05-10 18:08:53', 0),
(1, 'dDaA5yR9Ss', 'eVG5PIQhx0', '2020-05-10 17:04:27', 0),
(1, 'EuZDdRJHjXyyFQ11', 'mzGMZVq9Mc', '2020-05-10 17:04:40', 0),
(1, 'ias7C3pW3O', '87', '2020-05-10 18:08:36', 0),
(1, 'YCvKCZ2dWhhRKDW35j30', '90', '2020-05-10 18:11:27', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `storage`
--

CREATE TABLE `storage` (
  `storage_id` int UNSIGNED NOT NULL,
  `storage_name` text NOT NULL,
  `storage_adress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `storage`
--

INSERT INTO `storage` (`storage_id`, `storage_name`, `storage_adress`) VALUES
(1, 'mega', 'https://mega.nz/'),
(2, 'google', 'https://www.google.com/drive/'),
(38, 'rIqxvTwnfcnNQPnVjJIE', 'BPUVmFNWZW4V6vP0OBHD'),
(39, 'hsx5UxW0TjAVQCC', 'NYw49ZbVPN4VjbL3zaZ0YEeS');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`storage_id`,`account_login`),
  ADD KEY `storage_id` (`storage_id`),
  ADD KEY `registration_date` (`registration_date`);

--
-- Индексы таблицы `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storage_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `storage`
--
ALTER TABLE `storage`
  MODIFY `storage_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
