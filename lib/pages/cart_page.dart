import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/provider/coffee_shop.dart';

import 'package:coffee_shop/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _ShoppingState();
}

class _ShoppingState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    void removeFromCart(Coffee coffee) {
      ref.read(cartProvider.notifier).removeItemFromCart(coffee);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('Removed from Cart'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                ref.read(cartProvider.notifier).addItemToCart(coffee);
              });
            },
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Cart',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text('Cart is empty'),
                  )
                : Column(children: [
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) => CoffeeTile(
                          coffee: cart[index],
                          onPressed: () => removeFromCart(cart[index]),
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown),
                          onPressed: () {},
                          child: const Text(
                            'Pay now',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ]),
          ),
        ],
      ),
    );
  }
}
