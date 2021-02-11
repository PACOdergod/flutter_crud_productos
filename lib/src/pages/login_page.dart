import 'package:flutter/material.dart';
import 'package:flutter_productos/src/bloc/provider.dart';

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
    final bloc = Provider.of(context);

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
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black, width: 4)),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(height: 10.0),
                  _crearEmail(bloc),
                  SizedBox(height: 10.0),
                  _crearPassword(bloc),
                  SizedBox(height: 30.0),
                  _crearBoton(bloc),
                ],
              )),
          Text('¿Olvidaste tu contraseña'),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electronico',
                errorText: snapshot.error,
                icon: Icon(Icons.alternate_email, color: Colors.red),
              ),
              onChanged: (value) => bloc.changeEmail(value),
            ),
          );
        });
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'ejemplo@correo.com',
                labelText: 'Contraseña',
                errorText: snapshot.error,
                icon: Icon(Icons.lock_outline, color: Colors.red),
              ),
              onChanged: (value) => bloc.changePassword(value),
            ),
          );
        });
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidateStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 0,
            color: Colors.amber,
            child: Container(
              child: Text('Ingresar'),
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
            ),
            onPressed: snapshot.hasData 
                        ? ()=>Navigator.pushReplacementNamed(context, 'home') 
                        : null,
          );
        });
  }

}
