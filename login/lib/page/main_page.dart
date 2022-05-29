import 'package:flutter/material.dart';
import 'package:login/page/beranda.dart';
import 'package:login/page/login.dart';
import 'package:login/page/user.dart';
import 'package:login/service/firebase_auth.dart';

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
        leading: Icon(
          Icons.ac_unit,
          color: Colors.blue[800],
        ),
        backgroundColor: Colors.blue[800],
        title: const Center(child: Text('Grande Hotel')),
        actions: [
          GestureDetector(
            onTap: () async {
              await AuthFirebase.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (route) => false);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.logout,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(child: page[pageNow][2]),
      bottomNavigationBar: BottomNavigationBar(
        items: page
            .map((e) => BottomNavigationBarItem(icon: Icon(e[1]), label: e[0]))
            .toList(),
        currentIndex: pageNow,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey[800],
        onTap: (int index) {
          setState(() {
            pageNow = index;
          });
        },
      ),
    );
  }
}
