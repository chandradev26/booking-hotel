import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

AlertDialog customErrorModal(context, String text) {
  return AlertDialog(
    content: Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/lotties/error.json", repeat: false)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Error !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red[800],
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
            onTap: () => Navigator.pop(context),
            child: Container(
                // margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
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
