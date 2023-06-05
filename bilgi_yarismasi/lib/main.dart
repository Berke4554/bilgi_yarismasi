import 'package:bilgi_yarismasi/sabitler.dart';
import 'package:bilgi_yarismasi/test_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 = TestVeri();

  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("☻ Tebrikler Testi Tamamladınız"),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              OutlinedButton(
                child: Text("Kapat"),
                onPressed: () {
                  //alertdialog sayfasını kapatmaya yarar
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.testiSifirla();
                    //soru indeksımızı private bi degisken olarak testveri klasında sakladıgımızdan oturu orada bu degıskenı 0layacak bı fonksıyon yazdık
                    //ve burada onu cagırdık
                    secimler.clear();
                    //secimler listesini yani dogru yanlıs ıfadelerı 0layan kod
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        test_1.getSoruYaniti() == secilenButon
            ? secimler.add(dogruIkon)
            : secimler.add(yanlisIkon);

        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '${test_1.getSoruMetni()}',
                //soruBankasının kacıncı ındeksındekı elemanın soruyanıtı adlı ınstanceına ulastı
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(12),
                      ),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        butonFonksiyonu(false);
                        //burada olan fonksıyonumuzu ayrı olarak yukarıda tanımladık ve orada daha duzenlı bır sekılde paketledık
                        //boylece tekrar tekrar kullanımı durumunda en bastan yazmak zorunda kalmadık sadece fonksıyonu cagırmamız yeterlı oldu
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(12),
                      ),
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        butonFonksiyonu(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
