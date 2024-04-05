import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OgrenciListele extends StatelessWidget {
  CollectionReference ogrenciler =
      FirebaseFirestore.instance.collection('ogrenciler');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrencileri Listele'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: ogrenciler.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                    ),
                  );
                }
                List<Column> ogr = [];
                final veriler = snapshot.data?.docs;
                for (var veri in veriler!) {
                  final no = veri.get('ogrno');
                  final ad = veri.get('adi');
                  final soyad = veri.get('soyadi');
                  final dtrh = veri.get('dtrh');
                  var trh =
                      DateTime.fromMillisecondsSinceEpoch(dtrh.seconds * 1000);
                  var dyil = trh.day.toString() +
                      "." +
                      trh.month.toString() +
                      "." +
                      trh.year.toString();
                  final foto = veri.get('foto');
                  ogr.add(
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                foto,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Öğrenci No: $no'),
                                Text('Adı: $ad'),
                                Text('Soyadı: $soyad'),
                                Text('Doğum Tarihi: $dyil'),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return Expanded(
                  child: ListView(
                    children: ogr,
                  ),
                );
              })
        ],
      ),
    );
  }
}
