import 'package:coffee_shop/models/coffee.dart';

import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  final Coffee coffee;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ListTile(
          leading: Image.asset(
            coffee.image,
            width: 50, // Adjust the width to fit your UI
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(coffee.name),
          subtitle: Text('\$${coffee.price}'),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
