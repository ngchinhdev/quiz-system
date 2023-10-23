-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 05:01 PM
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
(10, 'audio10.mp3', 65),
(23, 'audio20.mp3', 113),
(24, 'audio21.mp3', 116),
(25, 'audio22.mp3', 119),
(26, 'audio24.mp3', 125),
(27, 'audio25.mp3', 129),
(28, 'audio26.mp3', 131),
(29, 'audio27.mp3', 134),
(30, 'audio28.mp3', 139),
(31, 'audio29.mp3', 142),
(32, 'audio30.mp3', 145),
(33, 'audio31.mp3', 148),
(40, 'audio32.mp3', 168),
(41, 'audio33.mp3', 170),
(42, 'audio34.mp3', 171),
(43, 'audio35.mp3', 175),
(44, 'audio36.mp3', 178),
(45, 'audio37.mp3', 183),
(46, 'audio42.mp3', 190),
(47, 'audio43.mp3', 193),
(48, 'audio44.mp3', 195),
(49, 'audio41.mp3', 198),
(50, 'audio39.mp3', 202),
(51, 'audio40.mp3', 203);

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
(2, 'What is a synonym for `happy`?', 'Happy = joyful = hạnh phúc', 1),
(3, 'What is the opposite of `wet`?', '“Dry” là trái nghĩa của “wet”, với “wet” nghĩa là ẩm ướt, còn “dry” nghĩa là khô.', 1),
(4, 'Which word is related to `doctor`?', '`Patient` (bệnh nhân) là người mà `doctor` (bác sĩ) chăm sóc và điều trị, vì vậy `patient` liên quan đến `doctor`.', 1),
(5, 'I like to drink a glass of _________ in the morning.', 'Trong câu này, `water` (nước) là một lựa chọn tự nhiên và phù hợp để điền vào chỗ trống vì nhiều người thường uống nước vào buổi sáng.', 1),
(6, 'What is a synonym for `big`?', '`Large` là một từ đồng nghĩa với `big`, cả hai diễn đạt về kích thước lớn.', 1),
(7, 'What is the opposite of `day`?', '`Dark` là trái nghĩa của `day,` với `day` nghĩa là ban ngày, còn `dark` nghĩa là tối, đêm.', 1),
(8, 'Which word is related to `school`?', '`Library` (thư viện) thường liên quan đến `school` (trường học) vì thư viện thường là một phần của môi trường học tập.', 1),
(9, 'He plays the _________ very well.', 'Dựa vào ngữ cảnh, `piano` là lựa chọn phù hợp, vì người nói đang nói về việc chơi một nhạc cụ cụ thể.', 1),
(10, 'What is a synonym for `beautiful`?', '`Pretty` là một từ đồng nghĩa với `beautiful,` cả hai đều diễn đạt về vẻ đẹp và hấp dẫn.', 1),
(11, 'My sister is a very good ____________', 'Câu này mô tả khả năng của em gái là rất giỏi về việc nào đó, và `dancer` (vũ công) là lựa chọn phù hợp trong trường hợp này.', 2),
(12, 'What is a synonym for `fast`?', '`Quick` là một từ đồng nghĩa với `fast,` cả hai diễn đạt về tốc độ nhanh.', 2),
(13, 'What is the opposite of `happy`?', '`Sad` là trái nghĩa của `happy,` với `happy` nghĩa là vui vẻ, còn `sad` nghĩa là buồn.', 2),
(14, 'Which word is related to `book`?', '`Library` (thư viện) thường liên quan đến `book` (sách) vì thư viện là nơi chứa nhiều sách.', 2),
(15, 'I usually go to the gym to ____________.', 'Trong câu này, `exercise` (tập thể dục) là lựa chọn phù hợp để điền vào chỗ trống vì người nói thường đến phòng tập để tập thể dục.', 2),
(16, 'What is a synonym for `difficult`?', ' `Hard` là một từ đồng nghĩa với `difficult,` cả hai diễn đạt ý nghĩa của việc làm gì đó khó khăn hoặc đầy thách thức.', 2),
(17, 'What is the opposite of `hot`?', '`Cold` là trái nghĩa của `hot,` với `hot` nghĩa là nóng, còn `cold` nghĩa là lạnh.', 2),
(18, 'Which word is related to `teacher`?', '`Student` (học sinh) thường liên quan đến `teacher` (giáo viên) vì học sinh học từ giáo viên.', 2),
(19, 'I enjoy listening to music with my ____________.', 'Trong câu này, `friends` (bạn bè) là lựa chọn phù hợp vì người nói thường thích nghe nhạc cùng bạn bè.', 2),
(20, 'What is a synonym for `tired`?', '`Sleepy` là một từ đồng nghĩa với `tired,` cả hai diễn đạt về tình trạng cảm thấy buồn ngủ và mệt mỏi.', 2),
(21, 'Which of the following is a singular pronoun?', '`She` là một đại từ số ít (singular) thay thế cho người trong trường hợp này.', 3),
(22, 'What is the past tense of the verb `to eat`?', '`Ate` là dạng quá khứ của động từ `to eat.`', 3),
(23, 'Which of the following words is an adjective?', '`Happy` là một tính từ (adjective) mô tả tình trạng của một người hoặc vật.', 3),
(24, 'What is the correct order of words in a basic English sentence?', 'Trong câu tiếng Anh cơ bản, thứ tự thường là `Subject - Verb - Object.`', 3),
(25, 'Which of the following sentences is in the present continuous tense?', '`I am reading a book now` là câu ở thì hiện tại tiếp diễn.', 3),
(26, 'What is the plural form of `child`?', '`Children` là hình thức số nhiều của `child.`', 3),
(27, 'Which of the following words is a preposition?', '`Over` là một giới từ (preposition) thường được sử dụng để chỉ vị trí hoặc hướng di chuyển.', 3),
(28, 'What is the comparative form of the adjective `good`?', '`Better` là dạng so sánh hơn của `good.`', 3),
(29, 'Which of the following is a conjunction?', '`Because` là một từ nối (conjunction) được sử dụng để liên kết các câu trong một mệnh đề phụ.', 3),
(30, 'What is the correct form of the verb `to be` for the pronoun `he` in the present tense?', '`Is` là hình thức đúng của động từ `to be` cho ngôi thứ ba số ít (he/she/it) trong thì hiện tại.', 3),
(31, 'Choose the correct sentence:', '`Who is she talking to?` là câu hỏi đúng về ngữ pháp, sử dụng `who` đúng cách để hỏi về người thực hiện hành động.', 4),
(32, 'Identify the type of clause in the sentence: `Although it was raining, they decided to go for a walk.`', '`Although it was raining` là mệnh đề phụ (dependent clause) vì nó không thể tồn tại một mình và phụ thuộc vào câu chính.', 4),
(33, 'Select the sentence with the correct use of the subjunctive mood:', 'Trong trường hợp này, sử dụng dạng giả định (subjunctive mood) đúng với cấu trúc `If I were you,` khi diễn đạt điều gì đó không có thực.', 4),
(34, 'Which sentence is grammatically correct?', 'Sử dụng dấu phẩy để chỉ ra rằng `that I borrowed` là mệnh đề quan hệ mô tả thông tin thêm về `the book.`', 4),
(35, 'Choose the sentence with the correct parallel structure:', 'Sử dụng cấu trúc song song (parallel structure) đúng với danh từ và động từ `liking` theo sau bởi danh từ `hiking,` `swimming,` và `reading books.`', 4),
(36, 'Identify the voice of the verb in the sentence: `The cake was eaten by the children.`', 'Câu này sử dụng thì bị động (passive voice) vì nó tập trung vào sự hành động được thực hiện lên đối tượng (cake), không phải là người (children) thực hiện hành động.', 4),
(37, 'Which of the following sentences contains a misplaced modifier?', 'Mệnh đề bị đặt sai vị trí. `Quickly running` nên được đặt gần với `cat` để diễn đạt rõ ràng hơn.', 4),
(38, 'Choose the correct sentence:', 'Sử dụng từ `fewer` để so sánh với số lượng ít hơn và đúng về ngữ pháp.', 4),
(39, 'Select the sentence with the correct use of the word `its` or `it`s`:', 'Từ `its` để chỉ sở hữu của `the cat`. ', 4),
(40, 'Identify the type of phrase in the sentence: `To win the race, she trained for months.`', '`To win the race` là một cụm động từ vô nghĩa (infinitive phrase) bắt đầu bằng `to` và làm mục tiêu của hành động `trained.`', 4),
(56, 'Thank you! That______a lot.', 'Thank you! That helps a lot.', 6),
(57, 'I do not_________.', 'I do not understand.', 6),
(58, 'I am learning________.', 'I am learning English.', 6),
(59, 'What is your________?', 'What is your phone number?', 6),
(60, '______________________.', 'Nice to meet you.', 6),
(61, 'I will be with you in a__________.', 'I will be with you in a moment.', 6),
(62, 'When is the________?', 'When is the deadline?', 6),
(63, 'I was the one who______Tom.', 'I was the one who invited Tom.', 6),
(64, 'Where`s your_______?', 'Where`s your boat?', 6),
(65, 'Tom hurt his arm playing__________.', 'Tom hurt his arm playing basketball.', 6),
(111, 'Najeeb __________ gym this evening.', '“is going to” là lựa chọn đúng vì nó thể hiện kế hoạch hoặc dự định của Najeeb trong tương lai gần.', 11),
(112, 'Do you live in an apartment or a ________?', 'Câu hỏi hỏi về loại chỗ ở, và `house` (nhà riêng) là một lựa chọn phổ biến.', 11),
(113, 'Do you_____Facebook?', 'Do you have Facebook?', 11),
(114, 'Our team played __________.', '`Our team played badly` là lựa chọn đúng vì chúng ta đang mô tả cách đội của chúng ta thi đấu trong trường hợp này, và `badly` là trạng từ đúng để thể hiện điều này.', 11),
(115, 'It is the ________ car in the world.', '`fastest` vì câu nói đang mô tả sự so sánh về tốc độ, và `fastest` có nghĩa là nhanh nhất. Câu nói cho biết đó là chiếc xe nhanh nhất trên thế giới.', 11),
(116, 'I really_______your help.', 'I really appreciate your help.', 11),
(117, ' Fatima, Umma and I __________ good friends.', 'Sử dụng động từ `are` (là) để phù hợp với số nhiều.', 11),
(118, 'I recently visited a local museum that featured an impressive collection of art and historical artifacts. One particular exhibit caught my eye - a gallery of ancient Egyptian artifacts. The intricate hieroglyphics, well-preserved mummies, and stunning jewelry left me in awe. As I walked through the exhibit, I couldn`t help but wonder about the lives of the people from that era, the significance of the symbols, and the craftsmanship that went into creating these artifacts. Why did the author visit the local museum?', 'Câu hỏi hỏi về mục đích của tác giả khi thăm bảo tàng, và đáp án `To see art and historical artifacts` tóm tắt chính xác điều này.', 11),
(119, 'That sounds___________!', 'That sounds fantastic!', 11),
(120, 'Breakfast is the first ________ of the day.', 'Câu nói mô tả bữa ăn đầu tiên trong ngày, và từ `meal` (bữa ăn) phù hợp nhất trong ngữ cảnh này.', 11),
(121, 'I bought some pictures when I was __________ holiday __________ December, and now I’m going to hang them __________ the wall.', ' `I bought some pictures when I was on holiday in December, and now I’m going to hang them on the wall.`', 11),
(122, 'Do you have this in a________color?', 'Do you have this in a different color?', 11),
(123, 'Yesterday, I had the opportunity to try a new restaurant in town. The ambiance was cozy, with soft lighting and comfortable seating. I decided to order the chef’s special, a mouthwatering dish of grilled salmon with a lemon-dill sauce. The combination of flavors was exquisite, and I couldn’t resist ordering a dessert, a delectable chocolate lava cake. The entire dining experience was a delightful culinary adventure. What did the author order at the restaurant?', 'Tác giả đã viết rằng họ quyết định gọi món đặc biệt của đầu bếp, một món ăn thịnh soạn là `grilled salmon with a lemon-dill sauce.`', 11),
(124, 'I can‘t walk anymore, I’m ____________ tired.', '`too tired` là đúng vì `too` được sử dụng để diễn đạt mức độ mệt mỏi cao đến mức không thể tiếp tục đi bộ.', 11),
(125, 'How much does this shirt_____?', 'How much does this shirt cost?', 11),
(126, 'He studies maths at university. He’s a _________.', 'Câu nói nói về một người đang học toán ở trường đại học, và từ `student` (sinh viên) là lựa chọn phù hợp để mô tả người này.', 11),
(127, 'I don’t _________ going out tonight.', 'Câu nói nghĩa là `Tôi không cảm thấy muốn đi ra ngoài vào tối nay.`', 11),
(128, 'She doesn’t have brothers or sisters – she’s _________.', 'Đáp án đúng là `an only child.` Câu nói mô tả một người không có anh chị em, và cụm từ `an only child` (đứa con duy nhất) thể hiện điều này.', 11),
(129, 'Can I have this________?', 'Can I have this delivered?', 11),
(130, 'I’m a bit lost. Can you tell me how to _________ to the university?', 'Khi bạn hỏi đường, ‘get to’ là động từ đúng. Bạn cũng có thể sử dụng ’find’ mà không có từ ’to’. Tuy nhiên, chúng ta không sử dụng ‘go to’ trong ngữ cảnh này, mặc dù nó liên quan đến việc đi đâu đó!', 11),
(131, 'He made a joke to _______.', 'He made a joke to break the ice.', 12),
(132, 'The weather was great – it was really _________.', 'Đáp án đúng là `sunny` Câu nói diễn đạt rằng thời tiết rất tốt, và từ `sunny` (nắng) được sử dụng để mô tả thời tiết tốt với nhiều ánh nắng.', 12),
(133, 'I decided to go to the beach today. The weather was perfect, and I wanted to soak up the sun. I brought a book to read, and I spent the entire afternoon by the water, enjoying the sound of the waves. It was a relaxing and enjoyable day. Why did the author go to the beach?', '`To read a book` vì tác giả đi biển để đọc sách. Why did the author go to the beach?', 12),
(134, 'We don’t have to decide what to do tomorrow. We can just______. ', 'We don’t have to decide what to do tomorrow. We can just play it by ear.', 12),
(135, 'Do you want a _________ or a return ticket?', 'Đáp án đúng là `single` Câu hỏi hỏi bạn muốn mua vé một chiều (single) hay vé khứ hồi (return). `Single` ở đây nghĩa là vé một chiều.', 12),
(136, 'He’s a waiter; she’s a _________.', 'Đáp án đúng là `waitress`. `Waitress` được sử dụng để mô tả một phục vụ nữ trong ngành nhà hàng hoặc dịch vụ thực phẩm.', 12),
(137, 'I woke up early this morning and decided to take a long walk in the nearby park. The fresh air and the sound of birds singing were invigorating. I watched the sun rise, casting a warm and golden glow on the landscape. It was a peaceful start to the day.Why did the author decide to go for a walk in the morning?', '`To get some exercise` vì tác giả đi dạo buổi sáng để vận động cơ thể.', 12),
(138, 'What time do you go to _________ every day?', 'Đáp án đúng là `work`. Câu hỏi hỏi bạn đi làm (work) vào lúc mấy giờ mỗi ngày.', 12),
(139, 'It took a while, but I finally_____ my break-up with Chandler.', 'It took a while, but I finally got over my break-up with Chandler.', 12),
(140, 'I love all fruit, but _________ strawberries.', 'Đáp án đúng là `especially`. Câu nói diễn đạt rằng bạn yêu tất cả các loại trái cây, nhưng có một sự ưa thích đặc biệt đối với dâu tây. `Especially` được sử dụng để nhấn mạnh điều này.', 12),
(141, 'Last weekend, I went to a music concert with my friends. The atmosphere was electric, and the band played their most popular songs. We danced, sang along, and enjoyed the music until late in the evening. It was a fantastic night out. Why did the author go to the concert last weekend?', '`To enjoy the music and have a great time with friends` vì tác giả đi xem buổi hòa nhạc để thưởng thức âm nhạc và tận hưởng thời gian tốt bên bạn bè.', 12),
(142, 'I expected the English test to be difficult, but it was______.', 'I expected the English test to be difficult, but it was a piece of cake.', 12),
(143, 'If I were you, I’d leave earlier, so you can avoid the _________.', 'Đáp án đúng là `rush hour`.`Rush hour` thường được sử dụng để mô tả khoảng thời gian trong ngày khi có sự tập trung cao về lưu lượng giao thông, thường vào buổi sáng và buổi tối khi người dân đang đi làm hoặc trở về nhà.', 12),
(144, 'It’s 6.15 – a _________ past six.', 'Đáp án đúng là`quarter`. `A quarter past six` nghĩa là 6:15, khi kim giờ chỉ vào số 3 trên mặt đồng hồ, tương ứng với một phần tư của một giờ.', 12),
(145, 'Okay, everybody! Let’s________for now and start fresh tomorrow.', 'Okay, everybody! Let’s call it a night for now and start fresh tomorrow.', 12),
(146, 'Your father’s brother’s daughter is your _________.', 'Đáp án đúng là `cousin`. Con gái của anh em trai của cha bạn (father`s brother`s daughter) là người cháu họ (cousin) của bạn.', 12),
(147, 'I don’t like my job very much. I’m going to _________ and look for another one.', 'Đáp án đúng là `resign`. Câu nói diễn đạt ý định từ bỏ công việc hiện tại và tìm công việc khác. `Resign` nghĩa là từ chức hoặc nghỉ việc tự nguyện.', 12),
(148, 'I ate my roommate’s cookies, but she didn’t see me do it, so I____________.', 'I ate my roommate’s cookies, but she didn’t see me do it, so I got away with it.', 12),
(149, 'Argh! This noise is giving me a _________.', 'Đáp án đúng là `headache`. Câu nói diễn đạt rằng tiếng ồn gây ra cảm giác đau đầu. `Headache` nghĩa là đau đầu.', 12),
(150, 'Employs in this department always___________ close relations with each other.', ' `Maintain` là động từ ở dạng số nhiều (employees) nên cần sử dụng dạng số nhiều của động từ, chính xác là `maintain.`', 12),
(166, 'It is_______ that you do not reveal your password to anyone.', 'Câu sẽ có nghĩa: `Việc không tiết lộ mật khẩu của bạn cho bất kỳ ai là quan trọng/vô cùng cần thiết.`', 15),
(167, 'Whose bag is this? It’s ________.', 'Câu hỏi ban đầu là `Whose bag is this?` (Túi này của ai?), và câu trả lời cho việc xác định người sở hữu của túi là `mine` (của tôi).', 15),
(168, 'Tom told us about __________.', 'Tom told us about', 15),
(169, 'Put ________ bag on ________ table, then give me ________ apple and ________ bar of chocolate.', 'Put the bag on the table, then give me an apple and a bar of chocolate.', 15),
(170, 'Are you saying ________?', 'Are you saying I`m a coward?', 15),
(171, 'I`d like to live somewhere that doesn`t have _________.', 'I`d like to live somewhere that doesn`t have mosquitoes.', 15),
(172, 'How did this ________ broken?', 'Trong câu này, `get` được sử dụng để hỏi về cách mà một vật phẩm đã bị hỏng hoặc bị thất thoát.', 15),
(173, 'Mount Everest, located in the Himalayas, is the world`s highest peak. Climbing this mountain is a challenge that only a few adventurers undertake each year. The journey to the summit is treacherous, with extreme cold, thin air, and unpredictable weather. Those who succeed in reaching the top are celebrated as heroes, but the ascent is not without its risks. What is the main challenge faced by climbers on Mount Everest, as mentioned in the passage?', 'Đoạn văn đề cập rằng thách thức chính mà những người leo núi trên đỉnh Everest phải đối mặt là cái lạnh cực độ, không khí loãng và thời tiết khó lường.', 15),
(174, 'I drink coffee ________.', 'I drink coffee twice a day.  Câu này diễn tả việc bạn uống cà phê hai lần một ngày.', 15),
(175, 'This is a good ________.', 'This is a good amplifier.', 15),
(176, 'Cats are known for their independent nature. They often go about their day with little need for human interaction. However, they can also be very affectionate and form strong bonds with their owners. Many cat owners find comfort in the gentle purring and companionship of their feline friends. What is a characteristic of cats mentioned in the passage?', 'Đoạn văn đề cập rằng mèo được biết đến với bản chất độc lập.', 15),
(177, 'I found this under the___________.', 'I found this under the porch.', 15),
(178, '____________', 'It`s blood.', 15),
(179, 'That smells good! What ________.', 'That smells good! What are you cooking? Trong câu này, `are you cooking` sử dụng thì hiện tại tiếp diễn để hỏi về hành động đang diễn ra (việc nấu ăn) tại thời điểm nói chuyện.', 15),
(180, 'If I`m Argentinian, I`m from________.', 'If I`m Argentinian, I`m from Argentina..', 15),
(181, 'He’s so _________! I’m not _________ in anything he says.', '`boring` mô tả người đó làm bạn cảm thấy buồn chán. `interested` cho biết bạn không quan tâm đến điều gì người đó đang nói.', 15),
(182, 'Honeybees play a crucial role in pollinating plants and crops, which helps to ensure our food supply. These tiny insects are responsible for the growth of many fruits, vegetables, and nuts. Unfortunately, honeybee populations have been declining in recent years due to various factors, including pesticide use and habitat loss. It is essential to protect and support honeybee populations to maintain a healthy and sustainable environment. Why have honeybee populations been declining in recent years, as mentioned in the passage?', 'Đoạn văn đề cập rằng quần thể ong mật đã giảm trong những năm gần đây do các yếu tố như sử dụng thuốc trừ sâu và mất môi trường sống.', 15),
(183, 'Tom Jackson is planning to run for ________.', 'Tom Jackson is planning to run for governor.', 15),
(184, ' I _________ swimming every Saturday morning.', 'Trong câu này, `go` thể hiện hành động của bạn, đó là việc bạn thường đi bơi vào mỗi sáng thứ Bảy.', 15),
(185, 'My sister`s grandmother is my______.', 'Trong ngữ cảnh này, bà nội của chị tôi cũng là bà nội của tôi.', 15),
(186, 'I spoke to ____.', ' `her` (cô ấy) là đối tượng của động từ `spoke` (nói chuyện). Nó được sử dụng để chỉ người mà bạn đã nói chuyện. `She` (cô ấy) và `his` (của anh ấy) không phù hợp trong ngữ cảnh này, và `there` (ở đó) không phù hợp với cấu trúc câu.', 16),
(187, 'Space exploration has always captured the imagination of humanity. From the first moon landing to the recent Mars rover missions, our curiosity about the cosmos continues to drive scientific discovery. The vastness of the universe, with its countless stars and galaxies, provides an endless source of wonder and intrigue. As technology advances, we are on the verge of new and exciting discoveries that will expand our understanding of the universe. What is the main driving force behind space exploration, as mentioned in the passage?', 'Đoạn văn đề cập rằng động lực chính đằng sau việc khám phá không gian là sự rộng lớn của vũ trụ, nơi mang đến nguồn điều kỳ diệu và hấp dẫn vô tận.', 16),
(188, 'I am seeing her ____ three o`clock.', 'Ở đây, `at` được sử dụng để chỉ thời gian cụ thể - 3 giờ. `In`,  `on`,  và `belong` không phù hợp với ngữ cảnh của câu này.', 16),
(189, 'I go ___ by bus.', 'Ở đây, `home` được sử dụng như một trạng từ để chỉ đích đến hoặc hướng đi của chuyến đi của bạn.', 16),
(190, 'That`s very_________.', 'That`s very suspicious.', 16),
(191, 'Do you like it?', 'Khi bạn được hỏi câu `Do you like it?` (Bạn có thích nó không?), câu trả lời đúng là `Yes, I do` (Có, tôi thích). Câu này sử dụng `do` để khẳng định rằng bạn thực sự thích nó.', 16),
(192, 'Coffee is one of the most popular beverages worldwide. It is enjoyed for its rich flavor and stimulating effects. The coffee plant produces beans that are roasted and ground to make the beverage we know. Coffee culture varies from place to place, with some regions favoring dark roast, while others prefer lighter roast. Many people also enjoy specialty coffee drinks, such as lattes and cappuccinos, which combine espresso with milk and various flavors. What is the primary reason people enjoy coffee, as mentioned in the passage?', 'Đoạn văn đề cập rằng mọi người thưởng thức cà phê vì tác dụng kích thích của nó, khiến nó trở thành lý do chính.', 16),
(193, 'Data can be ______.', 'Data can be falsified.', 16),
(194, 'When shoes are tight they are too:', 'Khi giày chật `tight`, nghĩa là chúng quá `small` (nhỏ).', 16),
(195, 'Tom was holding a hammer and a ______.', 'Tom was holding a hammer and a chisel.', 16),
(196, 'I ___ what she`s saying', ' `Can`t understand` (không thể hiểu) là cách diễn đạt phù hợp trong trường hợp này.', 16),
(197, 'The Great Wall of China is an iconic symbol of ancient engineering and fortification. Built over centuries to protect against invasions, it stretches across northern China for thousands of miles. The wall is a testament to the determination and skill of the builders who created it. In modern times, it has become a major tourist attraction, drawing visitors from around the world who come to marvel at its grandeur. What is the primary purpose of the Great Wall of China, as discussed in the passage?', 'Đoạn văn thảo luận về mục đích chính của Vạn Lý Trường Thành của Trung Quốc, đó là bảo vệ chống lại các cuộc xâm lược.', 16),
(198, 'Have you ever seen________in this area?', 'Have you ever seen geese in this area?', 16),
(199, 'When something tastes disgusting it is:', 'Khi một thứ nào đó có hương vị kinh tởm, từ vựng thích hợp để mô tả nó là `awful`. `Spicy` có nghĩa là cay, `tasty` có nghĩa là ngon và `beautiful` có nghĩa là đẹp.', 16),
(200, 'My uncle lives in the _________. He is undergoing training to be a soldier.', '`barracks` (quân đội) là nơi mà nhân viên quân sự, bao gồm binh sĩ, thường sống trong thời gian họ đang được đào tạo hoặc phục vụ.', 16),
(201, 'She ____ as a doctor.', 'Câu này thể hiện rằng cô ấy làm việc trong vai trò của một bác sĩ. `Works` (làm việc) là động từ phù hợp ở đây.', 16),
(202, 'How large was the_______?', 'How large was the audience?', 16),
(203, 'Tom has a_________smile.', 'Tom has a charming smile.', 16),
(204, 'When something is hilarious it is:', 'Khi một điều gì đó là `hilarious`, nghĩa là nó rất vui và hài hước. Do đó, đáp án là `funny` (đáng cười).', 16),
(205, 'Climate change is a pressing global issue. The Earth`s climate is undergoing significant shifts due to human activities, primarily the burning of fossil fuels and deforestation. These activities release greenhouse gases into the atmosphere, leading to rising global temperatures, extreme weather events, and sea-level rise. Many experts emphasize the need for urgent action to mitigate the effects of climate change, such as reducing carbon emissions, transitioning to renewable energy sources, and conserving forests and ecosystems. What is the primary cause of climate change, as discussed in the passage?', 'Đoạn văn thảo luận rằng nguyên nhân chính của biến đổi khí hậu là nạn phá rừng và phát thải khí nhà kính do hoạt động của con người.', 16),
(218, 'One beautiful Saturday morning, Emily and her family decided to spend the day in the park. They brought a picnic blanket, sandwiches, and a basket of fresh fruit. As they arrived, the children ran towards the playground, laughing and playing on the swings and slides. The adults relaxed on the blanket, enjoying the warm sun and chatting.  What did Emily and her family bring to the park for their day out?', '(Một tấm chăn picnic, bánh mì kẹp, và hoa quả tươi) là đáp án đúng. Đoạn văn cho biết họ đã đóng gói một tấm chăn picnic, bánh mì kẹp và hoa quả tươi.', 19),
(219, 'Last weekend, my family and I decided to visit the local zoo. We were excited to see a variety of animals, from playful monkeys to majestic lions. The zoo had well-designed enclosures that mimicked the animals natural habitats. As we strolled through the park, we watched the penguins waddle, the giraffes graze, and the colorful birds fly. It was a day filled with wonder and learning as we discovered fascinating facts about the animal kingdom. What did the family do last weekend?', ' (Thăm vườn thú địa phương) là đáp án đúng. Đoạn văn mô tả gia đình đã quyết định thăm vườn thú địa phương.', 19),
(220, 'Last weekend, Jake and his friends decided to go camping in the woods. They packed their backpacks with tents, sleeping bags, and plenty of snacks. When they reached the campsite, they set up their tents near a beautiful, glistening lake. As the sun set, they made a campfire and roasted marshmallows. They told stories and looked up at the starry sky, feeling a sense of wonder and adventure. What did Jake and his friends pack for their camping trip?', '(Lều trại, túi ngủ và đồ ăn vặt) là đáp án đúng. Đoạn văn cho biết họ đã đóng gói lều trại, túi ngủ và đồ ăn vặt.', 19),
(221, 'Linda loves to read books. She has a huge collection of novels and enjoys spending her weekends at the library. Yesterday, she borrowed a new mystery novel. She sat in her favorite chair and started reading. As the story unfolded, Linda couldn`t put the book down. She was so engrossed that she read until late at night. When did Linda start reading her new book?', 'Linda bắt đầu đọc cuốn sách mới của mình `ngày hôm qua` khi cô ấy mượn nó từ thư viện.', 19),
(222, 'John loves to play sports. His favorite sport is basketball, and he practices every evening at the local park. Yesterday, he had a special basketball game with his friends. What sport does John enjoy the most?', 'Môn thể thao yêu thích của John là bóng rổ, như được đề cập rõ ràng trong đoạn văn.', 19),
(223, 'Amy and her family went on a vacation to the beach last summer. They stayed in a cozy beachfront cottage for a week. Each morning, they woke up to the sound of waves crashing against the shore. They spent their days building sandcastles, swimming in the ocean, and collecting seashells. In the evenings, they watched the sunset from their porch while enjoying ice cream. What did Amy and her family do in the evenings during their vacation?', 'Amy và gia đình cô ấy đã ngắm hoàng hôn từ hiên nhà vào buổi tối trong kỳ nghỉ của họ.', 19),
(224, 'Mark is a dedicated gardener. He spends hours each day tending to his plants and flowers. His garden is a beautiful display of colorful blooms, and he takes great pride in it. Mark`s favorite part is the rose garden in the corner, which he carefully nurtures. Last week, he entered his prized roses into a local flower show, hoping to win a blue ribbon. What is Mark`s favorite part of his garden?', 'Phần yêu thích của Mark trong khu vườn của anh ấy là vườn hoa hồng ở góc.', 19),
(225, 'Samantha is a passionate baker. She spends her weekends experimenting with new recipes in her cozy kitchen. Her specialty is making delicious cupcakes with various flavors of frosting. Last Sunday, she baked a batch of chocolate cupcakes with mint chocolate chip frosting, and they turned out fantastic. What is Samantha`s specialty in baking?', 'Chuyên môn làm bánh của Samantha là làm những chiếc bánh cupcake với nhiều hương vị phủ kem khác nhau,', 19),
(226, 'Michael is an avid traveler. He`s visited many countries and enjoys exploring new cultures and cuisines. Last summer, he went on an adventure to Thailand. During his trip, he savored delicious street food, hiked through lush jungles, and marveled at ancient temples. What did Michael do during his trip to Thailand last summer?', 'Trong chuyến đi đến Thái Lan vào mùa hè năm ngoái, Michael đã thưởng thức những món ăn đường phố ngon tuyệt, đi bộ xuyên qua những khu rừng tươi tốt và ngạc nhiên trước những ngôi chùa cổ kính.', 19),
(227, 'Emma is an animal lover. She volunteers at the local animal shelter, taking care of dogs and cats waiting to find their forever homes. She enjoys long walks with the shelter dogs and spends her time playing with the kittens. Last weekend, she helped organize an adoption event, and several animals found loving families. What does Emma do to help animals at the local shelter?', 'Emma giúp đỡ động vật tại nơi trú ẩn địa phương bằng cách tình nguyện và chăm sóc chó mèo.', 19);

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

--
-- Dumping data for table `dap_an_chon`
--

INSERT INTO `dap_an_chon` (`ma_dap_an_chon`, `dap_an_chon`, `ma_lich_su`, `ma_cau_hoi`) VALUES
(1, 42, 1, 11),
(2, 48, 1, 12),
(3, 52, 1, 13),
(4, 56, 1, 14),
(5, 60, 1, 15),
(6, 64, 1, 16),
(7, 68, 1, 17),
(8, 72, 1, 18),
(9, 76, 1, 19),
(10, 80, 1, 20),
(11, 4, 2, 1),
(12, 6, 2, 2),
(13, 12, 2, 3),
(14, 14, 2, 4),
(15, 17, 2, 5),
(16, 23, 2, 6),
(17, 27, 2, 7),
(18, 32, 2, 8),
(19, 33, 2, 9),
(20, 38, 2, 10),
(21, 42, 3, 11),
(22, 46, 3, 12),
(23, 50, 3, 13),
(24, 53, 3, 14),
(25, 60, 3, 15),
(26, 63, 3, 16),
(27, 66, 3, 17),
(28, 69, 3, 18),
(29, 76, 3, 19),
(30, 79, 3, 20),
(31, 181, 4, 56),
(32, 186, 4, 57),
(33, 189, 4, 58),
(34, 196, 4, 59),
(35, 199, 4, 60),
(36, 202, 4, 61),
(37, 207, 4, 62),
(38, 209, 4, 63),
(39, 215, 4, 64),
(40, 219, 4, 65),
(41, 404, 5, 111),
(42, 406, 5, 112),
(43, 409, 5, 113),
(44, 414, 5, 114),
(45, 420, 5, 115),
(46, 421, 5, 116),
(47, 426, 5, 117),
(48, 429, 5, 118),
(49, 433, 5, 119),
(50, 437, 5, 120),
(51, 443, 5, 121),
(52, 445, 5, 122),
(53, 449, 5, 123),
(54, 453, 5, 124),
(55, 459, 5, 125),
(56, 464, 5, 126),
(57, 466, 5, 127),
(58, 469, 5, 128),
(59, 473, 5, 129),
(60, 480, 5, 130);

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
(1, 0, 'ETP23VO Test 1', 'ETP23VO', 'dễ', '2023-09-30 12:59:32', 0, 2),
(2, 0, 'ETP23VO Test 2', 'ETP23VO', 'dễ', '2023-09-30 12:59:32', 0, 3),
(3, 0, 'ETP23GR Test 1', 'ETP23GR', 'dễ', '2023-10-01 04:01:07', 0, 1),
(4, 0, 'ETP23GR Test 2', 'ETP23GR', 'trung bình', '2023-10-01 04:01:07', 0, 1),
(6, 0, 'ETP23LI Test 1', 'ETP23LI', 'dễ', '2023-10-01 08:51:58', 0, 2),
(11, 1, 'ETP23EX Exam 1', 'ETP23EX', NULL, '2023-10-17 14:31:46', 600, 1),
(12, 1, 'ETP23EX Exam 2', 'ETP23EX', NULL, '2023-10-17 15:27:47', 600, 0),
(15, 1, 'ETP23EX Exam 3', 'ETP23EX', NULL, '2023-10-18 15:55:28', 600, 0),
(16, 1, 'ETP23EX Exam 4', 'ETP23EX', NULL, '2023-10-19 03:16:22', 600, 0),
(19, 0, 'ETP23RE Test 1', 'ETP23RE', 'dễ', '2023-10-19 14:21:00', 0, 0);

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

--
-- Dumping data for table `lich_su_lam_bai`
--

INSERT INTO `lich_su_lam_bai` (`ma_lich_su`, `thoi_gian_lam`, `thoi_diem`, `diem_so`, `ma_nguoi_dung`, `ma_de`) VALUES
(1, 17, '2023-10-17 12:23:31', 0, 3, 2),
(2, 33, '2023-10-17 12:24:47', 6, 3, 1),
(3, 19, '2023-10-17 12:25:41', 4, 3, 2),
(4, 37, '2023-10-17 12:29:57', 5, 3, 6),
(5, 141, '2023-10-17 14:35:26', 20, 3, 11);

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

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`ma_nguoi_dung`, `ten_nguoi_dung`, `email`, `hinh_anh`, `ma_vai_tro`) VALUES
(2, 'Chinh Nguyen', 'chinhnguyennn24@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocLOxaLoUnmRP_HqzP8pdw852BbbV2aMv1yKsdOrqK44IZ4=s96-c', 1),
(3, 'Nguyen Ngoc Chinh (FPL HCM)', 'chinhnnps31717@fpt.edu.vn', 'https://lh3.googleusercontent.com/a/ACg8ocIWbUVT-iZSePO6MPsZLei2O7jysMgPogjOrFr7cNSe=s96-c', 2);

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
(154, 'It`s a beautiful day today.', 0, 39),
(155, 'The cat chased its tail.', 1, 39),
(156, 'It`s raining outside, but its not too bad.', 0, 39),
(157, 'Infinitive phrase', 1, 40),
(158, 'Participial phrase', 0, 40),
(159, 'Gerund phrase', 0, 40),
(160, 'Appositive phrase', 0, 40),
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
(220, 'football', 0, 65),
(401, 'will go', 0, 111),
(402, 'will come', 0, 111),
(403, 'is going', 0, 111),
(404, 'is going to', 1, 111),
(405, 'village', 0, 112),
(406, 'house', 1, 112),
(407, 'bridge', 0, 112),
(408, 'city', 0, 112),
(409, 'have', 1, 113),
(410, 'had', 0, 113),
(411, 'has', 0, 113),
(412, 'hat', 0, 113),
(413, 'bad', 0, 114),
(414, 'badly', 1, 114),
(415, 'good', 0, 114),
(416, 'well done', 0, 114),
(417, 'tallest', 0, 115),
(418, 'highest', 0, 115),
(419, 'tastiest', 0, 115),
(420, 'fastest', 1, 115),
(421, 'appreciate', 1, 116),
(422, 'appropriate ', 0, 116),
(423, 'in appropriate', 0, 116),
(424, 'activate', 0, 116),
(425, 'am', 0, 117),
(426, 'are', 1, 117),
(427, 'been', 0, 117),
(428, 'is', 0, 117),
(429, 'To see art and historical artifacts.', 1, 118),
(430, 'To buy ancient Egyptian artifacts.', 0, 118),
(431, 'To meet people from that era.', 0, 118),
(432, 'To study hieroglyphics.', 0, 118),
(433, 'fantastic', 1, 119),
(434, 'titanic', 0, 119),
(435, 'active', 0, 119),
(436, 'architec', 0, 119),
(437, 'meal', 1, 120),
(438, 'eatings', 0, 120),
(439, 'time', 0, 120),
(440, 'food', 0, 120),
(441, 'in, in, along', 0, 121),
(442, 'on, for, on', 0, 121),
(443, 'on, in, on', 1, 121),
(444, 'on, in, along', 0, 121),
(445, 'different', 1, 122),
(446, 'deferent', 0, 122),
(447, 'diffident', 0, 122),
(448, 'deforest', 0, 122),
(449, 'Grilled salmon with a lemon-dill sauce.', 1, 123),
(450, 'A cozy atmosphere.', 0, 123),
(451, 'A dessert.', 0, 123),
(452, 'Soft lighting.', 0, 123),
(453, 'too', 1, 124),
(454, 'so', 0, 124),
(455, 'such', 0, 124),
(456, 'so such', 0, 124),
(457, 'cast', 0, 125),
(458, 'coast', 0, 125),
(459, 'cost', 1, 125),
(460, 'course', 0, 125),
(461, 'studier', 0, 126),
(462, 'professor', 0, 126),
(463, 'pupil', 0, 126),
(464, ' student', 1, 126),
(465, 'have mood to', 0, 127),
(466, ' feel like', 1, 127),
(467, ' want to', 0, 127),
(468, 'like', 0, 127),
(469, 'an only child', 1, 128),
(470, 'an alone child', 0, 128),
(471, 'a single child', 0, 128),
(472, 'a lonely child', 0, 128),
(473, 'delivered', 1, 129),
(474, 'deliberated', 0, 129),
(475, 'dilapidated', 0, 129),
(476, 'delighted', 0, 129),
(477, 'reach', 0, 130),
(478, 'go', 0, 130),
(479, 'find', 0, 130),
(480, 'get', 1, 130),
(481, 'break the ice', 1, 131),
(482, 'break the neck', 0, 131),
(483, 'break the record', 0, 131),
(484, 'break the seal', 0, 131),
(485, 'strong sun', 0, 132),
(486, 'sunshine', 0, 132),
(487, 'sun ', 0, 132),
(488, 'sunny', 1, 132),
(489, 'To read a book.', 1, 133),
(490, 'To avoid the sun.', 0, 133),
(491, 'To go swimming.', 0, 133),
(492, 'To listen to music.', 0, 133),
(493, 'play it by ear', 1, 134),
(494, 'play it by eye', 0, 134),
(495, 'play it by bear', 0, 134),
(496, 'play it by beer', 0, 134),
(497, 'lonely', 0, 135),
(498, 'single', 1, 135),
(499, 'outbound', 0, 135),
(500, 'one-journey', 0, 135),
(501, 'waiter', 0, 136),
(502, 'waitress', 1, 136),
(503, 'waiteress', 0, 136),
(504, 'waitree', 0, 136),
(505, 'To watch TV.', 0, 137),
(506, 'To get some exercise.', 1, 137),
(507, 'To take a nap.', 0, 137),
(508, 'To eat breakfast.', 0, 137),
(509, 'workplace', 0, 138),
(510, 'job', 0, 138),
(511, 'work', 1, 138),
(512, 'office', 0, 138),
(513, 'got over', 1, 139),
(514, 'get over', 0, 139),
(515, 'go over', 0, 139),
(516, 'went over', 0, 139),
(517, 'mostly', 0, 140),
(518, 'specifically', 0, 140),
(519, 'specially', 0, 140),
(520, 'especially', 1, 140),
(521, 'To have dinner with friends.', 0, 141),
(522, 'To watch a movie.', 0, 141),
(523, 'To enjoy the music and have a great time with friends.', 1, 141),
(524, 'To go shopping.', 0, 141),
(525, 'a piece of cat', 0, 142),
(526, 'a piece of cast', 0, 142),
(527, 'a piece of case', 0, 142),
(528, 'a piece of cake', 1, 142),
(529, 'rush hour', 1, 143),
(530, 'peak hour', 0, 143),
(531, 'peak time', 0, 143),
(532, 'traffic time', 0, 143),
(533, 'quarter', 1, 144),
(534, 'half', 0, 144),
(535, 'fifteen', 0, 144),
(536, 'fourth', 0, 144),
(537, 'call it a fight', 0, 145),
(538, 'call it a night', 1, 145),
(539, 'call it a light', 0, 145),
(540, 'call it a knight', 0, 145),
(541, 'cousin', 1, 146),
(542, 'niece', 0, 146),
(543, 'sister', 0, 146),
(544, 'cousina', 0, 146),
(545, 'resign', 1, 147),
(546, 'finish', 0, 147),
(547, 'retire', 0, 147),
(548, 'fire', 0, 147),
(549, 'get away with it', 0, 148),
(550, 'got away with it', 1, 148),
(551, 'take away with it', 0, 148),
(552, 'took away with it', 0, 148),
(553, 'headouch', 0, 149),
(554, 'headpain', 0, 149),
(555, 'headhurt', 0, 149),
(556, 'headache', 1, 149),
(557, 'maintain', 1, 150),
(558, 'maintains', 0, 150),
(559, 'maintained', 0, 150),
(560, 'maintenance', 0, 150),
(617, 'assential', 1, 166),
(618, 'assence', 0, 166),
(619, 'expert', 0, 166),
(620, 'exact', 0, 166),
(621, 'of me', 0, 167),
(622, 'mine', 1, 167),
(623, 'the mine', 0, 167),
(624, 'my', 0, 167),
(625, 'the expulsion the explosion.', 0, 168),
(626, 'the explosion', 1, 168),
(627, 'the extension', 0, 168),
(628, 'the extraction', 0, 168),
(629, ' the … the … an … a', 1, 169),
(630, 'a … a … the … the', 0, 169),
(631, ' a … the … an … the', 0, 169),
(632, 'the … the … a … a', 0, 169),
(633, 'I`m a coward', 1, 170),
(634, 'I`m a cloud ', 0, 170),
(635, 'I`m a cow', 0, 170),
(636, 'I`m a cure', 0, 170),
(637, 'moss-covered', 0, 171),
(638, 'mouse', 0, 171),
(639, 'mosquitoes', 1, 171),
(640, 'mosque ', 0, 171),
(641, 'was', 0, 172),
(642, 'get', 1, 172),
(643, 'become', 0, 172),
(644, 'be', 0, 172),
(645, 'The mountain`s location in the Himalayas.', 0, 173),
(646, 'Extreme cold, thin air, and unpredictable weather.', 1, 173),
(647, 'The limited number of adventurers who undertake the climb.', 0, 173),
(648, 'The celebration of successful climbers as heroes.', 0, 173),
(649, 'twice in day', 0, 174),
(650, 'two times for a day', 0, 174),
(651, 'two times day', 0, 174),
(652, ' twice a day', 1, 174),
(653, 'ample fire', 0, 175),
(654, 'ample fryer', 0, 175),
(655, 'sample lia', 0, 175),
(656, 'amplifier', 1, 175),
(657, 'Cats are always in need of human interaction.', 0, 176),
(658, 'Cats are not capable of forming strong bonds with their owners.', 0, 176),
(659, 'Cats are known for their independent nature.', 1, 176),
(660, 'Cats are known for their constant barking.', 0, 176),
(661, 'portch ', 0, 177),
(662, 'porch', 1, 177),
(663, 'poorch ', 0, 177),
(664, 'parch ', 0, 177),
(665, 'It`s bud.', 0, 178),
(666, 'It`s blood.', 1, 178),
(667, 'It`s flood.', 0, 178),
(668, 'It`s blued.', 0, 178),
(669, 'do you cook?', 0, 179),
(670, 'do you cooking?', 0, 179),
(671, ' are you cooking?', 1, 179),
(672, 'are you cook?', 0, 179),
(673, 'Argentina', 1, 180),
(674, 'Brazil', 0, 180),
(675, 'Vietnam', 0, 180),
(676, 'China', 0, 180),
(677, 'boring … interesting', 0, 181),
(678, 'boring … interested', 1, 181),
(679, 'bored … interesting', 0, 181),
(680, 'bored … interested', 0, 181),
(681, 'Honeybees are not responsible for pollinating plants.', 0, 182),
(682, 'An increase in the availability of flowers and crops.', 0, 182),
(683, 'The use of pesticides and habitat loss.', 1, 182),
(684, 'Honeybees are not essential for a healthy environment.', 0, 182),
(685, 'govern her', 0, 183),
(686, 'governor', 1, 183),
(687, 'government', 0, 183),
(688, 'governing', 0, 183),
(689, 'play', 0, 184),
(690, 'go', 1, 184),
(691, 'do', 0, 184),
(692, 'take', 0, 184),
(693, 'grandmother', 1, 185),
(694, 'mother', 0, 185),
(695, 'aunt', 0, 185),
(696, 'sister', 0, 185),
(697, 'her', 1, 186),
(698, 'she', 0, 186),
(699, 'his', 0, 186),
(700, 'there', 0, 186),
(701, 'The vastness of the universe.', 1, 187),
(702, 'The recent Mars rover missions.', 0, 187),
(703, 'The first moon landing.', 0, 187),
(704, 'The technology used in space exploration.', 0, 187),
(705, 'in', 0, 188),
(706, 'at', 1, 188),
(707, 'on', 0, 188),
(708, 'belong', 0, 188),
(709, 'home', 1, 189),
(710, 'to home', 0, 189),
(711, 'the home', 0, 189),
(712, 'to go home', 0, 189),
(713, 'vicious', 0, 190),
(714, 'suspicion', 0, 190),
(715, 'spacious', 0, 190),
(716, 'suspicious', 1, 190),
(717, 'Yes, I like.', 0, 191),
(718, 'Yes, I do.', 1, 191),
(719, 'No, I do.', 0, 191),
(720, 'No, I like', 0, 191),
(721, 'The popularity of lattes and cappuccinos.', 0, 192),
(722, 'The various flavors available in coffee.', 0, 192),
(723, 'The stimulating effects of coffee.', 1, 192),
(724, 'The coffee plant`s beans and their roasting.', 0, 192),
(725, 'falsified', 1, 193),
(726, 'falsify', 0, 193),
(727, 'finalized ', 0, 193),
(728, 'fossilized ', 0, 193),
(729, 'colourful', 0, 194),
(730, 'big', 0, 194),
(731, 'small', 1, 194),
(732, 'large', 0, 194),
(733, 'chiseled', 0, 195),
(734, 'chisel', 1, 195),
(735, 'chiseler', 0, 195),
(736, 'chiseled-out', 0, 195),
(737, 'can`t understand', 1, 196),
(738, 'am not understanding', 0, 196),
(739, 'did understand', 0, 196),
(740, 'understanding', 0, 196),
(741, 'To attract tourists from around the world.', 0, 197),
(742, 'To symbolize ancient engineering and fortification.', 0, 197),
(743, 'To stretch across northern China for thousands of miles.', 0, 197),
(744, 'To protect against invasions.', 1, 197),
(745, 'geese', 1, 198),
(746, 'sneeze ', 0, 198),
(747, 'freeze', 0, 198),
(748, 'cheese', 0, 198),
(749, 'spicy', 0, 199),
(750, 'tasty', 0, 199),
(751, 'awful', 1, 199),
(752, 'beautiful', 0, 199),
(753, 'house', 0, 200),
(754, 'barracks', 1, 200),
(755, 'hostel', 0, 200),
(756, 'college', 0, 200),
(757, 'is', 0, 201),
(758, 'works', 1, 201),
(759, 'were', 0, 201),
(760, 'are', 0, 201),
(761, 'audience', 1, 202),
(762, 'audiences ', 0, 202),
(763, 'audition ', 0, 202),
(764, 'obedience ', 0, 202),
(765, 'farming ', 0, 203),
(766, 'alarming ', 0, 203),
(767, 'charming', 1, 203),
(768, 'charging ', 0, 203),
(769, 'sad', 0, 204),
(770, 'scary', 0, 204),
(771, 'funny', 1, 204),
(772, 'stupid', 0, 204),
(773, 'Extreme weather events.', 0, 205),
(774, 'Rising global temperatures.', 0, 205),
(775, 'Deforestation and greenhouse gas emissions.', 1, 205),
(776, 'Conservation of forests and ecosystems.', 0, 205),
(825, 'A soccer ball and a frisbee', 0, 218),
(826, 'A picnic blanket, sandwiches, and fresh fruit', 1, 218),
(827, 'Fishing rods and bait', 0, 218),
(828, 'Paints and brushes for an art project', 0, 218),
(829, 'Went shopping at the mall.', 0, 219),
(830, 'Went on a picnic in the park.', 0, 219),
(831, 'Visited the local zoo.', 1, 219),
(832, 'Watched a movie at home.', 0, 219),
(833, 'Winter coats and snowshoes', 0, 220),
(834, 'Tents, sleeping bags, and snacks', 1, 220),
(835, 'Swimsuits and surfboards', 0, 220),
(836, 'Gardening tools and flower seeds', 0, 220),
(837, 'In the morning', 0, 221),
(838, 'In her favorite chair', 0, 221),
(839, 'Yesterday', 1, 221),
(840, 'At the library', 0, 221),
(841, 'Soccer', 0, 222),
(842, 'Football', 0, 222),
(843, 'Basketball', 1, 222),
(844, 'Baseball', 0, 222),
(845, 'Watched TV', 0, 223),
(846, 'Played board games', 0, 223),
(847, 'Watched the sunset from their porch', 1, 223),
(848, 'Went to a restaurant', 0, 223),
(849, 'Tending to his plants and flowers', 0, 224),
(850, 'The colorful blooms', 0, 224),
(851, 'Winning a blue ribbon', 0, 224),
(852, 'The rose garden in the corner', 1, 224),
(853, 'Cookies', 0, 225),
(854, 'Cupcakes with various flavors of frosting', 1, 225),
(855, 'Bread', 0, 225),
(856, 'Pies', 0, 225),
(857, 'Savored delicious street food, hiked through lush jungles, and marveled at ancient temples', 1, 226),
(858, ' Explored new cultures and cuisines', 0, 226),
(859, 'Went skiing', 0, 226),
(860, 'Attended a music festival', 0, 226),
(861, 'Emma works at a restaurant', 0, 227),
(862, 'Emma takes care of dogs and cats at the animal shelter', 1, 227),
(863, 'Emma is a veterinarian', 0, 227),
(864, 'Emma is a professional pet trainer', 0, 227);

-- --------------------------------------------------------

--
-- Table structure for table `vai_tro`
--

CREATE TABLE `vai_tro` (
  `ma_vai_tro` int(4) NOT NULL,
  `loai_vai_tro` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vai_tro`
--

INSERT INTO `vai_tro` (`ma_vai_tro`, `loai_vai_tro`) VALUES
(1, 'admin'),
(2, 'user');

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
  MODIFY `ma_am_thanh` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `cau_hoi`
--
ALTER TABLE `cau_hoi`
  MODIFY `ma_cau_hoi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `dap_an_chon`
--
ALTER TABLE `dap_an_chon`
  MODIFY `ma_dap_an_chon` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `de`
--
ALTER TABLE `de`
  MODIFY `ma_de` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lich_su_lam_bai`
--
ALTER TABLE `lich_su_lam_bai`
  MODIFY `ma_lich_su` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `ma_nguoi_dung` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `phan_hoi`
--
ALTER TABLE `phan_hoi`
  MODIFY `ma_phan_hoi` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phuong_an`
--
ALTER TABLE `phuong_an`
  MODIFY `ma_phuong_an` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=865;

--
-- AUTO_INCREMENT for table `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `ma_vai_tro` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
