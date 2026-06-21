import 'package:flutter/foundation.dart';

class CartItem {
  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.details,
    this.quantity = 1,
  });

  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String details;
  int quantity;
}

class CartManager extends ChangeNotifier {
  CartManager._internal();

  static final CartManager instance = CartManager._internal();

  final List<CartItem> _items = [];
  final Set<String> _favorites = {};

  List<CartItem> get items => List.unmodifiable(_items);

  bool isFavorite(String id) => _favorites.contains(id);

  void addItem(CartItem item) {
    final existing = _items.indexWhere((e) => e.id == item.id);
    if (existing >= 0) {
      _items[existing].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    final idx = _items.indexWhere((e) => e.id == id);
    if (idx >= 0) {
      _items[idx].quantity = quantity;
      if (_items[idx].quantity <= 0) _items.removeAt(idx);
      notifyListeners();
    }
  }

  double get subtotal => _items.fold(0.0, (s, i) => s + i.price * i.quantity);

  /// Toggle favorite: when favorited, add to cart; when unfavorited, remove from cart.
  void toggleFavorite({required String id, required String title, required double price, required String imageUrl, required String details}) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
      removeItem(id);
    } else {
      _favorites.add(id);
      addItem(CartItem(id: id, title: title, price: price, imageUrl: imageUrl, details: details));
    }
    notifyListeners();
  }
}
