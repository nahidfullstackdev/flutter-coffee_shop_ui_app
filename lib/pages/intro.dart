import 'package:coffee_shop/pages/home.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Center(
              child: Image.asset(
                'assets/images/logo_coffee.png',
                color: Colors.brown.shade300,
                height: screenSize.height / 5,
                width: screenSize.width / 2.5,
              ),
            ),

            const SizedBox(
              height: 60,
            ),

            // intro text
            const Text(
              'Brew Day',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 8,
            ),

            // sub text
            const Text(
              'How do you like your Coffee',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),

            const SizedBox(
              height: 50,
            ),

            // button shop now
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Home(),
                  )),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.all(20)),
                  child: const Text(
                    'Shop now',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
