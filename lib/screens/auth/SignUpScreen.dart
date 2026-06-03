import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                Text(
                  'Create \nyour account',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Your name",
                    hintText: "Enter your name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email address",
                    hintText: "Email address",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.password),
                  ),
                ),

                const SizedBox(height: 20),
                
                const SizedBox(height: 30),
                Align(
                  alignment: AlignmentGeometry.center,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text('or sign up with'),
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

                          SizedBox(width: 10),

                          _buildSocialIcon(Icons.facebook, Colors.blue, () {}),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("Already have account ? ")),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "log in",
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
