import 'package:flutter/material.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: const SafeArea(child: Center(child: Text("Selamat Datang")),)
    );
  }
}