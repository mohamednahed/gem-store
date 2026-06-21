import 'package:flutter/material.dart';
import 'package:gem_store/models/cart_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final manager = CartManager.instance;

  @override
  void initState() {
    super.initState();
    manager.addListener(_onChange);
  }

  @override
  void dispose() {
    manager.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final items = manager.items;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 88,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text('Your Cart', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 22)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: items.isEmpty
                  ? const Center(child: Text('Your cart is empty'))
                  : ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return _buildCartItem(item);
                      },
                    ),
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(),
            const SizedBox(height: 16),
            _buildCheckoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 6))]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(item.imageUrl.isEmpty ? 'assets/images/product1.jpg' : item.imageUrl, width: 80, height: 100, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 80, height: 100, color: Colors.grey.shade200))),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('\$${item.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black87)),
                  const SizedBox(height: 8),
                  Text(item.details, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: const Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            IconButton(icon: const Icon(Icons.remove, size: 18), splashRadius: 20, onPressed: item.quantity > 1 ? () => manager.updateQuantity(item.id, item.quantity - 1) : null),
                            Text(item.quantity.toString(), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                            IconButton(icon: const Icon(Icons.add, size: 18), splashRadius: 20, onPressed: () => manager.updateQuantity(item.id, item.quantity + 1)),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Icons.delete_outline), onPressed: () => manager.removeItem(item.id)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 6))]),
      child: Column(
        children: [
          _buildSummaryRow('Product price', '\$${manager.subtotal.toStringAsFixed(0)}'),
          const SizedBox(height: 14),
          _buildSummaryRow('Shipping', 'Freeship'),
          const Divider(height: 30, thickness: 1.2),
          _buildSummaryRow('Subtotal', '\$${manager.subtotal.toStringAsFixed(0)}', valueStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {TextStyle? valueStyle}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: TextStyle(fontSize: 15, color: Colors.grey.shade600)), Text(value, style: valueStyle ?? const TextStyle(fontWeight: FontWeight.w700))]);
  }

  Widget _buildCheckoutButton(BuildContext context) {
    final hasItems = manager.items.isNotEmpty;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: hasItems ? Colors.black87 : Colors.grey.shade400, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        onPressed: hasItems
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Proceeding to checkout with \$${manager.subtotal.toStringAsFixed(0)}')));
              }
            : null,
        child: const Text('Proceed to checkout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
/*
// Export the same class name expected elsewhere
typedef Cart = CartScreen;
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cart Screen"),
      ),
    );
  }
}
*/