import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takehomechallenge/getx_controller/favorit_controller.dart';
import 'package:takehomechallenge/page/favorite_page.dart';
import 'package:takehomechallenge/page/home_page.dart';
import 'package:takehomechallenge/page/search_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  final List<Widget> _screenList = [
    const HomePage(),
    const SearchPage(),
    const FavoritPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  FavoriteController favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (controller) {
        return Scaffold(
          body: _screenList[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xff171b36),
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',  
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  label:
                      Text(controller.favoriteBooks.length.toString()),
                  child: const Icon(
                    Icons.favorite,
                  ),
                ),
                label: 'Favorite',
              ),
            ],
          ),
        );
      },
    );
  }
}
