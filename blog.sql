SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `blog`
--

-- --------------------------------------------------------

--login
CREATE TABLE IF NOT EXISTS `accounts` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
  	`username` varchar(50) NOT NULL,
  	`password` varchar(255) NOT NULL,
  	`email` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`id`, `username`, `password`, `email`) VALUES 
(1, 'test', '123', 'test@test.com'),
(2, 'ngan', '123', 'ngan@gmail.com'),
(3, 'tra', '123', 'tra@gmail.com'),
(4, 'nganhuynh', '123', 'ngan@gmail.com'),
(5, 'admin', '123', 'admin@gmail.com');

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2,'DATABASE'),
(3, 'HTML'),
(4, 'CSS'),
(6, 'JAVASCRIPT'),
(7, 'PHP'),
(8, 'JQUERY'),
(9, 'JSON');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `cat_id` int(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `contents` text NOT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `cat_id`, `title`, `contents`, `date_posted`) VALUES
(6, 2, 'MySQL Database', 'MySQL is an Open Source relational database Management System. MySQL operates on almost every platform UNIX, Linux, and Windows. Although MySQL is used for a large number of applications, it is most frequently associated with web applications and online publications. MySQL is an important component of the LAMP open-source stack. LAMP is a development platform for Linux, Apache, and the webserver as the operating system.','2021-12-23 20:21:54'),
(8, 3,'What is HTML?', 'HTML stands for Hyper Text Markup Language \r\nHTML is the standard markup language for creating Web pages \r\nHTML describes the structure of a Web page \r\nHTML consists of a series of elements \r\nHTML elements tell the browser how to display the content \r\nHTML elements label pieces of content such as "this is a heading", "this is a paragraph", "this is a link", etc.', '2021-12-14 22:20:11'),
(9, 4, 'CSS là gì ?', 'CSS là viết tắt của Cascading Style Sheet, là một Design Language đơn giản được sử dụng để làm đơn giản hóa tiến trình trình bày các trang web.
\r\nSử dụng CSS, bạn có thể điều khiển màu văn bản (text color), font style, khoảng cách giữa các đoạn văn, kích cỡ các cột, hình nền hoặc màu nền,...
\r\nNói chung, học CSS là khá đơn giản. Bạn sẽ tìm thấy điều này sau khi đọc loạt bài hướng dẫn về CSS của chúng mình. Để giúp bạn học tập và thực hành một cách tốt nhất, chúng mình cung cấp rất nhiều ví dụ minh họa và kèm theo phần giải thích chi tiết giúp bạn hiểu nhanh và sâu hơn chủ đề vừa đọc.
\r\nNhúng CSS trong HTML sử dụng phần tử thẻ tag "style"
\r\nCách này đơn giản và nên chỉ áp dụng với những ứng dụng webpage nhỏ. Bạn có thể nhúng CSS vào trong tài liệu HTML của bạn bởi sử dụng phần tử style. Thẻ này được đặt bên trong các thẻ <head>...</head>. Style Rule được định nghĩa trong khu vực này sẽ chỉ tác động đến các phần tử trong nội bộ trang đó.
\r\nMàu trong CSS
\r\nCSS sử dụng các giá trị màu để xác định màu sắc hiển thị. Bạn có thể thiết lập màu nền (background) hoặc màu cận cảnh (foreground) của một phần tử, hoặc màu của đường viền hay đường bao của một khung hoặc một bảng. Màu được hiển thị bởi kết hợp ba màu là RED, GREEN, và BLUE.', '2021-12-14 21:59:34'),
(10, 6, 'Javascript là gì?', 'Javascript là một ngôn ngữ lập trình kịch bản dựa vào đối tượng phát triển có sẵn hoặc tự định nghĩa. Javascript được sử dụng rộng rãi trong các ứng dụng Website. Javascript được hỗ trợ hầu như trên tất cả các trình duyệt như Firefox, Chrome,... trên máy tính lẫn điện thoại.
\r\nNhiệm vụ của Javascript là xử lý những đối tượng HTML trên trình duyệt. Nó có thể can thiệp với các hành động như thêm / xóa / sửa các thuộc tính CSS và các thẻ HTML một cách dễ dàng. Hay nói cách khác, Javascript là một ngôn ngữ lập trình trên trình duyệt ở phía client. Tuy nhiên, hiện nay với sự xuất hiện của NodeJS đã giúp cho Javascript có thể làm việc ở backend.
\r\nCú pháp của JavaScript
\r\nJavaScript có thể được thực hiện bởi sử dụng các lệnh JavaScript mà được đặt trong thẻ HTML trong một trang web.
\r\nBạn có thể đặt các thẻ "script", chứa JavaScript của bạn, bất cứ đâu trong trang của bạn, nhưng được đề nghị là bạn nên giữ nó trong các thẻ "head".
\r\nThẻ "script" báo cho chương trình trình duyệt bắt đầu phiên dịch tất cả văn bản ở giữa các thẻ này như là một script.', '2021-12-14 22:20:11'),
(11, 7, 'PHP?...', '1. PHP là gì? \r\nPHP là viết tắt của chữ "Hypertext Preprocessor", đây là một ngôn ngữ lập trình được sử dụng để viết ở phía máy chủ (server side). Và PHP là một open source, nên chính vì thế nó có tính cộng đồng của nó cao và đồng thời cũng sẽ có rất nhiều các framework, CMS hỗ trợ như Laravel, Wordpress.
\r\n2. Cần chuẩn bị gì trước khi học PHP. \r\nĐây là câu hỏi muôn thủa trước khi chúng ta bắt đầu đi vào học một ngôn ngữ và với PHP cũng không ngoại lệ. \r\nĐể bắt đầu học PHP thì bắt buộc bạn cần phải có máy tính hoặc laptop
\r\nTiếp đó nếu bạn nắm được nguyên lý căn bản(if-else, for, while,..) của một ngôn ngữ nào đó thì càng tốt. Còn không thì: "vẫn cứ là ok".', '2021-10-06 21:06:55'),
(12, 8, 'JQuery!', 'JQuery được tích hợp nhiều module khác nhau. Từ module hiệu ứng cho đến module truy vấn selector. jQuery được sử dụng đến 99% trên tổng số website trên thế giới. Vậy các module chính của jQuery là gì?
\r\nCác module phổ biến của jQuery bao gồm:
\r\nAjax - xử lý Ajax \r\nAttributes - Xử lý các thuộc tính của đối tượng HTML \r\nEffect - xử lý hiệu ứng \r\nEvent - xử lý sự kiện \r\nForm - xử lý sự kiện liên quan tới form \r\nDOM - xử lý Data Object Model \r\nSelector - xử lý luồng lách giữa các đối tượng HTML', '2021-10-06 15:00:18'),
(13, 9, 'JSON là gì?', 'JSON là viết tắt của JavaScript Object Notation, là một kiểu định dạng dữ liệu tuân theo một quy luật nhất định mà hầu hết các ngôn ngữ lập trình hiện nay đều có thể đọc được. JSON là một tiêu chuẩn mở để trao đổi dữ liệu trên web.
\r\nTa có thể thấy cú pháp của JSON có 2 phần đó là key và value:
\r\nChuỗi JSON được bao lại bởi dấu ngoặc nhọn {}.
\r\nCác key, value của JSON bắt buộc phải đặt trong dấu nháy kép {“}, nếu bạn đặt nó trong dấu nháy đơn thì đây không phải là một chuỗi JSON đúng chuẩn. Nếu trường hợp trong value của bạn có chứa dấu nháy kép " thì hãy dùng dấu (\) để đặt trước nó, ví dụ  \"json là gì\". \r\nNếu có nhiều dữ liệu thì dùng dấu phẩy , để ngăn cách.
\r\nCác key của JSON bạn nên đặt chữ cái không dấu hoặc số, dấu _ và không có khoảng trắng., ký tự đầu tiên không nên đặt là số.
\r\nFile json có thể được lưu với bất kỳ phần mở rộng nào, tuy nhiên thông thường thì nó được lưu dưới phần mở rộng là .json hoặc .js.', '2021-12-12 18:00:31');

