import 'package:flutter/material.dart';

import 'info.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //Nombre de la aplicacion:
      title: 'HealthyLife',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: const Color(0x239239239),
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

//Para controlar si el usuario esta iniciando sesión o registrando:
enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  //Configuración predeterminada: Iniciar sesión
  //Se cambia cuando pulsamos a registrarnos.
  FormType _form = FormType.login; 
  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  //Función para cambiar entre el formulario de iniciar sesión y el formulario de registro:
  void _formChange () async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  //Barra superior:
  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("LOGIN"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[

          //Correo:
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(
                labelText: 'Correo'
              ),
            ),
          ),

          //Contraseña:
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(
                labelText: 'Contraseña'
              ),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[

            //Conectarse:
            new RaisedButton(
              child: new Text('Conectarse', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Info()),
                );
              },
              color: Colors.green
            ),

            //Cambiar a modo registro:
            new FlatButton(
              child: new Text('¿No tienes una cuenta?'),
              onPressed: _formChange,
            ),

	    //Contraseña olvidada:
            new FlatButton(
              child: new Text('¿Has olvidado la contraseña?'),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Registrarse', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Info()),
                );
              },
              color: Colors.green
            ),
            new FlatButton(
              child: new Text('¿Ya tienes una cuenta?'),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  //Funciones para controlar la lógica de la aplicación:
  void _passwordReset () {
    print("El usuario desea que se envíe una solicitud de restablecimiento de contraseña a $_email");
  }

  void _login () {
    print("El usuario desea iniciar sesión con $_email y $_password");
  }

  void _register () {
    print("El usuario desea registrarse con $_email y $_password");
  }
}