import 'package:flutter/material.dart';
import 'package:kvt_deneme_son/matrix/matrisBilgilerli.dart';

class girisSayfasi extends StatefulWidget {
  const girisSayfasi({Key? key}) : super(key: key);

  @override
  State<girisSayfasi> createState() => _girisSayfasiState();
}

class _girisSayfasiState extends State<girisSayfasi> {
  final String _teknikIsim = "Belirsizlik Altında Karar Verme";
  final String _hazirlayanlar = "Hazırlayanlar : \nHalilhan SAYIN\nBüşra BAŞ";
  final String _aciklamaMetni =
      "Durum veya Olasılıkların gerçekleşme olasılıklarının bilinmediği belirsizlik ortamında karar vermek için kullanılmaktadır. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karar Verme Teknikleri"),
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset("resimler/istatistik.png"),
          Text(
            _teknikIsim,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _aciklamaMetni,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => matrisBilgileri()));
              },
              child: Text("Hadi Başlayalım "))
        ],
      )),
    );
  }
}
