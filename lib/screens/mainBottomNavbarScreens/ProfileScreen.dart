import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Header
            Row(
              children: [

                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/profile.jpg",
                  ),
                ),

                const SizedBox(width: 15),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sunie Pham",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "sunieux@gmail.com",
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: ListView(
                  children: const [
                    MenuTile(
                      icon: Icons.location_on_outlined,
                      title: "Address",
                    ),
                    MenuTile(
                      icon: Icons.payment,
                      title: "Payment Method",
                    ),
                    MenuTile(
                      icon: Icons.card_giftcard,
                      title: "Voucher",
                    ),
                    MenuTile(
                      icon: Icons.favorite_border,
                      title: "My Wishlist",
                    ),
                    MenuTile(
                      icon: Icons.star_border,
                      title: "Rate This App",
                    ),
                    MenuTile(
                      icon: Icons.logout,
                      title: "Log Out",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: () {},
    );
  }
}