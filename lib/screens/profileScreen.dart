import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 249, 245, 245),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  // صورة البروفايل
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ),
                  ),
                  const SizedBox(width: 15),
                  // الاسم والبريد
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Sunie Pham',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'sunieux@gmail.com',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  // زر الإعدادات
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // القائمة
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    buildMenuItem(Icons.location_on_outlined, 'Address'),

                    buildMenuItem(Icons.payment, 'Payment method'),

                    buildMenuItem(Icons.card_giftcard, 'Voucher'),

                    buildMenuItem(Icons.favorite_border, 'My Wishlist'),

                    buildMenuItem(Icons.star_border, 'Rate this app'),

                    buildMenuItem(Icons.logout, 'Log out'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // عنصر القائمة
  Widget buildMenuItem(IconData icon, String title) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),

        title: Text(title),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

        onTap: () {},
      ),
    );
  }
}
