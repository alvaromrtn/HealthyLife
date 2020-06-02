import 'package:flutter/material.dart';
import 'dart:async';
import 'info.dart';
 
class Perfil extends StatefulWidget {
    @override
    _MyPerfilPage createState() => new _MyPerfilPage();
}

class _MyPerfilPage extends State<Perfil> {
    var finaldate;

    void callDatePicker() async {
      var order = await getDate();
      setState(() {
        finaldate = order;
      });
    }

    Future<DateTime> getDate() {
      return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("USUARIO"),

              SmoothAnimationWidget(),
              
              Container(
                child: new RaisedButton(
                  child: const Text('MODIFICAR DATOS', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Info()),
                    );
                  },
                  color: Colors.green
                )
              ),

              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: finaldate == null
                    ? Text(
                        "FECHA",
                      )
                    : Text(
                        "$finaldate",
                        textScaleFactor: 2.0,
                      ),
              ),
              new RaisedButton(
                onPressed: callDatePicker,
                color: Colors.green,
                child:
                    new Text('SELECCIONAR DIA', style: TextStyle(color: Colors.white)),
              ),

            ],
          ),
        ),
      );
    }
  }
  
class SmoothAnimationWidget extends StatefulWidget {
  @override
  SmoothAnimationWidgetState createState() => SmoothAnimationWidgetState();
}

class SmoothAnimationWidgetState extends State<SmoothAnimationWidget>
    with TickerProviderStateMixin {
      @override
      Widget build(BuildContext context) {
        return new Card(
          child: CircleAvatar(child: new Icon(Icons.person,size: 200.0, color: Colors.black),
            backgroundColor: Colors.green, radius: 100.0,
          ),
        );
      }
    }