import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> dataBooking = [
      ['deluxe_room.jpg', 'Deluxe Room', '29 May 2022'],
      ['junior_suite_room.jpg', 'Junior Suite Room', '19 December 2022'],
      ['deluxe_room.jpg', 'Deluxe Room', '2 April 2023'],
    ];

    return SafeArea(
        child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      children: dataBooking
          .map((e) => Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.width / 3.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/image/${e[0]}'),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          e[1],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                           'Dibooking pada tanggal : \n${e[2]}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700]),
                        )
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    ));
  }
}
