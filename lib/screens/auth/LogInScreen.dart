import 'package:flutter/material.dart';
import 'package:gem_store/screens/auth/SignUpScreen.dart';
import 'package:gem_store/ReusbleWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30.0, left: 50, right: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log into \nyour account',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 100),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
                          "LOG IN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Text('or log in with'),
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
                          const SizedBox(width: 20),
                          _buildSocialIcon(Icons.facebook, Colors.blue, () {}),
                        ],
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(child: Text("Don't have an account ? ")),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign Up",
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

