import 'package:flutter/material.dart';

class ColorSelectorPage extends StatefulWidget {
  @override
  _ColorSelectState createState() {
    return _ColorSelectState();
  }
}

class _ColorSelectState extends State<ColorSelectorPage> {
  Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color selector example'),
      ),
      body: Container(
          color: color,
          child: Center(
            child: RaisedButton(
              child: Text('Select background color'),
              onPressed: _showColorSelector,
            ),
          )),
    );
  }

  _showColorSelector() async {
    color = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ColorSelector(color)));
  }
}

class ColorSelector extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];

  final Color selectedColor;

  ColorSelector(this.selectedColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Selected color: $selectedColor'),
                Column(
                  children: colors
                      .map<Widget>((color) => RaisedButton(
                            child: Text(color.toString()),
                            textColor: color,
                            onPressed: () => Navigator.of(context).pop(color),
                          ))
                      .toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
