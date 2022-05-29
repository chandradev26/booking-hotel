import 'package:flutter/material.dart';
import 'package:login/page/booking.dart';

class DetailKamar extends StatelessWidget {
  final String namaKategori, image, deskripsi;
  const DetailKamar(
      {Key? key,
      required this.namaKategori,
      required this.image,
      required this.deskripsi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.grey[800],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[50],
        title: Text(
          namaKategori,
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage('assets/image/$image'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 30,
                  width: 5,
                  color: Colors.blue[800],
                  margin: const EdgeInsets.only(right: 10),
                ),
                Text(
                  'Deskripsi',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                deskripsi,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      )),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.blue[800],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Booking(namaKategori: namaKategori)));
              },
              child: const Icon(
                Icons.fact_check,
                size: 25,
              )),
        ),
      ),
    );
  }
}
