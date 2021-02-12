import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
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
      body: SingleChildScrollView(),
    );
  }
}
