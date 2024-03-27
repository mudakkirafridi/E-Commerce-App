import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/order.dart';
import 'package:e_commerce_app/pages/profile.dart';
import 'package:e_commerce_app/pages/wallet.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late ProfileScreen profileScreen;
  late OrderScreen orderScreen;
  late WalletSreen walletSreen;
  @override
  void initState() {
    homePage = const Home();
    orderScreen = const OrderScreen();
    profileScreen = const ProfileScreen();
    walletSreen = const WalletSreen();
    pages = [homePage, orderScreen, profileScreen, walletSreen];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            )
          ]),
      body: pages[currentTabIndex],
    );
  }
}
