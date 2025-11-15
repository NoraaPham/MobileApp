// lib/widgets/profile.dart

import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'dart:math';

// Class này CHỈ LÀ NỘI DUNG, không có Scaffold
class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Column chứa phần trắng và phần cam
      Column(
        children: [
          // Phần trắng
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: '31191021234',
                        width: 500,
                        height: 100,
                      )),
                  const SizedBox(height: 40),
                  const Text(
                    'NGUYỄN THỊ UEH',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF73E85E),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Phần cam (Đã sửa lỗi tràn)
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: const Color(0xFF63E85E),
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ngày sinh',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      '21/01/2011',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Giới tính',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      'Nam',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Khóa',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      'DHCQK50',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Nơi sinh',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      'Hải Phòng',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Hệ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const Text(
                      'DH\n-Niên học:\n2024 - 2027',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'UEH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Cụm Ảnh Profile và QR code
      Positioned(
        top: MediaQuery.of(context).size.height * (3 / 6) - 215,
        right: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const _AnimatedProfileImage(
              imageWidth: 150,
              imageHeight: 225,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[700]!, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: '31191021234',
                width: 120,
                height: 120,
              ),
            ),
          ],
        ),
      ),

      // Hiệu ứng tuyết rơi (Sửa code deprecated)
      const Positioned.fill(
        child: SnowfallWidget(
          numberOfSnowflakes: 150,
          snowflakeColor: Color.fromRGBO(255, 255, 255, 0.8), // Sửa 'withOpacity'
          minSnowflakeSize: 1.5,
          maxSnowflakeSize: 4.0,
          speed: 1.2,
        ),
      ),
    ]);
  }
}


//======================================================================
// WIDGET HIỆU ỨNG TUYẾT RƠI (ĐÃ SỬA CẢNH BÁO)
//======================================================================
class SnowfallWidget extends StatefulWidget {
  final int numberOfSnowflakes;
  final Color snowflakeColor;
  final double minSnowflakeSize;
  final double maxSnowflakeSize;
  final double speed;

  const SnowfallWidget({
    super.key, // Sửa thành super.key
    this.numberOfSnowflakes = 100,
    this.snowflakeColor = Colors.white,
    this.minSnowflakeSize = 2.0,
    this.maxSnowflakeSize = 5.0,
    this.speed = 1.0,
  });

  @override
  State<SnowfallWidget> createState() => _SnowfallWidgetState();
}

class _SnowfallWidgetState extends State<SnowfallWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Snowflake> _snowflakes = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      if (!mounted) return;
      final Size? size = context.size;
      if (size == null) return;

      setState(() {
        for (var snowflake in _snowflakes) {
          snowflake.y += snowflake.speed * widget.speed;
          if (snowflake.y > size.height) {
            snowflake.reset(size.width, size.height);
          }
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initSnowflakes();
    });
  }

  void _initSnowflakes() {
    if (!mounted) return;
    final Size? size = context.size;
    if (size != null && size.width > 0 && size.height > 0) {
      _snowflakes.clear();
      for (int i = 0; i < widget.numberOfSnowflakes; i++) {
        _snowflakes.add(Snowflake(
          _random,
          size.width,
          size.height,
          widget.minSnowflakeSize,
          widget.maxSnowflakeSize,
        ));
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _SnowfallPainter(
          _snowflakes,
          widget.snowflakeColor,
        ),
      ),
    );
  }
}

class Snowflake {
  double x, y;
  double size;
  double speed;
  double opacity;
  final Random _random;
  final double _initialWidth; // Sửa thành final
  final double _initialHeight; // Sửa thành final

  Snowflake(
      this._random,
      this._initialWidth,
      this._initialHeight,
      double minSize,
      double maxSize,
      )   : x = _random.nextDouble() * _initialWidth,
        y = _random.nextDouble() * _initialHeight,
        size = minSize + _random.nextDouble() * (maxSize - minSize),
        speed = 0.5 + _random.nextDouble() * 2,
        opacity = 0.5 + _random.nextDouble() * 0.5;

  void reset(double width, double height) {
    x = _random.nextDouble() * width;
    y = -size;
    speed = 0.5 + _random.nextDouble() * 2;
    opacity = 0.5 + _random.nextDouble() * 0.5;
  }
}

class _SnowfallPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final Color snowflakeColor;

  _SnowfallPainter(this.snowflakes, this.snowflakeColor);

  @override
  void paint(Canvas canvas, Size size) {
    for (var snowflake in snowflakes) {
      final paint = Paint()
        ..color = snowflakeColor.withOpacity(snowflake.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(snowflake.x, snowflake.y), snowflake.size / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SnowfallPainter oldDelegate) {
    return true;
  }
}

//======================================================================
// WIDGET HÌNH ẢNH PROFILE VÀ HIỆU ỨNG (ĐÃ SỬA CẢNH BÁO)
//======================================================================

class _AnimatedProfileImage extends StatefulWidget {
  final double imageWidth;
  final double imageHeight;

  const _AnimatedProfileImage({
    super.key, // Sửa thành super.key
    this.imageWidth = 200,
    this.imageHeight = 300,
  });

  @override
  State<_AnimatedProfileImage> createState() => _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<_AnimatedProfileImage>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _sheenController;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutSine),
    );

    _sheenController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _sheenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_pulseController, _sheenController]),
      builder: (context, child) {
        double currentOpacity = _pulseAnimation.value;
        double currentSpreadRadius = 3 + (_pulseAnimation.value * 7);
        double currentBlurRadius = 15 + (_pulseAnimation.value * 20);

        double offsetX = 0;
        double offsetY = 0;
        if (_pulseAnimation.value > 0.8) {
          offsetX = (_random.nextDouble() - 0.5) * 4 * _pulseAnimation.value;
          offsetY = (_random.nextDouble() - 0.5) * 4 * _pulseAnimation.value;
        }

        final double sheenPosition = (_sheenController.value * (widget.imageWidth + 100)) - 50;

        return Transform.translate(
          offset: Offset(offsetX, offsetY),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(currentOpacity),
                  spreadRadius: currentSpreadRadius,
                  blurRadius: currentBlurRadius,
                  offset: const Offset(0, 0),
                ),
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.1 + (0.15 * (1 - _pulseAnimation.value))),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(
                <double>[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Image.asset(
                      'images/asahi.jpg',
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: widget.imageWidth,
                          height: widget.imageHeight,
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              'Lỗi ảnh asahi.jpg',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned.fill(
                      child: Transform(
                        transform: Matrix4.skewX(-0.15),
                        child: Transform.translate(
                          offset: Offset(sheenPosition, 0),
                          child: Container(
                            width: widget.imageWidth / 2,
                            height: widget.imageHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.white.withOpacity(0.0),
                                    Colors.white.withOpacity(0.4),
                                    Colors.white.withOpacity(0.0),
                                  ],
                                  stops: const [0.0, 0.5, 1.0]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}