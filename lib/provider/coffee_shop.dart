import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// shop provider for managing items added to the cart
final shopprovider = StateNotifierProvider<ShopNotifier, List<Coffee>>((ref) {
  return ShopNotifier();
});

class ShopNotifier extends StateNotifier<List<Coffee>> {
  ShopNotifier() : super([]) {
    state = _shop;
  }

// Coffee shop provider for managing available coffee list
  final List<Coffee> _shop = [
    Coffee(
        name: 'Long Black',
        image: 'assets/images/long_black_coffee.png',
        price: '4.10'),
    Coffee(name: 'Latte', image: 'assets/images/latte.png', price: '4.00'),
    Coffee(
        name: 'Expresso', image: 'assets/images/expresso.png', price: '4.40'),
    Coffee(
        name: 'Iced Coffee',
        image: 'assets/images/ice_coffee.png',
        price: '5.00'),
  ];
}

// Cart provider for managing items added to the cart
final cartProvider = StateNotifierProvider<CartNotifier, List<Coffee>>((ref) {
  return CartNotifier();
});

// StateNotifier for managing the cart state
class CartNotifier extends StateNotifier<List<Coffee>> {
  CartNotifier() : super([]);

  // Add item to cart
  void addItemToCart(Coffee coffee) {
    state = [...state, coffee];
  }

  // Remove item from cart
  void removeItemFromCart(Coffee coffee) {
    state = state.where((item) => item != coffee).toList();
  }
}
