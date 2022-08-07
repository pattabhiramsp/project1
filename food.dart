import 'package:assignment/locator.dart';
import 'package:flutter/material.dart';
//import 'package:food_display/screens/calender.dart';
//import 'package:food_display/screens/image.dart';
//import 'package:food_display/screens/location.dart';
import 'calendar.dart';
import 'downloader.dart';
//import 'location.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List pages = [
    Geo(),
    Calendar(),
    Download(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Food Page'),
          centerTitle: true,
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_rounded),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Download',
            ),
          ],
          unselectedFontSize: 20,
          selectedFontSize: 15,
          // type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
        ));
  }
}
