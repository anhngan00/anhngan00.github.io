<!DOCTYPE html>
<html class="no-js" lang="en">
<head>

   <!--- Basic Page Needs
   ================================================== -->
   <meta charset="utf-8">
	<title>Login</title>
	<meta name="description" content="">  
	<meta name="author" content="">

	<!-- mobile specific metas
   ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

   <!-- CSS
    ================================================== -->
	<link href="css/style.css" rel="stylesheet" type="text/css">

   <!-- Script
   ================================================== -->
	<script src="js/modernizr.js"></script>
</head>

	<body>
		<div class="login">
			<h1>Login</h1>
			<form  method="post">
				<label for="username">
					<i class="fas fa-user"></i>
				</label>
				<input type="text" name="username" placeholder="Username" id="username" required>
				<label for="password">
					<i class="fas fa-lock"></i>
				</label>
				<input type="password" name="password" placeholder="Password" id="password" required>
				<input type="submit" value="Welcome to blog NNT! ^^">
			</form>
		</div>

		<!-- Java Script
   ================================================== -->
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   <script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
   <script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>  
   <script src="js/main.js"></script>
	</body>
</html>

<?php
session_start();
$DATABASE_HOST = '127.0.0.1';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';
$DATABASE_NAME = 'blog';
$con = mysqli_connect($DATABASE_HOST, $DATABASE_USER, $DATABASE_PASS, $DATABASE_NAME);
if ( mysqli_connect_errno() ) {
	// Nếu có lỗi với kết nối, hãy dừng tập lệnh và hiển thị lỗi.
	exit('Failed to connect to MySQL: ' . mysqli_connect_error());
}
// Bây giờ ta kiểm tra xem dữ liệu từ biểu mẫu đăng nhập đã được gửi hay chưa, isset() sẽ kiểm tra xem dữ liệu có tồn tại hay không.
if ( !isset($_POST['username'], $_POST['password']) ) {
	// Không thể lấy dữ liệu lẽ ra phải được gửi.
	// exit('Please fill both the username and password fields!');
	exit();
}
// chuẩn bị câu lệnh SQL sẽ ngăn chặn việc đưa vào SQL.
if ($stmt = $con->prepare('SELECT id, password FROM accounts WHERE username = ?')) {
	
// Tham số ràng buộc (s = string, i = int, b = blob, etc), trong trường hợp tên người dùng là một chuỗi, vì vậy sử dụng "s"
	$stmt->bind_param('s', $_POST['username']);
	$stmt->execute();
	// Lưu trữ kết quả để có thể kiểm tra xem tài khoản có tồn tại trong cơ sở dữ liệu hay không.
	$stmt->store_result();
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $password);
        $stmt->fetch();
        // Tài khoản tồn tại, bây giờ xác minh mật khẩu.
        // Lưu ý: hãy nhớ sử dụng password_hash trong tệp đăng ký để lưu trữ các mật khẩu đã băm.
        // if (password_verify($_POST['password'], $password)) {
            //Nếu không muốn sử dụng bất kỳ phương pháp mã hóa mật khẩu nào,có thể chỉ cần thay thế mã sau:
            if ($_POST['password'] === $password) {
            // Xác minh thành công! Người dùng đã đăng nhập!
            // Tạo session, để biết người dùng đã đăng nhập, về cơ bản chúng hoạt động giống như cookie nhưng ghi nhớ dữ liệu trên máy chủ.
            session_regenerate_id();
            $_SESSION['loggedin'] = TRUE;
            $_SESSION['name'] = $_POST['username'];
            $_SESSION['id'] = $id;
			
            header('Location: index.php');
			
			//Sử dụng hàm setcookie() để thiết lập cookie
			//setcookie("username", "name", time() + 1000,'/');  
        } else {
            // sai pass
              echo 'Incorrect username and/or password!';     
        }
    } else {
        // sai username
        echo 'Incorrect username and/or password!';
    }


	$stmt->close();
}
?>

