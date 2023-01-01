import 'package:flutter/material.dart';
import 'package:kvt_deneme_son/matrix/sonucSayfasi.dart';

class matrisOlusturma extends StatelessWidget {
  final int numRows;
  final int numColumns;
  final double alfaKatsayisi;
  var dropDownValue;
  matrisOlusturma(
      {Key? key,
      required this.numRows,
      required this.numColumns,
      required this.alfaKatsayisi,
      required this.dropDownValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> matrix =
        List.generate(numRows, (_) => List.generate(numColumns, (_) => ""));
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numColumns; j++) {
        matrix[i][j] = "";
      }
    }
    void _updateMatrix(int numRows, int numColumns, String value) {
      matrix[numRows][numColumns] = value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Veri Girişi "),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(50),
              child: Table(
                children: [
                  for (int i = 0; i < numRows; i++)
                    TableRow(
                      children: [
                        for (int j = 0; j < numColumns; j++)
                          TableCell(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.greenAccent), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              initialValue: matrix[i][j],
                              onChanged: (value) => _updateMatrix(i, j, value),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_downward_outlined),
                      Text("N Alternatif", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.arrow_forward_outlined),
                      Text(
                        "N Doğal Durum",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sonucSayfasi(
                                matrix: matrix,
                                alfaKatsayisi: alfaKatsayisi,
                                dropDownValue: dropDownValue,
                              )));
                },
                child: Text("Sonuçları Gör"))
          ],
        ),
      ),
    );
  }
}
