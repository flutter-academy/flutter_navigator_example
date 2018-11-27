import 'package:flutter/material.dart';
import 'package:flutter_navigator_example/color-selector.dart';
import 'package:flutter_navigator_example/named-route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> staticRoutes = {
    '/': (context) => MyHomePage(title: 'Flutter Navigator Example'),
  };

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = Map();
    routes.addAll(staticRoutes);
    routes.addAll(_generateRoutes());
    return MaterialApp(
      title: 'Flutter Navigator Example',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }

  Map<String, WidgetBuilder> _generateRoutes() {
    int total = 50;
    return Map.fromIterable(
        List.generate(total, (value) => [value, _generateRoute(value, total)]),
        key: (pair) => '/random/${pair[0]}',
        value: (pair) => pair[1]);
  }

  WidgetBuilder _generateRoute(int number, int total) {
    return (context) => NamedRouteWidget(number, total);
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Show simple route'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('Simple route'),
                        ),
                        body: Center(
                          child: RaisedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Return to main screen'),
                          ),
                        ),
                      ))),
            ),
            RaisedButton(
              child: Text('Color selector example'),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ColorSelectorPage())),
            ),
            RaisedButton(
              child: Text('Random route'),
              onPressed: () => Navigator.of(context).pushNamed('/random/0'),
            )
          ],
        ),
      ),
    );
  }
}
