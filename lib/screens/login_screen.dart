import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  bool _hoverRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // plain background, like design
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 48.0),
          child: Column(
            children: [
              // Logo only (no "Kids Guard" text), a bit larger
              Center(
                child: Image.asset(
                  'assets/images/kidsguard.png',
                  height: 140, // slightly larger like original
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 36),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailC,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Enter email';
                        if (!v.contains('@')) return 'Invalid email';
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: passwordC,
                      hintText: 'Password',
                      isPassword: true,
                      validator: (v) {
                        if (v == null || v.length < 6) return 'At least 6 characters';
                        return null;
                      },
                    ),

                    const SizedBox(height: 6),

                    // Centered underline "Forgot password? Reset your password"
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Reset password action (left empty for now)
                        },
                        child: const Text(
                          'Forgot password? Reset your password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Login button (full width)
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // On success, just show a small confirmation for now
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Logged in')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                      ),
                    ),

                    const SizedBox(height: 14), // same spacing as design

                    // Google button - same width as Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Image.asset('assets/images/google.png', height: 20),
                        label: const Text('Google', style: TextStyle(color: Colors.black)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // "Don't have an account? Sign Up" clickable, turn blue on hover
                    MouseRegion(
                      onEnter: (_) => setState(() => _hoverRegister = true),
                      onExit: (_) => setState(() => _hoverRegister = false),
                      child: GestureDetector(
                        onTap: () async {
                          // go to sign up and await returned data
                          final result = await Navigator.pushNamed(context, '/signup');
                          if (result != null && result is Map) {
                            // pre-fill login fields if sign-up returned data
                            emailC.text = result['email'] ?? '';
                            passwordC.text = result['password'] ?? '';
                          }
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            color: _hoverRegister ? kPrimaryColor : kTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}