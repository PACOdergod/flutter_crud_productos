import 'package:flutter/material.dart';
// import 'package:flutter_productos/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit_sharp),
          onPressed: () => Navigator.pushNamed(context, 'producto')),
    );
  }
}
