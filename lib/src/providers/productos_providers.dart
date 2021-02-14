import 'package:http/http.dart' as http;

import 'package:flutter_productos/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://crud-demo-c793a-default-rtdb.firebaseio.com';

  Future<bool> enviarProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';

    await http.post(url, body: productoModelToJson(producto));

    return true;
  }
}
