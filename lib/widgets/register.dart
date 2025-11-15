import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers cho 5 ô nhập liệu
  final TextEditingController _taiKhoanController = TextEditingController();
  final TextEditingController _matKhauController = TextEditingController();
  final TextEditingController _nhapLaiMatKhauController = TextEditingController();
  final TextEditingController _hoVaTenController = TextEditingController();
  final TextEditingController _lopController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // Phải dispose tất cả controller
    _taiKhoanController.dispose();
    _matKhauController.dispose();
    _nhapLaiMatKhauController.dispose();
    _hoVaTenController.dispose();
    _lopController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    // Lấy text từ các ô
    final taiKhoan = _taiKhoanController.text.trim();
    final matKhau = _matKhauController.text.trim();
    final nhapLaiMatKhau = _nhapLaiMatKhauController.text.trim();
    final hoVaTen = _hoVaTenController.text.trim();
    final lop = _lopController.text.trim();

    // Kiểm tra xem có ô nào rỗng không
    if (taiKhoan.isEmpty || matKhau.isEmpty || nhapLaiMatKhau.isEmpty || hoVaTen.isEmpty || lop.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Kiểm tra mật khẩu có khớp không
    if (matKhau != nhapLaiMatKhau) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mật khẩu nhập lại không khớp!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // -----
    // TẠI ĐÂY: Bạn sẽ thêm logic gọi API hoặc lưu vào database
    // -----

    // Giả lập đăng ký thành công:
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đăng ký thành công! Vui lòng đăng nhập.'),
        backgroundColor: Colors.green,
      ),
    );
    // Quay về trang đăng nhập
    context.go('/login');
  }

  void _goToLogin() {
    // Chuyển về trang đăng nhập
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Fix lỗi bàn phím
      body: SafeArea(
        child: SingleChildScrollView( // Cho phép cuộn
          padding: const EdgeInsets.symmetric(horizontal: 24.0), // Padding hợp lý
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Giãn các con
            children: [
              const SizedBox(height: 50),

              // Icon/Logo (Vòng tròn như ảnh vẽ)
              UnconstrainedBox(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.userPlus, // Icon Đăng ký
                    size: 60,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              const Text(
                'Đăng ký nè', // Sửa lại title
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32, // Font hợp lý
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Tạo tài khoản mới của bạn', // Sửa sub-title
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 40),

              // ---- BẮT ĐẦU CÁC Ô NHẬP LIỆU ----

              // TextField Tài khoản
              TextField(
                controller: _taiKhoanController,
                style: const TextStyle(fontSize: 16),
                decoration: _buildInputDecoration('Tài khoản', FontAwesomeIcons.user),
              ),
              const SizedBox(height: 20),

              // TextField Mật khẩu
              TextField(
                controller: _matKhauController,
                obscureText: !_isPasswordVisible,
                style: const TextStyle(fontSize: 16),
                decoration: _buildInputDecoration('Mật khẩu', FontAwesomeIcons.lock).copyWith(
                  suffixIcon: _buildVisibilityIcon(),
                ),
              ),
              const SizedBox(height: 20),

              // TextField Nhập lại mật khẩu (Thêm mới)
              TextField(
                controller: _nhapLaiMatKhauController,
                obscureText: !_isPasswordVisible,
                style: const TextStyle(fontSize: 16),
                decoration: _buildInputDecoration('Nhập lại mật khẩu', FontAwesomeIcons.lock).copyWith(
                  suffixIcon: _buildVisibilityIcon(),
                ),
              ),
              const SizedBox(height: 20),

              // TextField Họ và tên (Thêm mới)
              TextField(
                controller: _hoVaTenController,
                style: const TextStyle(fontSize: 16),
                decoration: _buildInputDecoration('Họ và tên', FontAwesomeIcons.idBadge),
              ),
              const SizedBox(height: 20),

              // TextField Lớp (Thêm mới)
              TextField(
                controller: _lopController,
                style: const TextStyle(fontSize: 16),
                decoration: _buildInputDecoration('Lớp', FontAwesomeIcons.school),
              ),

              // ---- KẾT THÚC CÁC Ô NHẬP LIỆU ----

              // Bỏ "Quên mật khẩu"

              const SizedBox(height: 30), // Tăng khoảng cách

              // Button Đăng ký
              ElevatedButton(
                onPressed: _handleRegister, // Gọi hàm đăng ký
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  shadowColor: Colors.green.shade200,
                ),
                child: const Text(
                  'Đăng ký', // Sửa chữ
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Link quay lại Đăng nhập
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Đã có tài khoản? ', // Sửa chữ
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: _goToLogin, // Gọi hàm quay lại login
                    child: const Text(
                      'Đăng nhập ngay', // Sửa chữ
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function để tạo InputDecoration cho TextField (tránh lặp code)
  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintText: 'Nhập $label',
      labelStyle: const TextStyle(fontSize: 16),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FaIcon(
          icon,
          color: Colors.green,
          size: 20,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }

  // Helper function để tạo nút ẩn/hiện mật khẩu
  Widget _buildVisibilityIcon() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        child: FaIcon(
          _isPasswordVisible
              ? FontAwesomeIcons.eye
              : FontAwesomeIcons.eyeSlash,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}