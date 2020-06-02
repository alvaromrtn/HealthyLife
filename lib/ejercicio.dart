import 'package:flutter/material.dart';

class Ejercicio extends StatefulWidget {
  @override
  _MyEjercicioPage createState() => _MyEjercicioPage();
}

class _MyEjercicioPage extends State<Ejercicio> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("EJERCICIO 1"),
          SmoothAnimationWidget(),
          Text("EJERCICIO 2"),
          SmoothAnimationWidget(),
          Text("EJERCICIO 3"),
          SmoothAnimationWidget(),
          Text("EJERCICIO 4"),
          SmoothAnimationWidget(),
          Text("EJERCICIO 5"),
          SmoothAnimationWidget(),
        ],
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
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 40.0,
            ),
            title: Text("Nombre"),
            subtitle: Text("Conjuntos y Repeticiones"),
          ),
        );
      }
    }