import 'package:flutter/material.dart';
import 'package:flutter_productos/src/models/producto_model.dart';
import 'package:flutter_productos/src/providers/productos_providers.dart';
// import 'package:flutter_productos/src/bloc/provider.dart';

//TODO: se debe actualizar la pagina automaticamente

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
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductoModel>> snapshot) {
          if (snapshot.hasData) {
            final productos = snapshot.data;
            return ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, i) =>
                    _crearProducto(context, productos[i]));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearProducto(BuildContext context, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: (direction) {
        productosProvider.borrarProducto(producto.id);
      },
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        onTap: () {
          Navigator.pushNamed(context, 'producto', arguments: producto);

        },
      ),
    );
  }

  Widget _botonProductos(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.ac_unit_sharp),
        onPressed: () => Navigator.pushNamed(context, 'producto'));
  }
}
