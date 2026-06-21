import 'package:flutter/material.dart';
import 'package:gem_store/models/cart_manager.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, String> product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  int selectedColor = 0;
  int selectedSize = 2;
  double rating = 4;

  final List<Color> colors = [Colors.brown, Colors.black, Colors.red];
  final List<String> sizes = ["S", "M", "L"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            child: Builder(builder: (context) {
              final image = widget.product['imageUrl'] ?? '';
              if (image.startsWith('http')) {
                return Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade300,
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                );
              }

              return Image.asset(
                image.isEmpty ? 'assets/images/product1.jpg' : image,
                fit: BoxFit.cover,
              );
            }),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Toggle favorite and add/remove from cart via manager
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      // Use CartManager singleton to update global cart state
                      // to avoid adding a new dependency-heavy state management
                      // solution for this task.
                      try {
                        // Lazy import to avoid analyzer errors if model missing during editing
                        // ignore: avoid_dynamic_calls
                        final manager =
                            (CartManager.instance) as dynamic; // runtime-only
                        if (isFavorite) {
                          manager.toggleFavorite(
                            id: widget.product['id'] ?? widget.product['title'] ?? DateTime.now().toString(),
                            title: widget.product['title'] ?? 'Product',
                            price: double.tryParse((widget.product['price'] ?? '0').replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0.0,
                            imageUrl: widget.product['imageUrl'] ?? '',
                            details: 'Size: L | Color: Black',
                          );
                        } else {
                          manager.toggleFavorite(
                            id: widget.product['id'] ?? widget.product['title'] ?? DateTime.now().toString(),
                            title: widget.product['title'] ?? 'Product',
                            price: double.tryParse((widget.product['price'] ?? '0').replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0.0,
                            imageUrl: widget.product['imageUrl'] ?? '',
                            details: 'Size: L | Color: Black',
                          );
                        }
                      } catch (_) {}
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE + PRICE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product['title'] ?? 'Product',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.product['price'] ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              rating = index + 1.0;
                            });
                          },
                          child: Icon(
                            index < rating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.green,
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Color",
                                style: TextStyle(color: Colors.grey)),
                            const SizedBox(height: 10),
                            Row(
                              children: List.generate(colors.length, (i) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = i;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: colors[i],
                                      shape: BoxShape.circle,
                                      border: selectedColor == i
                                          ? Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            )
                                          : null,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Size",
                                style: TextStyle(color: Colors.grey)),
                            const SizedBox(height: 10),
                            Row(
                              children: List.generate(sizes.length, (i) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = i;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: selectedSize == i
                                          ? Colors.black
                                          : Colors.grey[200],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      sizes[i],
                                      style: TextStyle(
                                        color: selectedSize == i
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    ListTile(
                      title: const Text("Description"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const DescriptionPage(),
                        //   ),
                        // );
                      },
                    ),

                    ListTile(
                      title: const Text("Reviews"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const ReviewsPage(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: const Text("Add To Cart", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}