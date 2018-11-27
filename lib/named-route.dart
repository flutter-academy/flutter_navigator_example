import 'dart:math';

import 'package:flutter/material.dart';

class NamedRouteWidget extends StatelessWidget {
  final int routeNumber;
  final int numberOfRoutes;
  final Random random = Random();

  NamedRouteWidget(this.routeNumber, this.numberOfRoutes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random route $routeNumber'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go to a random route'),
            onPressed: () => Navigator.of(context)
                .pushNamed('/random/${random.nextInt(numberOfRoutes)}')),
      ),
    );
  }
}
