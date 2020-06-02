import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu.dart';

class Info extends StatefulWidget {
    @override
    _MyInfoPage createState() => new _MyInfoPage();
}

class _MyInfoPage extends State<Info> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _sexos = <String>['', 'Hombre', 'Mujer'];
  String _sexo = '';
  List<String> _niveles = <String>['', 'Nada', 'Poco', 'Medio', 'Bastante', 'Mucho'];
  String _nivel = '';
  List<String> _dias = <String>['', '0', '1', '2', '3', '4', '5', '6', '7'];
  String _dia = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: new AppBar(
       title: Text('INFO',style: TextStyle(color: Colors.white)),
            centerTitle: true,
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Introduzca un nombre de usuario',
                      labelText: 'Nombre',
                    ),
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Introduzca su edad',
                      labelText: 'Edad',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),

                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.people),
                          labelText: 'Sexo',
                        ),
                        isEmpty: _sexo == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _sexo,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _sexo = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _sexos.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.import_export),
                      hintText: 'cm',
                      labelText: 'Estatura',
                    ),
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.accessibility),
                      hintText: 'kg',
                      labelText: 'Peso actual',
                    ),
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.accessibility_new),
                      hintText: 'kg',
                      labelText: 'Peso deseado',
                    ),
                  ),
                  
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.pool),
                          labelText: 'Nivel de actividad',
                        ),
                        isEmpty: _nivel == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _nivel,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _nivel = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _niveles.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),

                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.access_time),
                          labelText: 'Entreno semanal',
                        ),
                        isEmpty: _dia == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: _dia,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _dia = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _dias.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),

                  new Container(
                    child: new RaisedButton(
                      child: const Text('Enviar', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => menu()),
                        );
                      },
                      color: Colors.green
                    )
                  ),

            ],
          )
        )
      ),
    );
  }
}