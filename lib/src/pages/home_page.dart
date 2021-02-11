import 'package:flutter/material.dart';
import 'package:flutter_productos/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: Column(
          children: [Text('${bloc.lastEmail}'),Text('${bloc.lastPass}')],
        ),
      ),
    );
  }
}
