import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/provider/coffee_shop.dart';
import 'package:coffee_shop/widgets/add_to_cart_screen.dart';

import 'package:coffee_shop/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Shopping extends ConsumerStatefulWidget {
  const Shopping({super.key});

  @override
  ConsumerState<Shopping> createState() => _ShoppingState();
}

enum CoffeeSize { S, M, L }

class _ShoppingState extends ConsumerState<Shopping> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shop = ref.watch(shopprovider);

    void addToCart(Coffee coffee) {
      ref.read(cartProvider.notifier).addItemToCart(coffee);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Added to Cart'),
      ));

      // showDialog(
      //   context: context,
      //   builder: (context) => const AlertDialog(
      //     title: Text('Successfully added to Cart'),
      //   ),
      // );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How do you like your coffee?',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shop.length,
              itemBuilder: (context, index) => CoffeeTile(
                coffee: shop[index],
                onPressed: () => addToCart(shop[index]),
                icon: const Icon(Icons.add_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
