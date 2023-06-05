import 'package:bilgi_yarismasi/soru_class.dart';

//main dosyamızın ıcındekı sınıfları elımızden geldıgınce soyutlayarak ayrı dosyalar halınde ayarladık
//böylece testverılerı yani sorular hakkında herhangi bir degısıklık yapmak ıstedıgımızde mainle ugrasmadan duzenleyebılecegız

class TestVeri {
  int _soruIndexi = 0;

  List<Soru> _soruBankasi = [
    Soru(
      soruMetni: 'Fransızlar 80 demek için, 4 - 20 der',
      soruYaniti: true,
    ),
    Soru(
      soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
      soruYaniti: true,
    ),
    Soru(
      soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
      soruYaniti: true,
    ),
    Soru(
      soruMetni: 'Dünya düzdür',
      soruYaniti: false,
    ),
    Soru(
      soruMetni: 'Kelebeklerin ömrü bir gündür',
      soruYaniti: false,
    ),
    Soru(
      soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir',
      soruYaniti: false,
    ),
    Soru(
      soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
      soruYaniti: true,
    )
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndexi].soruMetni.toString();
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndexi].soruYaniti!;
  }

  bool testBittiMi() {
    if (_soruIndexi == _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int testiSifirla() {
    return _soruIndexi = 0;
  }

  void sonrakiSoru() {
    if (_soruIndexi < _soruBankasi.length - 1) {
      _soruIndexi++;
    }
  }
}
