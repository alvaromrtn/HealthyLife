import 'package:flutter/material.dart';

class Comida extends StatefulWidget {
  @override
  _MyComidaPage createState() => _MyComidaPage();
}

class _MyComidaPage extends State<Comida> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("DESAYUNO"),
          SmoothAnimationWidget(),
          Text("ALMUERZO"),
          SmoothAnimationWidget(),
          Text("COMIDA"),
          SmoothAnimationWidget(),
          Text("MERIENDA"),
          SmoothAnimationWidget(),
          Text("CENA"),
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
            title: Text("Plato"),
            subtitle: Text("Detalles"),
          ),
        );
      }
    }