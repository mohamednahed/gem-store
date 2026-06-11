import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String subtitle;
  final String imagePath;
  final double imageWidthMultiplier;

  const OnboardingData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.imageWidthMultiplier = 0.5,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingData> _pages = const [
    OnboardingData(
      title: "Discover something new",
      subtitle: "Special new arrivals just for you",
      imagePath: "images/intro1.jpg",
    ),
    OnboardingData(
      title: "Update trendy outfit",
      subtitle: "Favorite brands and hottest trends",
      imagePath: "images/intro2.jpg",
    ),
    OnboardingData(
      title: "Explore your true style",
      subtitle: "Relax and let us bring the style to you",
      imagePath: "images/intro3.jpg",
      imageWidthMultiplier: 0.6,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                color: const Color.fromARGB(185, 15, 6, 6),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _pages.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final page = _pages[index];
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                page.title,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                page.subtitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height: size.height * 0.5,
                                width: size.width * page.imageWidthMultiplier,
                                child: Image.asset(
                                  page.imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_pages.length, (index) {
                      bool isActive = _currentIndex == index;
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
                  const SizedBox(height: 50),

                  SizedBox(
                    width: 250,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1.2),
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.white.withOpacity(0.15),
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Shopping now",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
