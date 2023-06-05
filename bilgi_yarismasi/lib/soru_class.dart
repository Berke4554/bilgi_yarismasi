import 'package:flutter/material.dart';

class Soru {
  String? soruMetni;
  bool? soruYaniti;

  Soru({@required this.soruMetni, @required this.soruYaniti});
  // @required diyerekten nesne olusturdugumuzda bu parametrelerı gırmesını zorunlu kıldık
  // parametrelerimizi {} ıcerısıne alaraktan da nesne olustururken parametre tanımlamamızı saglamasına yarıcak
}
