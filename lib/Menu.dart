import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'global.dart' as globals;
import 'feedback_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'settings.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  double dt = 1.5;
  var rError = "";
  var yc = globals.Schemes.elementAt(globals.shem).elementAt(2);
  var t = 5;
  var nm = 0;
  var h = {};
  var nt = 0;
  var n = [
    [
      0,
      "",
      "",
      "",
    ],
    [
      0,
      "",
      "",
      "",
    ],
    [
      0,
      "",
      "",
      "",
    ],
    [
      0,
      "",
      "",
      "",
    ],
    [
      0,
      "",
      "",
      "",
    ],
    [
      0,
      "",
      "",
      "",
    ],
  ];
  bool isValidForm = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameContaroller = TextEditingController();
  List<Widget> themes = [];
  bool bError = false;
  String sError = "";
  List<FeedbackModel> feedbacks = List<FeedbackModel>();
  TextStyle textStyle = TextStyle(
      color: globals.Schemes.elementAt(globals.shem).elementAt(0),
      fontSize: 25);
  TextStyle textStyle1 = TextStyle(color: Colors.yellow, fontSize: 20);
  TextStyle textStyle2 = TextStyle(color: Colors.grey, fontSize: 20);
  TextStyle textStyle3 =
      TextStyle(color: Colors.deepOrangeAccent, fontSize: 20);

  TextStyle textStyle1_ = TextStyle(color: Colors.yellow, fontSize: 20);
  TextStyle textStyle2_ = TextStyle(color: Colors.grey, fontSize: 20);
  TextStyle textStyle3_ =
      TextStyle(color: Colors.deepOrangeAccent, fontSize: 20);

  String num(int n) {
    var i = 1;
    var result = "";
    while (i * 3 <= n.toString().length) {
      result = (" " +
              n.toString().substring(n.toString().length - (3 * i),
                  n.toString().length - (3 * (i - 1)))) +
          result;
      i += 1;
    }
    return n.toString().substring(0, n.toString().length % 3) + result;
  }

  chekthems() {
    http
        .get(Uri.https("script.google.com",
            "macros/s/AKfycbykHRolPZdPUGULBf7WhnQ8YRJvwOTZzfotGH7KruCEXBfkAG3GXESaR9A7AIqDK_6A2Q/exec"))
        .then((e) {
      var h = convert.jsonDecode(e.body);
      h.forEach((element) {
        if (element["idn"] == globals.id && element["b"] == 1) {
          globals.q.add(element["n"].toString());
          globals.s.setStringList("q", globals.q);
        }
      });
    });
  }

  makeList() {
    themes = [];
    for (var index = 0; index < globals.Schemes.length; index++) {
      themes.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: globals.Schemes.elementAt(index).elementAt(6) == false
                    ? RaisedButton(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () {
                          globals.shem = index;
                          setState(() {
                            globals.s.setInt("shem", index);
                            yc = globals.Schemes.elementAt(globals.shem)
                                .elementAt(2);
                            makeList();
                          });
                        },
                        child: Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: globals.Schemes.elementAt(index)
                                    .elementAt(1),
                                border: Border.all(color: Colors.black)),
                            child: Column(children: [
                              Container(
                                height: 30,
                              ),
                              Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: globals.Schemes.elementAt(index)
                                        .elementAt(0)),
                              ),
                              Container(
                                height: 20,
                              ),
                              !globals.Schemes.elementAt(index).elementAt(7)
                                  ? Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: globals.Schemes.elementAt(index)
                                            .elementAt(2),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                globals.Schemes.elementAt(index)
                                                    .elementAt(3)
                                                    .withOpacity(0.3),
                                            spreadRadius: 7,
                                            blurRadius: 7,
                                            offset: Offset(3, 5),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset(
                                          "assets/images/${globals.Schemes.elementAt(index).elementAt(8)}"),
                                    ),
                            ])))
                    : FlatButton(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        onPressed: () {
                          globals.shem = index;
                          http.get(Uri.https(
                              "script.google.com",
                              "macros/s/AKfycbzOayeEaj0ChA9oI_Rz6M5F7Bcbmh__9XHg8-b1MloMC1TFXLUi4dajj9WcfB9GucY0qg/exec",
                              {
                                "name": globals.name,
                                "n": globals.shem.toString(),
                                "id": globals.id.toString()
                              }));
                          if (globals.q.contains(index.toString())) {
                            setState(() {
                              globals.shem = index;
                              globals.s.setInt("shem", index);
                              yc = globals.Schemes.elementAt(globals.shem)
                                  .elementAt(2);
                              makeList();
                            });
                          }
                        },
                        child: Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: globals.Schemes.elementAt(index)
                                    .elementAt(1),
                                border: Border.all(color: Colors.black)),
                            child: Column(children: [
                              Container(
                                height: 30,
                              ),
                              Text(
                                "${index + 1}",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: globals.Schemes.elementAt(index)
                                        .elementAt(0)),
                              ),
                              Container(
                                height: 20,
                              ),
                              !globals.Schemes.elementAt(index).elementAt(7)
                                  ? Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: globals.Schemes.elementAt(index)
                                            .elementAt(2),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                globals.Schemes.elementAt(index)
                                                    .elementAt(3)
                                                    .withOpacity(0.3),
                                            spreadRadius: 7,
                                            blurRadius: 7,
                                            offset: Offset(3, 5),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset(
                                          "assets/images/${globals.Schemes.elementAt(index).elementAt(8)}"),
                                    ),
                            ])))),
            Text(
              globals.Schemes.elementAt(index).elementAt(4),
              style: TextStyle(
                color: globals.Schemes.elementAt(globals.shem).elementAt(0),
              ),
            ),
            globals.Schemes.elementAt(index).elementAt(6) == true
                ? Text(
                    "${globals.Schemes.elementAt(index).elementAt(9)} goto₽",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  )
                : Container(),
          ],
        ),
      ));
    }
    setState(() {
      yc = globals.Schemes.elementAt(globals.shem).elementAt(2);
    });
  }

  getFeedbackFromSheet() {
    http.get(globals.url).then((raw) {
      var jsonFeedback = convert.jsonDecode(raw.body);
      jsonFeedback.forEach((element) {
        FeedbackModel feedbackModel = new FeedbackModel();
        if (element['id'] == globals.id) {
          nt = element["n"];
        }
        feedbackModel.id = element['id'];
        feedbackModel.name = element['name'];
        feedbackModel.n = element['n'];
        h[[element['id'], element['name']]] = element['n'];
        if (element['n'] > n[0][0]) {
          n[4] = n[3];
          n[3] = n[2];
          n[2] = n[1];
          n[1] = n[0];
          n[0] = [element['n'], element['id'], element['name'], 1];
        } else if (element['n'] > n[1][0]) {
          n[4] = n[3];
          n[3] = n[2];
          n[2] = n[1];
          n[1] = [element['n'], element['id'], element['name'], 2];
        } else if (element['n'] > n[2][0]) {
          n[4] = n[3];
          n[3] = n[2];
          n[2] = [element['n'], element['id'], element['name'], 3];
        } else if (element['n'] > n[3][0]) {
          n[4] = n[3];
          n[3] = [element['n'], element['id'], element['name'], 4];
        } else if (element['n'] > n[4][0]) {
          n[4] = [element['n'], element['id'], element['name'], 5];
        }
        feedbacks.add(feedbackModel);
        globals.ff.add(feedbackModel);
      });
      List k = List.from(h.values.toList()..sort());
      nm = 0;
      for (var i in k.reversed) {
        nm += 1;
        if (i == nt) {
          if (nm > 5) t = 6;
          n[5] = [nt, globals.id, globals.name, nm];
          break;
        }
      }
      setState(() {});
    }).catchError((error) {
      bError = true;
      sError = "Error: $error";
      print(sError);
      setState(() {});
    });
  }

  @override
  void initState() {
    globals.ff = [];
    chekthems();
    makeList();
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                child: new IconButton(
              icon: new Icon(
                Icons.arrow_back_sharp,
                size: 40.0,
                color: globals.Schemes.elementAt(globals.shem).elementAt(0),
              ),
              onPressed: () {
                Navigator.pop(context, globals.shem);
              },
            )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  globals.la == false ? "Menu" : "Меню",
                  style: TextStyle(
                      fontSize: 40,
                      color:
                          globals.Schemes.elementAt(globals.shem).elementAt(0)),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15, right: 10),
                child: new IconButton(
                  icon: new Icon(
                    CupertinoIcons.settings,
                    size: 40.0,
                    color: globals.Schemes.elementAt(globals.shem).elementAt(0),
                  ),
                  onPressed: () async {
                    var __ = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    setState(() {
                      globals.la = globals.la;
                      makeList();
                    });
                  },
                )),
          ])),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          globals.name != "" && globals.id != 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      globals.ff.length != 0
                          ? Center(
                              child: Text(
                              globals.la == false
                                  ? "Best players"
                                  : "Лучшие игроки",
                              style: TextStyle(
                                  color: globals.Schemes.elementAt(globals.shem)
                                      .elementAt(0),
                                  fontSize: 20),
                            ))
                          : Container(),
                      globals.ff.length != 0
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: DataTable(
                                columnSpacing: 10,
                                columns: <DataColumn>[
                                  DataColumn(
                                    label: Text('№',
                                        style: TextStyle(
                                            color: globals.Schemes.elementAt(
                                                    globals.shem)
                                                .elementAt(0))),
                                    numeric: false,
                                    tooltip: globals.la == false
                                        ? "this is id"
                                        : "это идентификатор пользователя",
                                  ),
                                  DataColumn(
                                    label: Text(
                                        globals.la == false
                                            ? "Nickname"
                                            : "Имя",
                                        style: TextStyle(
                                            color: globals.Schemes.elementAt(
                                                    globals.shem)
                                                .elementAt(0))),
                                    tooltip: globals.la == false
                                        ? "this is name"
                                        : "это имя",
                                    numeric: false,
                                  ),
                                  DataColumn(
                                    label: Text("N",
                                        style: TextStyle(
                                            color: globals.Schemes.elementAt(
                                                    globals.shem)
                                                .elementAt(0))),
                                    tooltip: globals.la == false
                                        ? "this is N"
                                        : "это N",
                                    numeric: true,
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  t,
                                  (int index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(index + 1 != nm
                                          ? Text(
                                              index != 5
                                                  ? '${index + 1}'
                                                  : "${n[index][3]}",
                                              style: index != 0
                                                  ? index != 1
                                                      ? index != 2
                                                          ? TextStyle(
                                                              color: globals.Schemes.elementAt(globals.shem)
                                                                  .elementAt(0),
                                                              fontSize: 20)
                                                          : textStyle3
                                                      : textStyle2
                                                  : textStyle1)
                                          : Text(
                                              index != 5
                                                  ? '${index + 1}'
                                                  : "${n[index][3]}",
                                              style: index != 0
                                                  ? index != 1
                                                      ? index != 2
                                                          ? TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  yc,
                                                              decorationThickness:
                                                                  3,
                                                              color: globals.Schemes.elementAt(globals.shem)
                                                                  .elementAt(0),
                                                              fontSize: 20)
                                                          : TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  yc,
                                                              decorationThickness:
                                                                  dt,
                                                              color: Colors
                                                                  .deepOrangeAccent,
                                                              fontSize: 20)
                                                      : TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor: yc,
                                                          decorationThickness:
                                                              dt,
                                                          color: Colors.grey,
                                                          fontSize: 20)
                                                  : TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: yc,
                                                      decorationThickness: dt,
                                                      color: Colors.yellow,
                                                      fontSize: 20))),
                                      DataCell(index + 1 != nm
                                          ? Text('${n[index][2]}',
                                              style: index != 0
                                                  ? index != 1
                                                      ? index != 2
                                                          ? TextStyle(
                                                              color: globals.Schemes.elementAt(globals.shem)
                                                                  .elementAt(0),
                                                              fontSize: 20)
                                                          : textStyle3
                                                      : textStyle2
                                                  : textStyle1)
                                          : Text('${n[index][2]}',
                                              style: index != 0
                                                  ? index != 1
                                                      ? index != 2
                                                          ? TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  yc,
                                                              decorationThickness:
                                                                  dt,
                                                              color: globals.Schemes
                                                                      .elementAt(
                                                                          globals
                                                                              .shem)
                                                                  .elementAt(0),
                                                              fontSize: 20)
                                                          : TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  yc,
                                                              decorationThickness:
                                                                  dt,
                                                              color: Colors
                                                                  .deepOrangeAccent,
                                                              fontSize: 20)
                                                      : TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor: yc,
                                                          decorationThickness:
                                                              dt,
                                                          color: Colors.grey,
                                                          fontSize: 20)
                                                  : TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: yc,
                                                      decorationThickness: dt,
                                                      color: Colors.yellow,
                                                      fontSize: 20))),
                                      DataCell(index + 1 != nm
                                          ? Text('${num(n[index][0])}',
                                              style: index != 0
                                                  ? index != 1
                                                      ? index != 2
                                                          ? TextStyle(
                                                              color: globals
                                                                          .Schemes
                                                                      .elementAt(
                                                                          globals
                                                                              .shem)
                                                                  .elementAt(0),
                                                            )
                                                          : textStyle3_
                                                      : textStyle2_
                                                  : textStyle1_)
                                          : Text('${num(n[index][0])}',
                                              style: index != 0
                                                  ? index != 1
                                                      ? index != 2
                                                          ? TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  yc,
                                                              decorationThickness:
                                                                  dt,
                                                              color: globals.Schemes.elementAt(
                                                                      globals
                                                                          .shem)
                                                                  .elementAt(0),
                                                              fontSize: 20)
                                                          : TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  yc,
                                                              decorationThickness:
                                                                  dt,
                                                              color: Colors
                                                                  .deepOrangeAccent,
                                                              fontSize: 20)
                                                      : TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor: yc,
                                                          decorationThickness:
                                                              3,
                                                          color: Colors.grey,
                                                          fontSize: 20)
                                                  : TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: yc,
                                                      decorationThickness: dt,
                                                      color: Colors.yellow,
                                                      fontSize: 20))),
                                    ],
                                  ),
                                ),
                              ))
                          : !bError
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color:
                                        globals.Schemes.elementAt(globals.shem)
                                            .elementAt(2),
                                    backgroundColor:
                                        globals.Schemes.elementAt(globals.shem)
                                            .elementAt(0),
                                    strokeWidth: 5,
                                  ),
                                )
                              : Center(
                                  child: Container(
                                      child: Text(
                                    sError.toString() ==
                                            "Error: SocketException: Failed host lookup: 'script.google.com' (OS Error: nodename nor servname provided, or not known, errno = 8)"
                                        ? globals.la == false
                                            ? "No internet connection"
                                            : "Нет интернета"
                                        : "$sError",
                                    style: TextStyle(
                                      color: globals.Schemes.elementAt(
                                              globals.shem)
                                          .elementAt(0),
                                    ),
                                  )),
                                ),
                    ])
              : rError == ""
                  ? globals.nam
                      ? Column(children: [
                          Text(
                            globals.la == false
                                ? "Choose your nickname"
                                : "выбирите свой ник",
                            style: TextStyle(
                                color: globals.Schemes.elementAt(globals.shem)
                                    .elementAt(0),
                                fontSize: 20),
                          ),
                          Center(
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        validator: (String e) {
                                          var ret = "";
                                          if (e.length > 10) {
                                            ret = globals.la == false
                                                ? "the nickname must be less than 10 characters long"
                                                : "ник должно быть короче 10 символов";
                                          }
                                          return ret == "" ? null : ret;
                                        },
                                        style: TextStyle(
                                            color: globals.Schemes.elementAt(
                                                    globals.shem)
                                                .elementAt(0)),
                                        decoration: InputDecoration(
                                          fillColor: globals.Schemes.elementAt(
                                                  globals.shem)
                                              .elementAt(5)
                                              .withOpacity(0.2),
                                          filled: true,
                                          hintText: globals.la == false
                                              ? "name"
                                              : "имя",
                                          hintStyle: TextStyle(
                                              color: globals.Schemes.elementAt(
                                                      globals.shem)
                                                  .elementAt(1)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: globals.Schemes.elementAt(
                                                    globals.shem)
                                                .elementAt(1),
                                          ),
                                        ),
                                        controller: nameContaroller,
                                      )))),
                          Container(
                              child: IconButton(
                                  color: globals.Schemes.elementAt(globals.shem)
                                      .elementAt(0),
                                  iconSize: 50,
                                  icon: Icon(
                                    Icons.arrow_forward_rounded,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        isValidForm = true;
                                      });
                                    } else {
                                      setState(() {
                                        isValidForm = false;
                                      });
                                    }
                                    if (isValidForm) {
                                      if (globals.nam) {
                                        globals.nam = false;
                                        http
                                            .get(Uri.https(
                                                "script.google.com",
                                                "macros/s/AKfycbyLyKp22PVb0M6H6BhnlfBNKOOVxkd_X98P8y0lXIHGdEipm-eCITI4hZAtujKsqJkvLA/exec",
                                                {
                                              "name": nameContaroller.text,
                                              "n": globals.n.toString()
                                            }))
                                            .then((e) {
                                          var h = convert.jsonDecode(e.body);
                                          setState(() {
                                            globals.nam = false;
                                            globals.s
                                                .setString('name', h["name"]);
                                            globals.s.setInt('id', h["id"]);
                                            globals.id = h["id"];
                                            globals.s
                                                .setString('name', h["name"]);
                                            globals.name = h["name"];
                                          });
                                        }).catchError((e) {
                                          globals.nam = true;
                                          print("error: $e");
                                          _showSnackbar(e.toString() ==
                                                  "SocketException: Failed host lookup: 'script.google.com' (OS Error: nodename nor servname provided, or not known, errno = 8)"
                                              ? globals.la == false
                                                  ? "No internet connection"
                                                  : "Нет интернета"
                                              : e.toString());
                                        });
                                      }
                                      globals.s.setString(
                                          "name", nameContaroller.text);
                                      globals.name = nameContaroller.text;
                                    }
                                  }))
                        ])
                      : rError != ''
                          ? Center(
                              child: Container(
                                  child: Text(
                                rError.toString() ==
                                        "Error: SocketException: Failed host lookup: 'script.google.com' (OS Error: nodename nor servname provided, or not known, errno = 8)"
                                    ? globals.la == false
                                        ? "No internet connection"
                                        : "Нет интернета"
                                    : "$rError",
                                style: TextStyle(
                                  color: globals.Schemes.elementAt(globals.shem)
                                      .elementAt(0),
                                ),
                              )),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                backgroundColor:
                                    globals.Schemes.elementAt(globals.shem)
                                        .elementAt(0),
                                strokeWidth: 5,
                              ),
                            )
                  : Center(
                      child: CircularProgressIndicator(
                        backgroundColor: globals.Schemes.elementAt(globals.shem)
                            .elementAt(0),
                        strokeWidth: 5,
                      ),
                    ),
          Column(
            children: [
              Text(
                globals.la == false ? "Themes" : "Темы",
                style: TextStyle(
                    color: globals.Schemes.elementAt(globals.shem).elementAt(0),
                    fontSize: 20),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: themes,
                  ))
            ],
          )
        ],
      ),
      backgroundColor: globals.Schemes.elementAt(globals.shem).elementAt(1),
    );
  }
}
