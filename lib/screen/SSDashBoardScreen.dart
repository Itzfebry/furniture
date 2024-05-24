import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:furniture/fragment/SSCartFragment.dart';
import 'package:furniture/fragment/SSRiwayatFragment.dart';
import 'package:furniture/fragment/SSHomeFragment.dart';
import 'package:furniture/fragment/SSProfileFragment.dart';
import 'package:furniture/fragment/SSProductFragment.dart';
import 'package:furniture/model/cart_item.dart';

class SSDashBoardScreen extends StatefulWidget {
  @override
  State<SSDashBoardScreen> createState() => _SSDashBoardScreenState();
}

class _SSDashBoardScreenState extends State<SSDashBoardScreen> {
  int selectedIndex = 0;
  List<CartItem> cartItems = [];

  List<Widget> get tabs => [
    SSHomeFragment(),
    SSProductFragment(cartItems: cartItems, onCartUpdated: updateCart),
    SSCartFragment(cartItems: cartItems),
    SSRiwayatFragment(),
    SSProfileFragment(),
  ];

  void updateCart() {
    setState(() {}); // Untuk memperbarui UI ketika ada perubahan pada cartItems
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '', activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '', activeIcon: Icon(Icons.shopping_bag_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: '', activeIcon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: '', activeIcon: Icon(Icons.list_alt_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '', activeIcon: Icon(Icons.person)),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Color(0xff9e9e9e),
        selectedItemColor: context.iconColor,
        iconSize: 24,
        selectedFontSize: 14,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: tabs[selectedIndex],
    );
  }
}
