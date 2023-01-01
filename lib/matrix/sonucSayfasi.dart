import 'package:flutter/material.dart';
import 'package:kvt_deneme_son/core/islemler.dart';
import 'package:kvt_deneme_son/girisSayfasi.dart';

class sonucSayfasi extends StatefulWidget {
  final List<List<String>> matrix;
  final double alfaKatsayisi;
  var dropDownValue;
  sonucSayfasi(
      {Key? key,
      required this.matrix,
      required this.alfaKatsayisi,
      required this.dropDownValue})
      : super(key: key);

  @override
  State<sonucSayfasi> createState() => _sonucSayfasiState();
}

class _sonucSayfasiState extends State<sonucSayfasi> {
  @override
  Widget build(BuildContext context) {
    var iyimserlikKazancStr = iyimserlikKazanc(widget.matrix);
    var iyimserlikMaliyetStr = iyimserlikMaliyet(widget.matrix);
    var esOlasilikList = esOlasilik(widget.matrix);
    var kotumserlikKazancStr = kotumserlikListKazanc(widget.matrix);
    var kotumserlikMaliyerStr = kotumserlikListMaliyet(widget.matrix);
    var hurwiczStr = hurwicz(widget.matrix, widget.alfaKatsayisi);

    kazancEkrani() {
      return Column(
        children: [
          ListTile(
            title: const Text("İyimserlik ;",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${iyimserlikKazancStr[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${iyimserlikKazancStr[0]} ",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Text("Kötümserlik Değeri :",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${findMaximum(kotumserlikKazancStr)[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${findMaximum(kotumserlikKazancStr)[0]}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Text("Eş Olasılık : ",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${findMaximum(esOlasilikList)[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${findMaximum(esOlasilikList)[0]}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Text("Hurwicz Değeri : ",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${findMaximum(hurwiczStr)[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${findMaximum(hurwiczStr)[0]}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
        ],
      );
    }

    maliyetEkrani() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text("İyimserlik ;",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${iyimserlikMaliyetStr[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${iyimserlikMaliyetStr[0]} ",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Text("Kötümserlik Değeri :",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${findMinimum(kotumserlikMaliyerStr)[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${findMinimum(kotumserlikMaliyerStr)[0]}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Text("Eş Olasılık Değeri : ",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${findMinimum(esOlasilikList)[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${findMinimum(esOlasilikList)[0]}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            title: const Text("Hurwicz Değeri : ",
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
            subtitle: Text(
                "${findMinimum(hurwiczStr)[1] + 1}. Alternatif Seçilmelidir\nSayısal Değeri : ${findMinimum(hurwiczStr)[0]}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          ),
        ],
      );
    }

    if (widget.dropDownValue == 'Kazanç Yapılı') {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Sonuç Sayfası"),
        ),
        body: Center(
          child: Column(children: [
            kazancEkrani(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text("Anasayfaya Dön"))
          ]),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Sonuç Sayfası"),
        ),
        body: Center(
          child: Column(
            children: [
              maliyetEkrani(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Anasayfaya Dön"))
            ],
          ),
        ),
      );
    }
  }
}
