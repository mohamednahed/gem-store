import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategoryIndex = 0;
  bool showAllProducts = false;
  bool showAllRecommended = false;

  final List<Map<String, String>> banners = const [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80',
      'title': 'Autumn Collection',
      'subtitle': '2021',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=80',
      'title': 'New Arrivals',
      'subtitle': 'Spring Edit',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1495121605193-b116b5b9c5f1?auto=format&fit=crop&w=800&q=80',
      'title': 'Best Sellers',
      'subtitle': 'Shop Now',
    },
  ];

  final List<Map<String, String>> products = const [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=80',
      'title': 'Turtleneck Sweater',
      'price': '\$25.99',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1520975911178-acf07f233b1d?auto=format&fit=crop&w=800&q=80',
      'title': 'Long Sleeve Dress',
      'price': '\$45.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1495121605193-b116b5b9c5f1?auto=format&fit=crop&w=800&q=80',
      'title': 'Sportwear Set',
      'price': '\$80.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1530845643844-07b0bfe1f8a0?auto=format&fit=crop&w=800&q=80',
      'title': 'Leather Jacket',
      'price': '\$29.99',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=800&q=80',
      'title': 'Classic Bag',
      'price': '\$69.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1472417583565-62e7bdeda490?auto=format&fit=crop&w=800&q=80',
      'title': 'Suede Boots',
      'price': '\$19.50',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1533935854864-5b2267eed3c6?auto=format&fit=crop&w=800&q=80',
      'title': 'Summer Top',
      'price': '\$29.99',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=800&q=80',
      'title': 'Denim Jeans',
      'price': '\$49.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?auto=format&fit=crop&w=800&q=80',
      'title': 'Chic Belt',
      'price': '\$19.99',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=80',
      'title': 'Knit Cardigan',
      'price': '\$39.99',
    },
  ];

  final List<Map<String, String>> recommendedProducts = const [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=80',
      'title': 'White fashion hoodie',
      'price': '\$29.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1520975911178-acf07f233b1d?auto=format&fit=crop&w=800&q=80',
      'title': 'Cotton T-Shirt',
      'price': '\$30.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?auto=format&fit=crop&w=800&q=80',
      'title': 'Sport Shorts',
      'price': '\$22.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1495121605193-b116b5b9c5f1?auto=format&fit=crop&w=800&q=80',
      'title': 'Slim Jeans',
      'price': '\$45.00',
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1533935854864-5b2267eed3c6?auto=format&fit=crop&w=800&q=80',
      'title': 'Casual Dress',
      'price': '\$55.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'GemStore',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            color: Colors.black54,
            onPressed: () {
              // handle notification tap
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: null,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CategoryItem(
                      icon: Icons.female,
                      label: 'Women',
                      isSelected: selectedCategoryIndex == 0,
                      onTap: () => setState(() => selectedCategoryIndex = 0),
                    ),
                    _CategoryItem(
                      icon: Icons.male,
                      label: 'Men',
                      isSelected: selectedCategoryIndex == 1,
                      onTap: () => setState(() => selectedCategoryIndex = 1),
                    ),
                    _CategoryItem(
                      icon: Icons.watch,
                      label: 'Accessories',
                      isSelected: selectedCategoryIndex == 2,
                      onTap: () => setState(() => selectedCategoryIndex = 2),
                    ),
                    _CategoryItem(
                      icon: Icons.brush,
                      label: 'Beauty',
                      isSelected: selectedCategoryIndex == 3,
                      onTap: () => setState(() => selectedCategoryIndex = 3),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: banners.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final banner = banners[index];

                      return Material(
                        borderRadius: BorderRadius.circular(24),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            // handle banner tap
                          },
                          child: Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  banner['imageUrl']!,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.1),
                                        Colors.black.withOpacity(0.55),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        banner['title']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        banner['subtitle']!,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: List.generate(
                                          3,
                                          (dotIndex) => Container(
                                            margin: const EdgeInsets.only(
                                              right: 8,
                                            ),
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: dotIndex == index
                                                  ? Colors.white
                                                  : Colors.white54,
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
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (products.length > 3 && !showAllProducts)
                      TextButton(
                        onPressed: () => setState(() => showAllProducts = true),
                        child: const Text('Show all'),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: showAllProducts ? products.length : 3,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return SizedBox(
                        width: 180,
                        child: Material(
                          borderRadius: BorderRadius.circular(18),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              // handle product tap
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(18),
                                        topRight: Radius.circular(18),
                                      ),
                                      child: Image.network(
                                        product['imageUrl']!,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['title']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          product['price']!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
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
                    },
                  ),
                ),
                SizedBox(height: 24),
                const SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: showAllRecommended
                        ? recommendedProducts.length
                        : 3,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final item = recommendedProducts[index];

                      return Material(
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            // handle recommended item tap
                          },
                          child: Container(
                            width: 260,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    item['imageUrl']!,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item['title']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item['price']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
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
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Promo banner (tappable)
                Material(
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      // handle promo tap
                    },
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'NEW COLLECTION',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'HANG OUT\n& PARTY',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?auto=format&fit=crop&w=600&q=80',
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Recommended horizontal list with small cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (recommendedProducts.length > 2 && !showAllRecommended)
                      TextButton(
                        onPressed: () =>
                            setState(() => showAllRecommended = true),
                        child: const Text('Show all'),
                      ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.black : Colors.grey;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 12, color: color)),
            const SizedBox(height: 6),
            // small selected indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 28 : 12,
              height: 4,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black87 : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
