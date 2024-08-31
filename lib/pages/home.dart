import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:coffee_shop/components/my_drawer.dart';
import 'package:coffee_shop/constant/colors.dart';
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    // Shop page
    Shopping(),

    // Cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Image.asset(
                'assets/images/logo_coffee.png',
                color: Colors.brown,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                'Log out',
                style:
                    TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                Icons.logout,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => _navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
