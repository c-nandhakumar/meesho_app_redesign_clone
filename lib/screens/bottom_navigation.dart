import 'package:flutter/material.dart';
import 'package:meeshoapp/screens/account_screen.dart';
import 'package:meeshoapp/screens/categories_screen.dart';
import 'package:meeshoapp/screens/community_screen.dart';
import 'package:meeshoapp/screens/home_screen.dart';
import 'package:meeshoapp/screens/myorders_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int index = 0;
  final screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const MyOrdersScreen(),
    const CommunityScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.pinkAccent,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (int value) => setState(() => index = value),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_sharp), label: "My Orders"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add), label: "Community"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ]),
    );
  }
}
