import 'package:flutter/material.dart';
import 'package:flutter_productos/src/models/producto_model.dart';
import 'package:flutter_productos/src/providers/productos_providers.dart';
import 'package:flutter_productos/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final productoProvider = new ProductosProvider();
  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    print(producto.disponible);
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
                children: [
                  _crearNombre(),
                  _crearPrecio(),
                  _crearDisponible(),
                  _crearBoton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre';
        } else {
          return null;
        }
      },
      onSaved: (value) => producto.titulo = value,
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
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
      onSaved: (value) => producto.valor = double.parse(value),
    );
  }

  Widget _crearDisponible() {
    return SwitchListTile(
        value: producto.disponible,
        title: Text('Disponible?'),
        onChanged: (value) => setState(() => producto.disponible = value));
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      color: Colors.amber[700],
      textColor: Colors.white,
      onPressed: _submit,
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    // Con este metodo se manda a llamar el metodo onSave
    // de TextFormField
    formKey.currentState.save();

    productoProvider.enviarProducto(producto);
  }
}
