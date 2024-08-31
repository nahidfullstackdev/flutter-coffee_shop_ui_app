import 'package:flutter/material.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key, required this.addtoCart});
  final VoidCallback addtoCart;

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

enum CoffeeSize { S, M, L }

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    CoffeeSize selectedSize = CoffeeSize.S;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // image

            Image.asset(
              'assets/images/expresso.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 50,
            ),

            // text quantity
            Column(
              children: [
                const Text(
                  'Q U A N T I T Y',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                // row decrement increment
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            // size text
            Column(
              children: [
                const Text(
                  'S I Z E',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                // s m l row

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedSize = CoffeeSize.S;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 45,
                        decoration: BoxDecoration(
                          color: selectedSize == CoffeeSize.S
                              ? Colors.brown
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'S',
                            style: TextStyle(
                                color: selectedSize == CoffeeSize.S
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 45,
                      decoration: BoxDecoration(
                          color: selectedSize == CoffeeSize.M
                              ? Colors.brown
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = CoffeeSize.M;
                          });
                        },
                        child: Text(
                          'M',
                          style: TextStyle(
                              color: selectedSize == CoffeeSize.M
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40,
                      width: 45,
                      decoration: BoxDecoration(
                          color: selectedSize == CoffeeSize.L
                              ? Colors.brown
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = CoffeeSize.L;
                          });
                        },
                        child: Text(
                          'L',
                          style: TextStyle(
                              color: selectedSize == CoffeeSize.L
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
        // add to cart button
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: SizedBox(
            width: screenSize.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(14),
              ),
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ),
      ],
    );
  }
}
