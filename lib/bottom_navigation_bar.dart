import 'package:e_book_store/screens/cart_screens/cart_screen.dart';
import 'package:e_book_store/screens/home_screens/home_screen.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 90,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          backgroundColor: dark ? Colors.black : Colors.white,
          indicatorColor: dark ? Colors.transparent : Colors.transparent,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: Image.asset("assets/icons/home.png"),
              selectedIcon: Image.asset("assets/icons/home_fill.png"),
              label: 'Home',
            ),
            NavigationDestination(
                selectedIcon: Image.asset("assets/icons/menu_fill.png"),
                icon: Image.asset("assets/icons/menu.png"),
                label: 'Category'),
            NavigationDestination(
                selectedIcon: Image.asset("assets/icons/cart_fill.png"),
                icon: Image.asset("assets/icons/cart.png"),
                label: 'Cart'),
            NavigationDestination(
                selectedIcon: Image.asset("assets/icons/profile_fill.png"),
                icon: Image.asset("assets/icons/profile.png"),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    const Center(child: Text("Category")),
    const CartScreen(),
    const Center(child: Text("Profile"))
  ];
}
