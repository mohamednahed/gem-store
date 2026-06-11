import 'package:flutter/material.dart';
import 'package:gem_store/screens/auth/LogInScreen.dart';
import 'package:gem_store/ReusbleWidget.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30.0, left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create \nyour account',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _usernameController,
                        hintText: "Enter your name",
                        labelText: "Your name",
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال الاسم";
                          }
                          if (value.length < 3) {
                            return "الاسم قصير جداً";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      CustomTextFormField(
                        controller: _emailController,
                        hintText: "Email address",
                        labelText: "Email address",
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال البريد الإلكتروني";
                          }
                          if (value.length < 15) {
                            return "البريد الإلكتروني قصير جداً";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      CustomTextFormField(
                        controller: _passwordController,
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.password),
                        obscureText: _obscurePassword,
                        keyboardType: TextInputType.text,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يرجى إدخال كلمة المرور";
                          }
                          if (value.length < 8) {
                            return "كلمة المرور قصيرة جداً (8 أحرف كحد أدنى)";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      CustomTextFormField(
                        controller: _confirmPasswordController,
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.password),
                        obscureText: _obscureConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "كلمتا المرور غير متطابقتين";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                       
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text('or sign up with'),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(Icons.apple, Colors.black, () {}),
                          const SizedBox(width: 20),
                          _buildSocialIcon(
                            Icons.g_mobiledata_outlined,
                            Colors.yellow,
                            () {},
                          ),
                          const SizedBox(width: 10),
                          _buildSocialIcon(Icons.facebook, Colors.blue, () {}),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(child: Text("Already have account ? ")),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              "log in",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color1, VoidCallback onpressed) {
    return IconButton(
      onPressed: onpressed,
      icon: Icon(icon, color: color1),
      iconSize: 50,
    );
  }
}
