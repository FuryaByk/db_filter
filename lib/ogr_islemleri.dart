import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class OgrenciIslemleri extends StatefulWidget {
  @override
  State<OgrenciIslemleri> createState() => _OgrenciIslemleriState();
}

class _OgrenciIslemleriState extends State<OgrenciIslemleri> {
  late final dtrh;
  DateTime secilideger = DateTime.now();
  final ImagePicker picker = ImagePicker();

// Pick an image.
  late final XFile? image;

// Capture a photo.

  //late File image;

  Future getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    //image?.saveTo();
  }

  void Goster() {
    showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(1900, 1, 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci İşlemleri'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Öğrenci Numarası:'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Öğrenci Adı:'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Öğrenci Soyadı:'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Doğum Tarihi:'),
              ),
              Text(secilideger.year.toString()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FilledButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: DateTime.now())
                            .then((value) => setState(() {
                                  secilideger = value!;
                                }));
                      },
                      child: Text('Doğum Tarih Seç')),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Fotoğraf:'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'images/Logo1.jpg',
                    width: 100,
                    height: 100,
                    color: Colors.redAccent,
                  ),
                  FilledButton(onPressed: getImage, child: Text('Resim Seç')),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class OgrenciIslemleri extends StatelessWidget {
//   late final dtrh;
//   late DateTime secilideger;
//
//   @override
//   Widget build(BuildContext context) {
//     void Goster() {
//       showDatePicker(
//           context: context,
//           firstDate: DateTime.now(),
//           lastDate: DateTime(1900, 1, 1));
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Öğrenci İşlemleri'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text('Öğrenci Numarası:'),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30))),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text('Öğrenci Adı:'),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30))),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text('Öğrenci Soyadı:'),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30))),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text('Doğum Tarihi:'),
//               ),
//               Text(secilideger.toString()),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: FilledButton(
//                       onPressed: () {
//                         showDatePicker(
//                                 context: context,
//                                 firstDate: DateTime(1900, 1, 1),
//                                 lastDate: DateTime.now())
//                             .then((value) => secilideger = value!);
//                       },
//                       child: Text('Doğum Tarih Seç')),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text('Fotoğraf:'),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30))),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// CalendarDatePicker(
// initialDate: DateTime.now(),
// firstDate: DateTime(
// 1900,
// 1,
// 1,
// 0,
// 0,
// 0,
// ),
// lastDate: DateTime.now(),
// onDateChanged: (DateTime value) {
// dtrh = value;
// },
// )
