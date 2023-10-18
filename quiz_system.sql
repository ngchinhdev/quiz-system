-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 12:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `am_thanh`
--

CREATE TABLE `am_thanh` (
  `ma_am_thanh` int(10) NOT NULL,
  `duong_dan` varchar(250) NOT NULL,
  `ma_cau_hoi` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `am_thanh`
--

INSERT INTO `am_thanh` (`ma_am_thanh`, `duong_dan`, `ma_cau_hoi`) VALUES
(1, 'audio1.mp3', 56),
(2, 'audio2.mp3', 57),
(3, 'audio3.mp3', 58),
(4, 'audio4.mp3', 59),
(5, 'audio5.mp3', 60),
(6, 'audio6.mp3', 61),
(7, 'audio7.mp3', 62),
(8, 'audio8.mp3', 63),
(9, 'audio9.mp3', 64),
(10, 'audio10.mp3', 65);

-- --------------------------------------------------------

--
-- Table structure for table `cau_hoi`
--

CREATE TABLE `cau_hoi` (
  `ma_cau_hoi` int(10) NOT NULL,
  `noi_dung` mediumtext NOT NULL,
  `giai_thich` mediumtext NOT NULL,
  `ma_de` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cau_hoi`
--

INSERT INTO `cau_hoi` (`ma_cau_hoi`, `noi_dung`, `giai_thich`, `ma_de`) VALUES
(1, 'She loves to eat chocolate____________.', 'Chocolate cake: bánh sô cô la', 1),
(2, 'What is a synonym for \'happy\'?', 'Happy = joyful = hạnh phúc', 1),
(3, 'What is the opposite of \'wet\'?', '\"Dry\" là trái nghĩa của \"wet,\" với \"wet\" nghĩa là ẩm ướt, còn \"dry\" nghĩa là khô.', 1),
(4, 'Which word is related to \'doctor\'?', '\"Patient\" (bệnh nhân) là người mà \"doctor\" (bác sĩ) chăm sóc và điều trị, vì vậy \"patient\" liên quan đến \"doctor.\"', 1),
(5, 'I like to drink a glass of _________ in the morning.', 'Trong câu này, \"water\" (nước) là một lựa chọn tự nhiên và phù hợp để điền vào chỗ trống vì nhiều người thường uống nước vào buổi sáng.', 1),
(6, 'What is a synonym for \'big\'?', '\"Large\" là một từ đồng nghĩa với \"big,\" cả hai diễn đạt về kích thước lớn.', 1),
(7, 'What is the opposite of \'day\'?', '\"Dark\" là trái nghĩa của \"day,\" với \"day\" nghĩa là ban ngày, còn \"dark\" nghĩa là tối, đêm.', 1),
(8, 'Which word is related to \'school\'?', '\"Library\" (thư viện) thường liên quan đến \"school\" (trường học) vì thư viện thường là một phần của môi trường học tập.', 1),
(9, 'He plays the _________ very well.', 'Dựa vào ngữ cảnh, \"piano\" là lựa chọn phù hợp, vì người nói đang nói về việc chơi một nhạc cụ cụ thể.', 1),
(10, 'What is a synonym for \'beautiful\'?', '\"Pretty\" là một từ đồng nghĩa với \"beautiful,\" cả hai đều diễn đạt về vẻ đẹp và hấp dẫn.', 1),
(11, 'My sister is a very good ____________', 'Câu này mô tả khả năng của em gái là rất giỏi về việc nào đó, và \"dancer\" (vũ công) là lựa chọn phù hợp trong trường hợp này.', 2),
(12, 'What is a synonym for \'fast\'?', '\"Quick\" là một từ đồng nghĩa với \"fast,\" cả hai diễn đạt về tốc độ nhanh.', 2),
(13, 'What is the opposite of \'happy\'?', '\"Sad\" là trái nghĩa của \"happy,\" với \"happy\" nghĩa là vui vẻ, còn \"sad\" nghĩa là buồn.', 2),
(14, 'Which word is related to \'book\'?', '\"Library\" (thư viện) thường liên quan đến \"book\" (sách) vì thư viện là nơi chứa nhiều sách.', 2),
(15, 'I usually go to the gym to ____________.', 'Trong câu này, \"exercise\" (tập thể dục) là lựa chọn phù hợp để điền vào chỗ trống vì người nói thường đến phòng tập để tập thể dục.', 2),
(16, 'What is a synonym for \'difficult\'?', ' \"Hard\" là một từ đồng nghĩa với \"difficult,\" cả hai diễn đạt ý nghĩa của việc làm gì đó khó khăn hoặc đầy thách thức.', 2),
(17, 'What is the opposite of \'hot\'?', '\"Cold\" là trái nghĩa của \"hot,\" với \"hot\" nghĩa là nóng, còn \"cold\" nghĩa là lạnh.', 2),
(18, 'Which word is related to \'teacher\'?', '\"Student\" (học sinh) thường liên quan đến \"teacher\" (giáo viên) vì học sinh học từ giáo viên.', 2),
(19, 'I enjoy listening to music with my ____________.', 'Trong câu này, \"friends\" (bạn bè) là lựa chọn phù hợp vì người nói thường thích nghe nhạc cùng bạn bè.', 2),
(20, 'What is a synonym for \'tired\'?', '\"Sleepy\" là một từ đồng nghĩa với \"tired,\" cả hai diễn đạt về tình trạng cảm thấy buồn ngủ và mệt mỏi.', 2),
(21, 'Which of the following is a singular pronoun?', '\"She\" là một đại từ số ít (singular) thay thế cho người trong trường hợp này.', 3),
(22, 'What is the past tense of the verb \"to eat\"?', '\"Ate\" là dạng quá khứ của động từ \"to eat.\"', 3),
(23, 'Which of the following words is an adjective?', '\"Happy\" là một tính từ (adjective) mô tả tình trạng của một người hoặc vật.', 3),
(24, 'What is the correct order of words in a basic English sentence?', 'Trong câu tiếng Anh cơ bản, thứ tự thường là \"Subject - Verb - Object.\"', 3),
(25, 'Which of the following sentences is in the present continuous tense?', '\"I am reading a book now\" là câu ở thì hiện tại tiếp diễn.', 3),
(26, 'What is the plural form of \"child\"?', '\"Children\" là hình thức số nhiều của \"child.\"', 3),
(27, 'Which of the following words is a preposition?', '\"Over\" là một giới từ (preposition) thường được sử dụng để chỉ vị trí hoặc hướng di chuyển.', 3),
(28, 'What is the comparative form of the adjective \"good\"?', '\"Better\" là dạng so sánh hơn của \"good.\"', 3),
(29, 'Which of the following is a conjunction?', '\"Because\" là một từ nối (conjunction) được sử dụng để liên kết các câu trong một mệnh đề phụ.', 3),
(30, 'What is the correct form of the verb \"to be\" for the pronoun \"he\" in the present tense?', '\"Is\" là hình thức đúng của động từ \"to be\" cho ngôi thứ ba số ít (he/she/it) trong thì hiện tại.', 3),
(31, 'Choose the correct sentence:', '\"Who is she talking to?\" là câu hỏi đúng về ngữ pháp, sử dụng \"who\" đúng cách để hỏi về người thực hiện hành động.', 4),
(32, 'Identify the type of clause in the sentence: \"Although it was raining, they decided to go for a walk.\"', '\"Although it was raining\" là mệnh đề phụ (dependent clause) vì nó không thể tồn tại một mình và phụ thuộc vào câu chính.', 4),
(33, 'Select the sentence with the correct use of the subjunctive mood:', 'Trong trường hợp này, sử dụng dạng giả định (subjunctive mood) đúng với cấu trúc \"If I were you,\" khi diễn đạt điều gì đó không có thực.', 4),
(34, 'Which sentence is grammatically correct?', 'Sử dụng dấu phẩy để chỉ ra rằng \"that I borrowed\" là mệnh đề quan hệ mô tả thông tin thêm về \"the book.\"', 4),
(35, 'Choose the sentence with the correct parallel structure:', 'Sử dụng cấu trúc song song (parallel structure) đúng với danh từ và động từ \"liking\" theo sau bởi danh từ \"hiking,\" \"swimming,\" và \"reading books.\"', 4),
(36, 'Identify the voice of the verb in the sentence: \"The cake was eaten by the children.\"', 'Câu này sử dụng thì bị động (passive voice) vì nó tập trung vào sự hành động được thực hiện lên đối tượng (cake), không phải là người (children) thực hiện hành động.', 4),
(37, 'Which of the following sentences contains a misplaced modifier?', 'Mệnh đề bị đặt sai vị trí. \"Quickly running\" nên được đặt gần với \"cat\" để diễn đạt rõ ràng hơn.', 4),
(38, 'Choose the correct sentence:', 'Sử dụng từ \"fewer\" để so sánh với số lượng ít hơn và đúng về ngữ pháp.', 4),
(39, 'Select the sentence with the correct use of the word \"its\" or \"it\'s\":', 'Từ \"its\" để chỉ sở hữu của \"the cat\". ', 4),
(40, 'Identify the type of phrase in the sentence: \"To win the race, she trained for months.\"', '\"To win the race\" là một cụm động từ vô nghĩa (infinitive phrase) bắt đầu bằng \"to\" và làm mục tiêu của hành động \"trained.\"', 4),
(41, 'In the annals of scientific discovery, few moments have been as profound as the unearthing of the Higgs boson particle. This tiny, elusive particle, often referred to as the \"God particle,\" holds the key to understanding the very fabric of our universe. The discovery of the Higgs boson was made possible through the efforts of thousands of scientists working at the Large Hadron Collider (LHC) in Switzerland.\\nThe Higgs boson is a subatomic particle that is responsible for giving other particles mass. Without the Higgs boson, the fundamental particles of the universe would remain massless, and there would be no structure or matter as we know it. Its discovery in 2012 was a triumph of modern physics and confirmed the existence of the particle that had been theorized for decades.\\nHowever, the journey to find the Higgs boson was not an easy one. The LHC, a massive particle accelerator, required billions of dollars in funding and years of construction. The experiments conducted at the LHC involved smashing protons together at nearly the speed of light, creating conditions similar to those that existed moments after the Big Bang. It was in these high-energy collisions that the Higgs boson finally revealed itself.\\nThe discovery of the Higgs boson has opened up new avenues of research in the field of particle physics. Scientists are now exploring the implications of this discovery, hoping to unlock the mysteries of dark matter, dark energy, and the fundamental forces of the universe.', 'Higgs boson particle thường được gọi là \"God particle\" trong bài đọc.', 5),
(42, 'In the annals of scientific discovery, few moments have been as profound as the unearthing of the Higgs boson particle. This tiny, elusive particle, often referred to as the \"God particle,\" holds the key to understanding the very fabric of our universe. The discovery of the Higgs boson was made possible through the efforts of thousands of scientists working at the Large Hadron Collider (LHC) in Switzerland.\\nThe Higgs boson is a subatomic particle that is responsible for giving other particles mass. Without the Higgs boson, the fundamental particles of the universe would remain massless, and there would be no structure or matter as we know it. Its discovery in 2012 was a triumph of modern physics and confirmed the existence of the particle that had been theorized for decades.\\nHowever, the journey to find the Higgs boson was not an easy one. The LHC, a massive particle accelerator, required billions of dollars in funding and years of construction. The experiments conducted at the LHC involved smashing protons together at nearly the speed of light, creating conditions similar to those that existed moments after the Big Bang. It was in these high-energy collisions that the Higgs boson finally revealed itself.\\nThe discovery of the Higgs boson has opened up new avenues of research in the field of particle physics. Scientists are now exploring the implications of this discovery, hoping to unlock the mysteries of dark matter, dark energy, and the fundamental forces of the universe.', 'Higgs boson particle chịu trách nhiệm mang lại khối lượng cho các hạt khác.', 5),
(43, 'In the annals of scientific discovery, few moments have been as profound as the unearthing of the Higgs boson particle. This tiny, elusive particle, often referred to as the \"God particle,\" holds the key to understanding the very fabric of our universe. The discovery of the Higgs boson was made possible through the efforts of thousands of scientists working at the Large Hadron Collider (LHC) in Switzerland.\\nThe Higgs boson is a subatomic particle that is responsible for giving other particles mass. Without the Higgs boson, the fundamental particles of the universe would remain massless, and there would be no structure or matter as we know it. Its discovery in 2012 was a triumph of modern physics and confirmed the existence of the particle that had been theorized for decades.\\nHowever, the journey to find the Higgs boson was not an easy one. The LHC, a massive particle accelerator, required billions of dollars in funding and years of construction. The experiments conducted at the LHC involved smashing protons together at nearly the speed of light, creating conditions similar to those that existed moments after the Big Bang. It was in these high-energy collisions that the Higgs boson finally revealed itself.\\nThe discovery of the Higgs boson has opened up new avenues of research in the field of particle physics. Scientists are now exploring the implications of this discovery, hoping to unlock the mysteries of dark matter, dark energy, and the fundamental forces of the universe.', 'Khám phá Higgs boson được thực hiện tại Large Hadron Collider (LHC) ở Thụy Sĩ.', 5),
(44, 'In the annals of scientific discovery, few moments have been as profound as the unearthing of the Higgs boson particle. This tiny, elusive particle, often referred to as the \"God particle,\" holds the key to understanding the very fabric of our universe. The discovery of the Higgs boson was made possible through the efforts of thousands of scientists working at the Large Hadron Collider (LHC) in Switzerland.\\nThe Higgs boson is a subatomic particle that is responsible for giving other particles mass. Without the Higgs boson, the fundamental particles of the universe would remain massless, and there would be no structure or matter as we know it. Its discovery in 2012 was a triumph of modern physics and confirmed the existence of the particle that had been theorized for decades.\\nHowever, the journey to find the Higgs boson was not an easy one. The LHC, a massive particle accelerator, required billions of dollars in funding and years of construction. The experiments conducted at the LHC involved smashing protons together at nearly the speed of light, creating conditions similar to those that existed moments after the Big Bang. It was in these high-energy collisions that the Higgs boson finally revealed itself.\\nThe discovery of the Higgs boson has opened up new avenues of research in the field of particle physics. Scientists are now exploring the implications of this discovery, hoping to unlock the mysteries of dark matter, dark energy, and the fundamental forces of the universe.', 'Tại Large Hadron Collider (LHC), các thí nghiệm vật lý có năng lượng cao được thực hiện.', 5),
(45, 'In the annals of scientific discovery, few moments have been as profound as the unearthing of the Higgs boson particle. This tiny, elusive particle, often referred to as the \"God particle,\" holds the key to understanding the very fabric of our universe. The discovery of the Higgs boson was made possible through the efforts of thousands of scientists working at the Large Hadron Collider (LHC) in Switzerland.\\nThe Higgs boson is a subatomic particle that is responsible for giving other particles mass. Without the Higgs boson, the fundamental particles of the universe would remain massless, and there would be no structure or matter as we know it. Its discovery in 2012 was a triumph of modern physics and confirmed the existence of the particle that had been theorized for decades.\\nHowever, the journey to find the Higgs boson was not an easy one. The LHC, a massive particle accelerator, required billions of dollars in funding and years of construction. The experiments conducted at the LHC involved smashing protons together at nearly the speed of light, creating conditions similar to those that existed moments after the Big Bang. It was in these high-energy collisions that the Higgs boson finally revealed itself.\\nThe discovery of the Higgs boson has opened up new avenues of research in the field of particle physics. Scientists are now exploring the implications of this discovery, hoping to unlock the mysteries of dark matter, dark energy, and the fundamental forces of the universe.', 'Theo bài đọc, các nhà khoa học hy vọng sẽ giải mã các bí ẩn liên quan đến dark matter, dark energy, và các lực cơ bản của vũ trụ thông qua khám phá Higgs boson.', 5),
(56, 'Thank you! That______a lot.', 'Thank you! That helps a lot.', 6),
(57, 'I do not_________.', 'I do not understand.', 6),
(58, 'I am learning________.', 'I am learning English.', 6),
(59, 'What is your________?', 'What is your phone number?', 6),
(60, '______________________.', 'Nice to meet you.', 6),
(61, 'I will be with you in a__________.', 'I will be with you in a moment.', 6),
(62, 'When is the________?', 'When is the deadline?', 6),
(63, 'I was the one who______Tom.', 'I was the one who invited Tom.', 6),
(64, 'Where\'s your_______?', 'Where\'s your boat?', 6),
(65, 'Tom hurt his arm playing__________.', 'Tom hurt his arm playing basketball.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `dap_an_chon`
--

CREATE TABLE `dap_an_chon` (
  `ma_dap_an_chon` int(10) NOT NULL,
  `dap_an_chon` int(10) NOT NULL,
  `ma_lich_su` int(10) NOT NULL,
  `ma_cau_hoi` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `de`
--

CREATE TABLE `de` (
  `ma_de` int(5) NOT NULL,
  `loai` int(1) NOT NULL,
  `ten_de` varchar(50) NOT NULL,
  `bo_de` varchar(50) NOT NULL,
  `cap_do` varchar(50) DEFAULT NULL,
  `thoi_diem_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `thoi_gian_lam_bai` int(10) NOT NULL,
  `nguoi_tham_gia` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `de`
--

INSERT INTO `de` (`ma_de`, `loai`, `ten_de`, `bo_de`, `cap_do`, `thoi_diem_tao`, `thoi_gian_lam_bai`, `nguoi_tham_gia`) VALUES
(1, 0, 'ETP23VO Test 1', 'ETP23VO', 'dễ', '2023-09-30 12:59:32', 0, 1),
(2, 0, 'ETP23VO Test 2', 'ETP23VO', 'dễ', '2023-09-30 12:59:32', 0, 1),
(3, 0, 'ETP23GR Test 1', 'ETP23GR', 'dễ', '2023-10-01 04:01:07', 0, 1),
(4, 0, 'ETP23GR Test 2', 'ETP23GR', 'trung bình', '2023-10-01 04:01:07', 0, 1),
(5, 0, 'ETP23RE Test 1', 'ETP23RE', 'nâng cao', '2023-10-01 05:50:56', 0, 1),
(6, 0, 'ETP23LI Test 1', 'ETP23LI', 'dễ', '2023-10-01 08:51:58', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lich_su_lam_bai`
--

CREATE TABLE `lich_su_lam_bai` (
  `ma_lich_su` int(10) NOT NULL,
  `thoi_gian_lam` int(10) NOT NULL,
  `thoi_diem` timestamp NOT NULL DEFAULT current_timestamp(),
  `diem_so` float NOT NULL,
  `ma_nguoi_dung` int(10) NOT NULL,
  `ma_de` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `ma_nguoi_dung` int(10) NOT NULL,
  `ten_nguoi_dung` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hinh_anh` varchar(150) NOT NULL,
  `ma_vai_tro` int(4) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phan_hoi`
--

CREATE TABLE `phan_hoi` (
  `ma_phan_hoi` int(10) NOT NULL,
  `noi_dung` mediumtext NOT NULL,
  `thoi_diem` timestamp NOT NULL DEFAULT current_timestamp(),
  `trang_thai` int(1) NOT NULL DEFAULT 0,
  `ma_nguoi_dung` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phuong_an`
--

CREATE TABLE `phuong_an` (
  `ma_phuong_an` int(10) NOT NULL,
  `noi_dung` varchar(1000) NOT NULL,
  `phuong_an_dung` int(1) NOT NULL,
  `ma_cau_hoi` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phuong_an`
--

INSERT INTO `phuong_an` (`ma_phuong_an`, `noi_dung`, `phuong_an_dung`, `ma_cau_hoi`) VALUES
(1, 'apples', 0, 1),
(2, 'ice cream', 0, 1),
(3, 'pizza', 0, 1),
(4, 'cake', 1, 1),
(5, 'sad', 0, 2),
(6, 'joyful', 1, 2),
(7, 'angry', 0, 2),
(8, 'hungry', 0, 2),
(9, 'dry', 1, 3),
(10, 'hot', 0, 3),
(11, 'cold', 0, 3),
(12, 'sunny', 0, 3),
(13, 'teacher', 0, 4),
(14, 'patient', 1, 4),
(15, 'chef', 0, 4),
(16, 'farmer', 0, 4),
(17, 'water', 1, 5),
(18, 'milk', 0, 5),
(19, 'juice', 0, 5),
(20, 'coffee', 0, 5),
(21, 'small', 0, 6),
(22, 'tiny', 0, 6),
(23, 'large', 1, 6),
(24, 'huge', 0, 6),
(25, 'dark', 1, 7),
(26, 'light', 0, 7),
(27, 'evening', 0, 7),
(28, 'morning', 0, 7),
(29, 'park', 0, 8),
(30, 'beach', 0, 8),
(31, 'library', 1, 8),
(32, 'zoo', 0, 8),
(33, 'guitar', 1, 9),
(34, 'headphone', 0, 9),
(35, 'cup', 0, 9),
(36, 'laptop', 0, 9),
(37, 'ugly', 0, 10),
(38, 'pretty', 1, 10),
(39, 'handsome', 0, 10),
(40, 'lovely', 0, 10),
(41, 'happy', 0, 11),
(42, 'dancer', 1, 11),
(43, 'laptop', 0, 11),
(44, 'home', 0, 11),
(45, 'slow', 0, 12),
(46, 'quick', 1, 12),
(47, 'tall', 0, 12),
(48, 'strong', 0, 12),
(49, 'sad', 1, 13),
(50, 'joyful', 0, 13),
(51, 'angry', 0, 13),
(52, 'hungry', 0, 13),
(53, 'tree', 0, 14),
(54, 'car', 0, 14),
(55, 'library', 1, 14),
(56, 'beach', 0, 14),
(57, 'cook', 0, 15),
(58, 'swim', 0, 15),
(59, 'exercise', 1, 15),
(60, 'read', 0, 15),
(61, 'easy', 0, 16),
(62, 'hard', 1, 16),
(63, 'simple', 0, 16),
(64, 'complex', 0, 16),
(65, 'cold', 1, 17),
(66, 'warm', 0, 17),
(67, 'sunny', 0, 17),
(68, 'cool', 0, 17),
(69, 'student', 1, 18),
(70, 'doctor', 0, 18),
(71, 'chef', 0, 18),
(72, 'farmer', 0, 18),
(73, 'computer', 0, 19),
(74, 'cat', 0, 19),
(75, 'friends', 1, 19),
(76, 'bicycle', 0, 19),
(77, 'happy', 0, 20),
(78, 'energetic', 0, 20),
(79, 'sleepy', 1, 20),
(80, 'hungry', 0, 20),
(81, 'They', 0, 21),
(82, 'She', 1, 21),
(83, 'We', 0, 21),
(84, 'You', 0, 21),
(85, 'Eat', 0, 22),
(86, 'Eaten', 0, 22),
(87, 'Ate', 1, 22),
(88, 'Eating', 0, 22),
(89, 'Quickly', 0, 23),
(90, 'Run', 0, 23),
(91, 'Happy', 1, 23),
(92, 'Jumped', 0, 23),
(93, 'Verb - Subject - Object', 0, 24),
(94, 'Subject - Verb - Object', 1, 24),
(95, 'Object - Verb - Subject', 0, 24),
(96, 'Subject - Object - Verb', 0, 24),
(97, 'She will go to the store later.', 0, 25),
(98, 'They went to the park yesterday.', 0, 25),
(99, 'I am reading a book now.', 1, 25),
(100, 'He eats pizza on Fridays.', 0, 25),
(101, 'Childs', 0, 26),
(102, 'Childs', 0, 26),
(103, 'Children', 1, 26),
(104, 'Childes', 0, 26),
(105, 'Walk', 0, 27),
(106, 'Over', 1, 27),
(107, 'Run', 0, 27),
(108, 'Quickly', 0, 27),
(109, 'Gooder', 0, 28),
(110, 'Goodest', 0, 28),
(111, 'Better', 1, 28),
(112, 'Best', 0, 28),
(113, 'Dog', 0, 29),
(114, 'Because', 1, 29),
(115, 'Jump', 0, 29),
(116, 'House', 0, 29),
(117, 'Am', 0, 30),
(118, 'Is', 1, 30),
(119, 'Are', 0, 30),
(120, 'Be', 0, 30),
(121, 'Whom is she talking to?', 0, 31),
(122, 'Who is she talking to?', 1, 31),
(123, 'To who is she talking?', 0, 31),
(124, 'She talking to who is?', 0, 31),
(125, 'Independent clause', 0, 32),
(126, 'Dependent clause', 1, 32),
(127, 'Relative clause', 0, 32),
(128, 'Subordinate clause', 0, 32),
(129, 'If I was you, I would apologize.', 0, 33),
(130, 'If I were you, I would apologize.', 1, 33),
(131, 'If I am you, I would apologize.', 0, 33),
(132, 'If I be you, I would apologize.', 0, 33),
(133, 'The book, that I borrowed, is interesting.', 0, 34),
(134, 'The book, I borrowed, is interesting.', 0, 34),
(135, 'The book that I borrowed is interesting.', 1, 34),
(136, 'The book, which I borrowed is interesting.', 0, 34),
(137, 'She likes hiking, swimming, and to read books.', 0, 35),
(138, 'She likes hiking, swimming, and reading books.', 1, 35),
(139, 'She likes hiking, swimming, and she reads books.', 0, 35),
(140, 'She likes hiking, swimming, and books reading.', 0, 35),
(141, 'Active voice', 0, 36),
(142, 'Passive voice', 1, 36),
(143, 'Causative voice', 0, 36),
(144, 'Reflexive voice', 0, 36),
(145, 'Running quickly, the cat chased the mouse.', 0, 37),
(146, 'Quickly running, the mouse was chased by the cat.', 0, 37),
(147, 'The cat chased the mouse running quickly.', 0, 37),
(148, 'The cat chased quickly running the mouse.', 1, 37),
(149, 'Fewer people attended the concert than we expected.', 1, 38),
(150, 'Less people attended the concert than we expected.', 0, 38),
(151, 'Lesser people attended the concert than we expected.', 0, 38),
(152, 'Few people attended the concert than we expected.', 0, 38),
(153, 'Its a beautiful day today.', 0, 39),
(154, 'It\'s a beautiful day today.', 0, 39),
(155, 'The cat chased its tail.', 1, 39),
(156, 'It\'s raining outside, but its not too bad.', 0, 39),
(157, 'Infinitive phrase', 1, 40),
(158, 'Participial phrase', 0, 40),
(159, 'Gerund phrase', 0, 40),
(160, 'Appositive phrase', 0, 40),
(161, 'The Quantum Particle', 0, 41),
(162, 'The Dark Matter Particle', 0, 41),
(163, 'The God Particle', 1, 41),
(164, 'The Neutrino Particle', 0, 41),
(165, 'To generate dark energy', 0, 42),
(166, 'To give other particles mass', 1, 42),
(167, 'To create dark matter', 0, 42),
(168, 'To accelerate particles\r\n\r\n', 0, 42),
(169, 'In the United States', 0, 43),
(170, 'In Japan', 0, 43),
(171, 'In Switzerland', 1, 43),
(172, 'In Russia', 0, 43),
(173, 'Genetic experiments', 0, 44),
(174, 'High-energy physics experiments', 1, 44),
(175, 'Biological experiments', 0, 44),
(176, 'Chemical experiments', 0, 44),
(177, 'The mysteries of DNA', 0, 45),
(178, 'The mysteries of quantum mechanics', 0, 45),
(179, 'The mysteries of dark matter, dark energy, and the fundamental forces of the universe', 1, 45),
(180, 'The mysteries of ocean currents', 0, 45),
(181, 'helps', 1, 56),
(182, 'help', 0, 56),
(183, 'hell', 0, 56),
(184, 'heal', 0, 56),
(185, 'understands', 0, 57),
(186, 'understand', 1, 57),
(187, 'stand', 0, 57),
(188, 'misunderstand', 0, 57),
(189, 'English', 1, 58),
(190, 'Spanish', 0, 58),
(191, 'Chinese', 0, 58),
(192, 'Vietnamese', 0, 58),
(193, 'password', 0, 59),
(194, 'name', 0, 59),
(195, 'phone number', 1, 59),
(196, 'number', 0, 59),
(197, 'Nice to see you', 0, 60),
(198, 'Nice to know you', 0, 60),
(199, 'Nice to talk to you', 0, 60),
(200, 'Nice to meet you', 1, 60),
(201, 'comment', 0, 61),
(202, 'moment', 1, 61),
(203, 'statement', 0, 61),
(204, 'segment', 0, 61),
(205, 'like', 0, 62),
(206, 'look like', 0, 62),
(207, 'deadline', 1, 62),
(208, 'headline', 0, 62),
(209, 'excited', 0, 63),
(210, 'united', 0, 63),
(211, 'delighted ', 0, 63),
(212, 'invited', 1, 63),
(213, 'boat', 1, 64),
(214, 'coat', 0, 64),
(215, 'load', 0, 64),
(216, 'float', 0, 64),
(217, 'baseball', 0, 65),
(218, 'basketball', 1, 65),
(219, 'volleyball', 0, 65),
(220, 'football', 0, 65);

-- --------------------------------------------------------

--
-- Table structure for table `vai_tro`
--

CREATE TABLE `vai_tro` (
  `ma_vai_tro` int(4) NOT NULL,
  `loai_vai_tro` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `am_thanh`
--
ALTER TABLE `am_thanh`
  ADD PRIMARY KEY (`ma_am_thanh`),
  ADD KEY `ma_cau_hoi` (`ma_cau_hoi`);

--
-- Indexes for table `cau_hoi`
--
ALTER TABLE `cau_hoi`
  ADD PRIMARY KEY (`ma_cau_hoi`),
  ADD KEY `ma_de` (`ma_de`);

--
-- Indexes for table `dap_an_chon`
--
ALTER TABLE `dap_an_chon`
  ADD PRIMARY KEY (`ma_dap_an_chon`),
  ADD KEY `dap_an_chon` (`dap_an_chon`),
  ADD KEY `ma_lich_su` (`ma_lich_su`),
  ADD KEY `ma_cau_hoi` (`ma_cau_hoi`);

--
-- Indexes for table `de`
--
ALTER TABLE `de`
  ADD PRIMARY KEY (`ma_de`);

--
-- Indexes for table `lich_su_lam_bai`
--
ALTER TABLE `lich_su_lam_bai`
  ADD PRIMARY KEY (`ma_lich_su`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`),
  ADD KEY `ma_de` (`ma_de`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`ma_nguoi_dung`),
  ADD KEY `ma_vai_tro` (`ma_vai_tro`);

--
-- Indexes for table `phan_hoi`
--
ALTER TABLE `phan_hoi`
  ADD PRIMARY KEY (`ma_phan_hoi`),
  ADD KEY `ma_nguoi_dung` (`ma_nguoi_dung`);

--
-- Indexes for table `phuong_an`
--
ALTER TABLE `phuong_an`
  ADD PRIMARY KEY (`ma_phuong_an`),
  ADD KEY `ma_cau_hoi` (`ma_cau_hoi`);

--
-- Indexes for table `vai_tro`
--
ALTER TABLE `vai_tro`
  ADD PRIMARY KEY (`ma_vai_tro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `am_thanh`
--
ALTER TABLE `am_thanh`
  MODIFY `ma_am_thanh` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cau_hoi`
--
ALTER TABLE `cau_hoi`
  MODIFY `ma_cau_hoi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `dap_an_chon`
--
ALTER TABLE `dap_an_chon`
  MODIFY `ma_dap_an_chon` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `de`
--
ALTER TABLE `de`
  MODIFY `ma_de` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lich_su_lam_bai`
--
ALTER TABLE `lich_su_lam_bai`
  MODIFY `ma_lich_su` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `ma_nguoi_dung` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phan_hoi`
--
ALTER TABLE `phan_hoi`
  MODIFY `ma_phan_hoi` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phuong_an`
--
ALTER TABLE `phuong_an`
  MODIFY `ma_phuong_an` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `ma_vai_tro` int(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `am_thanh`
--
ALTER TABLE `am_thanh`
  ADD CONSTRAINT `ma_cau_hoi` FOREIGN KEY (`ma_cau_hoi`) REFERENCES `cau_hoi` (`ma_cau_hoi`);

--
-- Constraints for table `cau_hoi`
--
ALTER TABLE `cau_hoi`
  ADD CONSTRAINT `cau_hoi_ibfk_1` FOREIGN KEY (`ma_de`) REFERENCES `de` (`ma_de`);

--
-- Constraints for table `dap_an_chon`
--
ALTER TABLE `dap_an_chon`
  ADD CONSTRAINT `dap_an_chon_ibfk_1` FOREIGN KEY (`dap_an_chon`) REFERENCES `phuong_an` (`ma_phuong_an`),
  ADD CONSTRAINT `dap_an_chon_ibfk_2` FOREIGN KEY (`ma_lich_su`) REFERENCES `lich_su_lam_bai` (`ma_lich_su`),
  ADD CONSTRAINT `dap_an_chon_ibfk_3` FOREIGN KEY (`ma_cau_hoi`) REFERENCES `cau_hoi` (`ma_cau_hoi`);

--
-- Constraints for table `lich_su_lam_bai`
--
ALTER TABLE `lich_su_lam_bai`
  ADD CONSTRAINT `lich_su_lam_bai_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `lich_su_lam_bai_ibfk_2` FOREIGN KEY (`ma_de`) REFERENCES `de` (`ma_de`);

--
-- Constraints for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD CONSTRAINT `nguoi_dung_ibfk_1` FOREIGN KEY (`ma_vai_tro`) REFERENCES `vai_tro` (`ma_vai_tro`);

--
-- Constraints for table `phan_hoi`
--
ALTER TABLE `phan_hoi`
  ADD CONSTRAINT `phan_hoi_ibfk_1` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Constraints for table `phuong_an`
--
ALTER TABLE `phuong_an`
  ADD CONSTRAINT `phuong_an_ibfk_1` FOREIGN KEY (`ma_cau_hoi`) REFERENCES `cau_hoi` (`ma_cau_hoi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
