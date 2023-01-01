import 'package:flutter/material.dart';
import 'package:kvt_deneme_son/matrix/matrixOlusturma.dart';

class matrisBilgileri extends StatefulWidget {
  const matrisBilgileri({Key? key}) : super(key: key);

  @override
  State<matrisBilgileri> createState() => _matrisBilgileriState();
}

class _matrisBilgileriState extends State<matrisBilgileri> {
  var satirController = TextEditingController();
  var sutunController = TextEditingController();
  var alfaKatsayisiController = TextEditingController();
  double alfaKatsayisi = 0.5;
  String dropDownValue = 'Kazanç Yapılı';
  var items = ['Kazanç Yapılı', 'Maliyet Yapılı'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilgileri Giriniz"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Alfa Katsayısı : ${alfaKatsayisi}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Slider(
                    value: alfaKatsayisi,
                    max: 1,
                    min: 0,
                    divisions: 100,
                    label: alfaKatsayisi.toString(),
                    onChanged: (double value) {
                      setState(() {
                        alfaKatsayisi = value;
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: satirController,
                  decoration: InputDecoration(
                    hintText: "Alternatif Sayısı",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: sutunController,
                  decoration: InputDecoration(
                    hintText: "Doğal Durum  Sayısı",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
              DropdownButton(
                borderRadius: BorderRadius.circular(8),
                value: dropDownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    int numRows = int.parse(satirController.text);
                    int numColumns = int.parse(sutunController.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => matrisOlusturma(
                                  numColumns: numColumns,
                                  numRows: numRows,
                                  alfaKatsayisi: alfaKatsayisi,
                                  dropDownValue: dropDownValue,
                                )));
                  },
                  child: const Text("Matris Oluştur"))
            ],
          ),
        ),
      ),
    );
  }
}
