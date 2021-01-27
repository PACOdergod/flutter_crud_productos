import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _crearFondo(context),
        _crearEncabezado(),
        _crearLogin(context)
      ],
    ));
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _fondo = Container(
      height: size.height * .45,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.amber[800]),
    );

    final _circulo = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.amberAccent,
      ),
    );

    return Stack(
      children: [
        _fondo,
        Positioned(
          child: _circulo,
          top: 90.0,
          left: 30.0,
        ),
        Positioned(
          child: _circulo,
          top: -20.0,
          right: 40.0,
        ),
        Positioned(
          child: _circulo,
          bottom: 20.0,
          right: -10.0,
        ),
      ],
    );
  }

  Widget _crearEncabezado() {
    return SafeArea(
      child: Container(
        child: Column(children: [
          Icon(
            Icons.person_pin,
            color: Colors.black,
            size: 100.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 10.0,
          ),
          Text(
            'Bienvenido',
            style: TextStyle(color: Colors.black, fontSize: 50.0),
          )
        ]),
      ),
    );
  }

  Widget _crearLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 200,
          )),
          Container(
            width: size.width * .90,
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 4)),
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
