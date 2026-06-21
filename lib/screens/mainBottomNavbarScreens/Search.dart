import 'package:flutter/material.dart';
import 'DiscoverCategoryPage.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  static const List<Map<String, dynamic>> discoverItems = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1520975911178-acf07f233b1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
      'title': 'Summer Style',
      'subtitle': 'New arrivals for your wardrobe',
      'categories': [
        {
          'name': 'Dresses',
          'imageUrl':
              'https://images.unsplash.com/photo-1520962918604-915bca8af862?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
        {
          'name': 'Bags',
          'imageUrl':
              'https://images.unsplash.com/photo-1503342452485-86dcc1f85b4b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
        {
          'name': 'Jewelry',
          'imageUrl':
              'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
      ],
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1495121605193-b116b5b9c5f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
      'title': 'Luxury Bags',
      'subtitle': 'Find the best handbags and clutches',
      'categories': [
        {
          'name': 'Leather',
          'imageUrl':
              'https://images.unsplash.com/photo-1512499617640-c2f99912a0f0?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
        {
          'name': 'Clutches',
          'imageUrl':
              'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
        {
          'name': 'Travel Bags',
          'imageUrl':
              'https://images.unsplash.com/photo-1530649922231-11730441c5c6?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
      ],
    },
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
      'title': 'Elegant Shoes',
      'subtitle': 'Comfortable heels for every day',
      'categories': [
        {
          'name': 'Heels',
          'imageUrl':
              'https://images.unsplash.com/photo-1503341733583-7a1c53587f1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
        {
          'name': 'Flats',
          'imageUrl':
              'https://images.unsplash.com/photo-1490367532201-b9bc1dc483f6?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
        {
          'name': 'Sneakers',
          'imageUrl':
              'https://images.unsplash.com/photo-1528701800489-ef1aa5d3d83c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=60',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: const Text(
          'Discover',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: const Icon(Icons.search, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.black87),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: discoverItems.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = discoverItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == discoverItems.length - 1 ? 0 : 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DiscoverCategoryPage(
                                title: item['title'] as String,
                                categories: List<Map<String, String>>.from(
                                    item['categories'] as List<dynamic>),
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 14,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 190,
                                  width: double.infinity,
                                  child: Image.network(
                                    item['imageUrl'] as String,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) return child;
                                      return const Center(child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'] as String,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        item['subtitle'] as String,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
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
            ],
          ),
        ),
      ),
    );
  }
}
