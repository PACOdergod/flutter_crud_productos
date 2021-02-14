import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_productos/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://crud-demo-c793a-default-rtdb.firebaseio.com';

  Future<bool> enviarProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';

    await http.post(url, body: productoModelToJson(producto));

    return true;
  }

  Future<List<ProductoModel>> obtenerProductos() async {
    final url = '$_url/productos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null) return [];

    final productos = List<ProductoModel>();

    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });
    // print(productos[0].id);

    return productos;
  }
}
