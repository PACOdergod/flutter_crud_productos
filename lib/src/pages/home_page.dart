import 'package:flutter/material.dart';
import 'package:flutter_productos/src/models/producto_model.dart';
import 'package:flutter_productos/src/providers/productos_providers.dart';
// import 'package:flutter_productos/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: _crearListado(),
      floatingActionButton: _botonProductos(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
        future: productosProvider.obtenerProductos(),
        builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
          if (snapshot.hasData) {
            return Container();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _botonProductos(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.ac_unit_sharp),
        onPressed: () => Navigator.pushNamed(context, 'producto'));
  }
}
