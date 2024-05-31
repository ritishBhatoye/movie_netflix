import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/streamingPlayer.dart';
class CartItem {
  final String name;
  final String image;
  final String year;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.year,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  int _labTestCount = 0;

  List<CartItem> get cartItems => _cartItems;

  bool get isCartEmpty => _cartItems.isEmpty;

  void addToCart(CartItem newItem) {
    bool itemExists = false;
    for (var item in _cartItems) {
      if (item.name == newItem.name) {
        item.quantity++;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      if (newItem.name == "Lab Test") {
        if (_labTestCount < 1) {
          _cartItems.add(newItem);
          _labTestCount++;
        }
      } else {
        _cartItems.add(newItem);
      }
    }
    notifyListeners();
  }

  void addMultipleToCart(List<CartItem> items) {
    _cartItems.addAll(items);
    notifyListeners();
  }

  void removeFromCart(CartItem itemToRemove) {
    _cartItems.remove(itemToRemove);
    if (itemToRemove.name == "Lab Test") {
      _labTestCount--;
    }
    notifyListeners();
  }

  // void increaseQuantity(CartItem item) {
  //   item.quantity++;
  //   notifyListeners();
  // }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    _labTestCount = 0;
    notifyListeners();
  }

  // double getTotalCost() {
  //   double total = 0;
  //   for (var item in _cartItems) {
  //     total += item.year * item.quantity;
  //   }
  //   return total;
  // }
}

// class CartProvider with ChangeNotifier {
//   final List<Movie> _cartItems = [];

//   List<Movie> get cartItems => _cartItems;

//   void addToCart(Movie movie) {
//     _cartItems.add(movie);
//     notifyListeners();
//   }

//   void removeFromCart(Movie movie) {
//     _cartItems.remove(movie);
//     notifyListeners();
//   }

//   bool isInCart(Movie movie) {
//     return _cartItems.contains(movie);
//   }
// }
 