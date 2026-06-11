import 'package:flutter/material.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  bool _isPasswordEmpty = true;
  bool _isConfirmPasswordEmpty = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updateButtonState);
    _confirmPasswordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isPasswordEmpty = _passwordController.text.isEmpty;
      _isConfirmPasswordEmpty = _confirmPasswordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = !_isPasswordEmpty && !_isConfirmPasswordEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Create new password',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 12),

                const Text(
                  'Your new password must be different\nfrom previously used password',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 50),

                const Text(
                  'Password',
                  style: TextStyle(color: Colors.black38, fontSize: 13),
                ),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _isPasswordObscured,
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 16, letterSpacing: 2),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter the password';
                    }
                    if (value.length < 6) {
                      return 'at least you must write the password 6 letters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintText: 'New Password',
                    hintStyle: TextStyle(letterSpacing: 0.5),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscured = !_isPasswordObscured;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Confirm Password',
                  style: TextStyle(color: Colors.black38, fontSize: 13),
                ),

                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _isConfirmPasswordObscured,
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 16),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'the password is not identical';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordObscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordObscured =
                              !_isConfirmPasswordObscured;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                Center(
                  child: SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        isButtonEnabled ? _handleConfirmPassword : null;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        disabledBackgroundColor: const Color(0xFFC2C2C2),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white.withOpacity(0.9),
                        shape: const StadiumBorder(),
                        elevation: isButtonEnabled ? 2 : 0,
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
  }

  void _handleConfirmPassword() {
    if (_formKey.currentState!.validate()) {
      String password = _passwordController.text;
    }
  }
}
