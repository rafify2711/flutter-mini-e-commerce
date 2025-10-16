  import 'package:flutter/material.dart';
 import '../cart/presentation/view/cart_screen.dart';
import '../favorite/favorite_screen.dart';
  import '../home/presentation/view/home_screen.dart';
  import '../profile/profile_screen.dart';
import 'custom_bottom_nav_bar.dart';


  class LayOut extends StatefulWidget {
    @override
    _LayOutState createState() => _LayOutState();
  }

  class _LayOutState extends State<LayOut> {
    int _currentIndex = 0;

    final List<Widget> _screens =[
      HomeScreen(),
      FavoriteScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: CustomBottomNavBar(currentIndex: _currentIndex, onTap:  (index) {
          setState(() {
            _currentIndex = index;
          });
        }));
    }
  }
