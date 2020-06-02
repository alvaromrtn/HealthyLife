import 'package:flutter/material.dart';

import 'comida.dart';
import 'ejercicio.dart';

import 'usuario.dart';

class menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: const Color(0x239239239),
      ),
      
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.local_dining),
                  text: 'Comida',
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: 'Ejercicio',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Usuario',
                ),
              ],
            ),
            title: Text('HEALTHY LIFE',style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),

          body: TabBarView(
            children: [

              Comida(),

              Ejercicio(),

              Perfil(),
              
            ],
          ),
        ),
      ),
    );
  }
}