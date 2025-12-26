import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine if dark mode is active (though requested design implies light/class based, we'll stick to the explicit colors from HTML for now but respect theme brightness structure if needed)
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // HTML Colors mapped to Flutter
    final bgLight = Colors.white; // background-light
    final bgDark = const Color(0xFF111827); // background-dark
    final primary = const Color(0xFF1E40AF); // primary
    final surfaceLight = const Color(0xFFF3F4F6); // surface-light
    final surfaceDark = const Color(0xFF1F2937); // surface-dark
    final textLight = const Color(0xFF1F2937); // text-light
    final textDark = const Color(0xFFF9FAFB); // text-dark

    final backgroundColor = isDark ? bgDark : bgLight;
    final surfaceColor = isDark ? surfaceDark : surfaceLight;
    final textColor = isDark ? textDark : textLight;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Header Section (35vh)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Stack(
              children: [
                // Clipped Image Background
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                    color: surfaceColor,
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBYpTc4lREIEtk2bcY46gIHBf6-4j1HNmXb0l7HANHK4fXP_StF20Fv-Hy6a9OM5wUsW5ECXanF09xEZX7_BvyY-E0gPOZeVsLNgFptW3F084lHYzxW01Pl2mPpi7k6oU9r0yt_8wEl2X9C6ZNa-zDec54i7nLtt9TYJNvtJfU5Ue8GCVCwYmvi_PaiVsgiUqYrSPdcVon1HW3R5ApbmemUgODaSxseLUfLiBhXlFoZ17brG342X4BOEDxOnn7EhwaUfRZ4V6s7CfE',
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(
                            isDark ? 0.3 : 0.1,
                          ), // approximation of opacity/overlay
                          colorBlendMode: BlendMode.darken,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade300,
                            ); // Fallback
                          },
                        ),
                        // Gradient Overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(isDark ? 0.4 : 0.1),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Floating Logo
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Transform.translate(
                      offset: const Offset(
                        0,
                        50,
                      ), // Half of height (100/2) to vertically center on edge? HTML says translate-y-1/2
                      // HTML: w-24 h-24 (96px). using 96 logical pixels.
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          color: primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: backgroundColor, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons
                              .local_police_outlined, // closest to local_police material symbol
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                32,
                64,
                32,
                32,
              ), // Top padding to account for logo overlap
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30, // text-3xl
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Welcome back to Pandu LMS',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.grey[400] : Colors.grey[500],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Email Input
                  _buildFloatingLabelInput(
                    controller: _emailController,
                    label: 'Email 365',
                    isDark: isDark,
                    primary: primary,
                    textColor: textColor,
                  ),

                  const SizedBox(height: 24),

                  // Password Input
                  _buildFloatingLabelInput(
                    controller: _passwordController,
                    label: 'Password',
                    isDark: isDark,
                    primary: primary,
                    textColor: textColor,
                    isPassword: true,
                    isPasswordVisible: _isPasswordVisible,
                    onTogglePassword: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 32),

                  // Login Button
                  ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // rounded-full
                      ),
                      elevation: 4,
                      shadowColor: Colors.blue.withOpacity(0.3),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Help Link
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Bantuan ?',
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer Section (15vh)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipPath(
                    clipper: FooterClipper(),
                    child: Container(
                      color: primary.withOpacity(0.9), // opacity-90
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingLabelInput({
    required TextEditingController controller,
    required String label,
    required bool isDark,
    required Color primary,
    required Color textColor,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ), // Default border
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        style: TextStyle(color: textColor, fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[500],
          ),
          floatingLabelStyle: TextStyle(color: primary),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 0,
          ),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons
                              .visibility_off // Note: Material Symbols might be swapped in standard icons, checking standard material behavior
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
        ),
      ),
    );
  }
}

// Custom Clippers based on CSS clip-path: ellipse(...)

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // clip-path: ellipse(130% 100% at 50% 0%);
    // This is an ellipse centered at top-center (50% 0%), with X-radius = 130% of width, Y-radius = 100% of height.
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, 0),
        width:
            size.width *
            2.6, // 130% radius * 2 = 260% width? No, radius is 130% of reference box?
        // ellipse(rx ry at cx cy). rx = 130% width. ry = 100% height.
        // Width = 2 * rx = 2.6 * width. Height = 2 * ry = 2 * height (but centered at 0).
        height: size.height * 2,
      ),
    );
    return path;
    // Note: addOval creates a closed path. We want the intersection with the rect? ClipPath intersects automatically.
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // clip-path: ellipse(150% 100% at 20% 100%);
    // rx = 150% width, ry = 100% height.
    // Center at (20% width, 100% height).
    final path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.2, size.height),
        width: size.width * 3.0, // 2 * 1.5
        height: size.height * 2.0, // 2 * 1.0
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
