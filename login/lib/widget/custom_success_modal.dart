import 'package:flutter/material.dart';
import 'package:login/page/main_page.dart';
import 'package:lottie/lottie.dart';

AlertDialog customSuccessModal(context, String text) {
  return AlertDialog(
    content: Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child:
                  Lottie.asset("assets/lotties/success.json", repeat: false)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                "Success",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
                (route) => false),
            child: Container(
                // margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Text(
                  "Oke",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}
