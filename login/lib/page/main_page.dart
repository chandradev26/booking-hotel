import 'package:flutter/material.dart';
import 'package:login/page/beranda.dart';
import 'package:login/page/user.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageNow = 0;

  List<List<dynamic>> page = [
    ['Home', Icons.home, const Beranda()],
    ['User', Icons.person, const User()]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Center(child: Text('Grande Hotel')),),
      body: SafeArea(child: page[pageNow][2]),
      bottomNavigationBar: BottomNavigationBar(
          items: page
              .map(
                  (e) => BottomNavigationBarItem(icon: Icon(e[1]), label: e[0]))
              .toList(),
              currentIndex: pageNow,
              selectedItemColor: Colors.blue[800],
              unselectedItemColor: Colors.grey[800],
              onTap: (int index) {
                setState(() {
                  pageNow = index;
                });
              },),
    );
  }
}
