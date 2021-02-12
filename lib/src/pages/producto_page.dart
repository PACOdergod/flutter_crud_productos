import 'package:flutter/material.dart';
import 'package:flutter_productos/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(icon: Icon(Icons.image_outlined), onPressed: null),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [_crearNombre(), _crearPrecio(), _crearBoton()],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Precio'),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'solo numeros';
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      color: Colors.amber[900],
      textColor: Colors.white,
      onPressed: _submit,
    );
  }

  void _submit() {
    formKey.currentState.validate();
  }
}
