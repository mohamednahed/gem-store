import 'package:flutter/material.dart';
import 'CategoryResultsPage.dart';

class DiscoverCategoryPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> categories;

  const DiscoverCategoryPage({
    super.key,
    required this.title,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
            itemCount: categories.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == categories.length - 1 ? 0 : 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryResultsPage(
                            title: category['name']!,
                            products: List.generate(
                              8,
                              (i) => {
                                'name': '${category['name']} Item ${i + 1}',
                                'price': '\$${(30 + i * 10).toStringAsFixed(2)}',
                                'imageUrl': category['imageUrl']!,
                              },
                            ),
                          ),
                        ),
                      );
                    },
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
                            height: 160,
                            width: double.infinity,
                            child: Image.network(
                              category['imageUrl']!,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              category['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
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
      ),
    );
  }
}
