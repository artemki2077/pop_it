import 'package:app/Menu.dart';
import 'package:flutter/material.dart';
import 'global.dart' as glob;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

var url =
    "AKfycbykyjMJZL1QRkRdonNNopw4idVK3YTDkmaISNGlje-nCQrBlpddbh5U7nJy6iJiQ_4rSw";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int n = 0;

  Size screenSize() {
    return MediaQuery.of(context).size;
  }

  kk() async {
    final prefs = await SharedPreferences.getInstance();
    glob.s = prefs;
    // prefs.remove("id");
    // prefs.remove("name");
    prefs.remove("q");
    glob.q = prefs.getStringList("q") ?? [];
    glob.n = prefs.getInt('n') ?? 0;
    glob.id = prefs.getInt('id') ?? 0;
    glob.la = prefs.getBool('la') ?? glob.la;
    glob.shem = prefs.getInt('shem') ?? glob.shem;
    glob.name = prefs.getString("name") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    setState(() {});
    kk();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: glob.n != 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            child: new IconButton(
                          padding: new EdgeInsets.all(0.0),
                          icon: new Icon(
                            Icons.menu_outlined,
                            size: 40.0,
                            color:
                                glob.Schemes.elementAt(glob.shem).elementAt(1),
                          ),
                        )),
                        Center(
                          child: Container(
                            child: Text(
                              "${glob.n}",
                              style: TextStyle(
                                  fontSize: glob.n < 1000000
                                      ? glob.n < 100
                                          ? 120
                                          : 100
                                      : 80,
                                  color: glob.Schemes.elementAt(glob.shem)
                                      .elementAt(0)),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 100),
                          child: IconButton(
                            padding: new EdgeInsets.all(0.0),
                            icon: new Icon(
                              Icons.menu_outlined,
                              size: 40.0,
                              color: glob.Schemes.elementAt(glob.shem)
                                  .elementAt(0),
                            ),
                            onPressed: () async {
                              if (glob.id != 0 && glob.name != "") {
                                http.get(Uri.https(
                                    "script.google.com", "macros/s/$url/exec", {
                                  "id": glob.id.toString(),
                                  "n": glob.n.toString()
                                }));
                              }
                              final _ = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Menu()),
                              );
                              setState(() {});
                            },
                          ),
                        )
                      ])
                : Container()),
        backgroundColor: glob.Schemes.elementAt(glob.shem).elementAt(1),
        body: glob.n != 0
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // ---------------------------------------------------------------------
                Container(
                  margin: EdgeInsets.only(
                    top:
            Random()
                       .nextInt(
                            MediaQuery.of(context).size.height.toInt() - 480
                    ).toDouble(),
                    left: Random()
                        .nextInt(
                            MediaQuery.of(context).size.width.toInt() - 200)
                        .toDouble(),
                  ),
                  child: !glob.Schemes.elementAt(glob.shem).elementAt(7)
                      ? Container(
                          width: 75,
                          height: 75,
                          child: FloatingActionButton(
                            onPressed: () {
                              if (glob.id != 0 && glob.name != "") {
                                http.get(Uri.https("script.google.com",
                                    "macros/s/${url}/exec", {
                                  "id": glob.id.toString(),
                                  "n": glob.n.toString()
                                }));
                              }
                              setState(() {
                                glob.n++;
                                glob.s.setInt('n', glob.n);
                              });
                            },
                            backgroundColor:
                                glob.Schemes.elementAt(glob.shem).elementAt(2),
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: glob.Schemes.elementAt(glob.shem)
                                        .elementAt(3)
                                        .withOpacity(0.3),
                                    spreadRadius: 7,
                                    blurRadius: 7,
                                    offset: Offset(3, 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          child: FlatButton(
                              color: glob.Schemes.elementAt(glob.shem)
                                  .elementAt(1),
                              onPressed: () {
                                if (glob.id != 0 && glob.name != "") {
                                  http.get(Uri.https("script.google.com",
                                      "macros/s/$url/exec", {
                                    "id": glob.id.toString(),
                                    "n": glob.n.toString()
                                  }));
                                }
                                setState(() {
                                  glob.n++;
                                  glob.s.setInt('n', glob.n);
                                });
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: glob.Schemes.elementAt(glob.shem)
                                          .elementAt(3)
                                          .withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(2, 3),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                    "assets/images/${glob.Schemes.elementAt(glob.shem).elementAt(8)}"),
                              )),
                        ),
                )
              ])
            : Center(
                child: Container(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          kk();
                          glob.n++;
                          glob.s.setInt('n', glob.n);
                          setState(() {});
                        },
                        child: Container(
                          child: Text(
                            "Don't touch",
                            style: TextStyle(
                              fontSize: 22,
                              color: glob.Schemes.elementAt(glob.shem)
                                  .elementAt(1),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(125),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                glob.Schemes.elementAt(glob.shem).elementAt(2)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: glob.Schemes.elementAt(glob.shem)
                                            .elementAt(2))))))),
              ));
  }
}
