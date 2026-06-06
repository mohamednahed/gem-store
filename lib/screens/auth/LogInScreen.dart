import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String? email;
    String? password;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30.0, left: 50, right: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log into \nyour account',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 100),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 15) {
                            return "your Email is too smaller";
                          }
                          return "this is valid";
                        },
                        onSaved: (newValue) => email = newValue,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email address",
                          hintText: "Email address",
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        validator: (value) {
                          if (value!.length < 8) {
                            return "your password is too smaller";
                          }
                          return "Strong password";
                        },
                        onSaved: (newValue) => password = newValue,
            
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password),
                        ),
                      ),
            
                      const SizedBox(height: 20),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          "LOG IN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Column(
                    children: [
                      Text('or log in with'),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(Icons.apple, Colors.black, () {}),
            
                          SizedBox(width: 20),
            
                          _buildSocialIcon(
                            Icons.g_mobiledata_outlined,
                            Colors.yellow,
                            () {},
                          ),
            
                          SizedBox(width: 20),
            
                          _buildSocialIcon(Icons.facebook, Colors.blue, () {}),
                        ],
                      ),
                      SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("Don't have an account ? ")),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
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
