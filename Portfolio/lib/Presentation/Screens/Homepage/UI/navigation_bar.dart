
import 'package:demo_project/Presentation/Screens/Homepage/UI/profile_page.dart';
import 'package:flutter/material.dart';
import './education_page.dart';
import './project_page.dart';
import 'home_page.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = const [
    homePage(),
    projectPage(),
    educationPage(),
    profilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        
        decoration: BoxDecoration(
          boxShadow: [ BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              // backgroundColor: Colors.transparent,

              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,size: 30.0,), label: "Home",backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book,size: 30.0,), label: "Education",backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_copy,size: 30.0,), label: "Projects",backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline,size: 30.0,), label: "Profile",backgroundColor: Colors.blue),
              ]),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
