import 'package:flutter/material.dart';
import 'package:gem_store/screens/welcome/Intro2.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.6,
                width: size.width,
                color: Colors.white,
              ),
              Container(
                height: size.height * 0.4,
                width: size.width,
                color: Color.fromARGB(185, 15, 6, 6),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Discover something new",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text('Special new arrivals just for you',style:TextStyle(fontWeight: FontWeight.w600)  ,),
                  SizedBox(height: 30),
                  SizedBox(
                    height: size.height * 0.5,
                    width: size.width * 0.5,
                    child: Image.asset(
                      "images/intro1.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      int currentIndex = 0;
                      bool isActive = currentIndex == index;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive ? Colors.white : Colors.transparent,
                          border: Border.all(
                            color: isActive
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                            width: 2,
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: 250,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Intro2(), 
                    ),
                  );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1.2),

                        shape: const StadiumBorder(),

                        backgroundColor: Colors.white.withOpacity(0.15),

                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Shopping now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
