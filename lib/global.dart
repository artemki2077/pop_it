import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String name = "";
var url = Uri.https("script.google.com",
"macros/s/AKfycbz38DWQQInfkae1zci6UdQJBbMRtCUDvbt_E4DyoXKtwMfsJHZ0eNgivqr4-RTBFIwBkg/exec");
List ff = [];
var id;
bool nam = true;
var q = [];
var n = 0;
var ss = "50.0 goto₽";
var s;
bool la = true;
var shem = 0;
bool sv=true;
List<List> Schemes = <List>[
  // текста                задний фон                кнопка                         тень       название     хз что    платность
  [CupertinoColors.white, CupertinoColors.link, CupertinoColors.destructiveRed, Colors.purple, "Cobalt", Colors.black, false, false, "", 0], // 0
  [CupertinoColors.black, CupertinoColors.systemOrange, Colors.deepPurple, Colors.indigo, "Kari", Colors.black, false, false, "", 0], // 1
  [CupertinoColors.white, CupertinoColors.systemPurple, Colors.greenAccent, Colors.white10, "Stas", Colors.white, false, false, "", 0], // 2
  [CupertinoColors.white, Colors.brown, CupertinoColors.activeGreen, Colors.green, "Forest", Colors.black, false, false, "", 50], // 3
  [CupertinoColors.white, Colors.pinkAccent, Colors.lightBlueAccent, Colors.green, "Barbie", Colors.black, false, false, "", 50], // 4
  [CupertinoColors.black, CupertinoColors.white, CupertinoColors.black, Colors.black12, "Minimalism", Colors.black, false, false, "", 50], // 5
  [CupertinoColors.white, CupertinoColors.black, CupertinoColors.white, Colors.white10, "Monochrome", Colors.white, false, false, "", 50], // 6
  [CupertinoColors.white, Colors.redAccent, Colors.blue, Colors.lightBlueAccent, "Monochrome", Colors.white, false, false, "", 50], // 7
  [CupertinoColors.black, Colors.blueGrey, Colors.blue, Colors.lightBlueAccent, "Дима", Colors.white, false, true, "4.png", 150], // 8
  [CupertinoColors.black, Colors.greenAccent, Colors.blue, Colors.lightBlueAccent, "чмошник", Colors.white, false, true, "1.png", 150], // 9
  [CupertinoColors.black, Colors.purpleAccent, Colors.blue, Colors.lightBlueAccent, "Бес", Colors.white, false, true, "2.png", 200], // 10
  [CupertinoColors.black, Colors.indigo, Colors.blue, Colors.lightBlueAccent, "Ростик", Colors.white, false, true, "3.png", 150], // 11
  [CupertinoColors.white, Colors.blue, Colors.blue, Colors.lightBlueAccent, "Натуральный Казах", Colors.white, false, true, "6.png", 200], // 12
];