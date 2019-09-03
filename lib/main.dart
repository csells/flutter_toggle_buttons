import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final title = 'Flutter ToggleButtons Demo';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: title),
      );
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            children: [
              // multi-select
              SizedBox(height: 20),
              Text('multi-select', textScaleFactor: 2),
              ToggleButtons(
                children: [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
                onPressed: (int index) {
                  setState(() {
                    isSelected1[index] = !isSelected1[index];
                  });
                },
                isSelected: isSelected1,
              ),
              // single select
              SizedBox(height: 20),
              Text('single select', textScaleFactor: 2),
              ToggleButtons(
                children: [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelected2.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected2[buttonIndex] = true;
                      } else {
                        isSelected2[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected2,
              ),
              // fancy
              SizedBox(height: 20),
              Text('fancy', textScaleFactor: 2),
              ToggleButtons(
                borderColor: Colors.blueGrey,
                borderWidth: 10,
                selectedBorderColor: Colors.blue,
                splashColor: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
                children: [
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Text('cake'),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < isSelected3.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected3[buttonIndex] = true;
                      } else {
                        isSelected3[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected3,
              ),
            ],
          ),
        ),
      );
}
