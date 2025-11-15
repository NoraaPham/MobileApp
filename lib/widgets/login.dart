import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // --- BẢNG MÀU PASTEL ---
  static const Color pastelPurpleLight = Color(0xFFE1BEE7); // Tím nhạt (nền)
  static const Color pastelPinkMedium = Color(0xFFF06292); // Hồng (nút)
  static const Color darkPurple = Color(0xFF6A1B9A);      // Tím đậm (chữ)
  static const Color mediumPink = Color(0xFFEC407A);      // Hồng (icon/link)
  static const Color pastelPurpleMedium = Color(0xFFAB47BC); // Tím (viền)
  // --- KẾT THÚC BẢNG MÀU ---

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    String account = _accountController.text.trim();
    String password = _passwordController.text.trim();

    if (account.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đầy đủ thông tin'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    context.go('/profile');
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chức năng quên mật khẩu đang phát triển'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _handleRegister() {
    context.push('/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),

              // Icon/Logo
              UnconstrainedBox(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: pastelPurpleLight, // Đã đổi màu
                    shape: BoxShape.circle,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.userLock,
                    size: 60,
                    color: mediumPink, // Đã đổi màu
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                'Đăng nhập',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: darkPurple, // Đã đổi màu
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Chào mừng bạn trở lại!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 40),

              // TextField Tài khoản
              TextField(
                controller: _accountController,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: 'Tài khoản',
                  hintText: 'Tên đăng nhập',
                  labelStyle: const TextStyle(fontSize: 16),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      color: mediumPink, // Đã đổi màu
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
                    borderSide: const BorderSide(color: pastelPurpleMedium, width: 2), // Đã đổi màu
                  ),
                  filled: true,
                  fillColor: pastelPurpleLight, // Đã đổi màu
                ),
              ),
              const SizedBox(height: 20),

              // TextField Mật khẩu
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu',
                  labelStyle: const TextStyle(fontSize: 16),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FaIcon(
                      FontAwesomeIcons.lock,
                      color: mediumPink, // Đã đổi màu
                      size: 20,
                    ),
                  ),
                  suffixIcon: Padding(
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
                    borderSide: const BorderSide(color: pastelPurpleMedium, width: 2), // Đã đổi màu
                  ),
                  filled: true,
                  fillColor: pastelPurpleLight, // Đã đổi màu
                ),
              ),

              // Quên mật khẩu
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _handleForgotPassword,
                  child: const Text(
                    'Quên mật khẩu?',
                    style: TextStyle(color: mediumPink, fontSize: 14), // Đã đổi màu
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Button Đăng nhập
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: pastelPinkMedium, // Đã đổi màu
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  shadowColor: pastelPinkMedium.withOpacity(0.5),
                ),
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Đăng ký
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chưa có tài khoản? ',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: _handleRegister,
                    child: const Text(
                      'Đăng ký ngay',
                      style: TextStyle(
                        color: mediumPink, // Đã đổi màu
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
}