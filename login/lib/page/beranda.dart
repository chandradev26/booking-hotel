import 'package:flutter/material.dart';
import 'package:login/page/detail_kamar.dart';

class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> dataKategori = [
      [
        'Deluxe Room',
        'deluxe_room.jpg',
        'Fasilitas yang diberikan berupa pilihan kasur yang bisa kamu pilih, double bed atau twin bed. Dari segi interior kamar ini terkesan lebih mewah. Kamarnya besar.'
      ],
      [
        'Junior Suite Room',
        'junior_suite_room.jpg',
        'Fasilitas yang diberikan berupa ruang tamu dan tempat tidur. Ruang tamu tersebut biasanya dibatasi atau disekat dengan lemari besar agar tempat tidur tidak terlihat.'
      ],
      [
        'Presidential Suite',
        'presidential_suite.jpg',
        'Fasilitas yang diberikan berupa  ruang tamu, tempat tidur, dapur, interior, pemandangan kamar yang menarik dan bagus'
      ],
      [
        'Standard Room',
        'standar_room.jpg',
        'Tipe kamar hotel yang paling dasar dan Fasilitas yang ada pun standar seperti kasur ukuran king size atau dua queen size.'
      ],
      [
        'Suite Room',
        'suite_room.jpg',
        'Fasilitas yang diberikan berupa ruang tamu, tempat tidur, dan dapur. Ruang tamu di kamar hotel ini terpisah dari kamar tidur.'
      ],
      [
        'Superior Room',
        'superior_room.jpg',
        'Fasilitas yang diberikan berupa kasur king size, interior kamar, atau pemandangan dari kamar.'
      ],
    ];
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 30,
                width: 5,
                color: Colors.blue[800],
                margin: const EdgeInsets.only(right: 10),
              ),
              Text(
                'Kategori Kamar',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 2 / 3,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              children: dataKategori
                  .map(
                    (e) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailKamar(
                                    namaKategori: e[0],
                                    image: e[1],
                                    deskripsi: e[2],
                                  ))),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width - 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/${e[1]}'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[800],
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20))),
                              margin: const EdgeInsets.only(top: 30),
                              padding:
                                  const EdgeInsets.fromLTRB(15, 10, 20, 10),
                              child: Text(
                                e[0],
                                style: TextStyle(
                                    color: Colors.grey[50],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ))
                        ]),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    ));
  }
}
