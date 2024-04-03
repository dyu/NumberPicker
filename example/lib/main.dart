import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(new ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NumberPicker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Integer'),
              Tab(text: 'Decimal'),
            ],
          ),
          title: Text('Numberpicker example'),
        ),
        body: TabBarView(
          children: [
            _IntegerExample(),
            _DecimalExample(),
          ],
        ),
      ),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

const items = <String>[
  "Parent",
  "Educator",
  "Student",
  "Athlete",
  "Coach",
  "Trainer",
  "Health Professional",
  "Other",
];

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentSelectedIdx = 0;
  int _currentIntValue = 10;
  int _currentHorizontalIntValue = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text('Text', style: TextStyle(color: Colors.lightBlue, fontSize: 32)),
        Container(
          width: 300,
          height: 4,
          color: Colors.lightBlue,
        ),
        NumberPicker(
          value: _currentSelectedIdx,
          minValue: 0,
          maxValue: items.length - 1,
          step: 1,
          haptics: true,
          onChanged: (idx) => setState(() => _currentSelectedIdx = idx),
          mapper: (idx) => items[idx],
          itemWidth: 300,
          textStyle: TextStyle(fontSize: 16),
          selectedTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
          //selectedBgColor: Colors.grey.withOpacity(0.9),
        ),
        Container(
          width: 300,
          height: 4,
          color: Colors.lightBlue,
        ),
        SizedBox(height: 32),
        Text('Default', style: Theme.of(context).textTheme.headline6),
        NumberPicker(
          value: _currentIntValue,
          minValue: 0,
          maxValue: 100,
          step: 10,
          haptics: true,
          onChanged: (value) => setState(() => _currentIntValue = value),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                final newValue = _currentIntValue - 10;
                _currentIntValue = newValue.clamp(0, 100);
              }),
            ),
            Text('Current int value: $_currentIntValue'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = _currentIntValue + 20;
                _currentIntValue = newValue.clamp(0, 100);
              }),
            ),
          ],
        ),
        Divider(color: Colors.grey, height: 32),
        SizedBox(height: 16),
        Text('Horizontal', style: Theme.of(context).textTheme.headline6),
        NumberPicker(
          value: _currentHorizontalIntValue,
          minValue: 0,
          maxValue: 100,
          step: 10,
          itemHeight: 100,
          axis: Axis.horizontal,
          onChanged: (value) =>
              setState(() => _currentHorizontalIntValue = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                final newValue = _currentHorizontalIntValue - 10;
                _currentHorizontalIntValue = newValue.clamp(0, 100);
              }),
            ),
            Text('Current horizontal int value: $_currentHorizontalIntValue'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = _currentHorizontalIntValue + 20;
                _currentHorizontalIntValue = newValue.clamp(0, 100);
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class _DecimalExample extends StatefulWidget {
  @override
  __DecimalExampleState createState() => __DecimalExampleState();
}

class __DecimalExampleState extends State<_DecimalExample> {
  double _currentDoubleValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text('Decimal', style: Theme.of(context).textTheme.headline6),
        DecimalNumberPicker(
          value: _currentDoubleValue,
          minValue: 0,
          maxValue: 10,
          decimalPlaces: 2,
          onChanged: (value) => setState(() => _currentDoubleValue = value),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
