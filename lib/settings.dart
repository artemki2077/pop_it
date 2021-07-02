import 'package:flutter/material.dart';
import 'global.dart' as globals;

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  globals.la == false ? "Settings" : "Настройки",
                  style: TextStyle(
                      fontSize: 40,
                      color:
                          globals.Schemes.elementAt(globals.shem).elementAt(0)),
                ),
              ),
            ),
            Container(
                child: new IconButton(
              icon: new Icon(
                Icons.settings,
                size: 40.0,
                color: globals.Schemes.elementAt(globals.shem).elementAt(1),
              ),
              onPressed: null,
            )),
          ]),
        ),
        backgroundColor: globals.Schemes.elementAt(globals.shem).elementAt(1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 10,),
            Center(child: FlatButton(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(globals.la == false ? "Language: " : "Язык: ", style: TextStyle(
                    fontSize: 30,
                    color: globals.Schemes.elementAt(globals.shem).elementAt(0)
                  ),),
                  Container(width: 10,),
                  Image.asset("/Users/kiselevartem/AndroidStudioProjects/app/assets/${globals.la == false ? "en" : "ru"}.png", width: 50,)
                ]), onPressed: (){
              setState(() {
                globals.la = !globals.la;
                globals.s.setBool("la", globals.la);
              });
            },)),
            Container(height: 10,),
          ],
        ));
  }
}
