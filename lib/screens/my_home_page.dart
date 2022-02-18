import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isGreaterThan5 = false;
  String _conditionalTitle = "";

  final _myText = const Text("Counter is greater than 5");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _conditionalTitle = widget.title;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      _conditionalTitle = "Count : " + _counter.toString();

      if (_counter > 5) {
        _isGreaterThan5 = true;
      }
    });
  }

  Widget _conditionalDisplay() {
    return (_counter > 0) ? const Text("Button has been clicked") : Container();
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.title),
          (_isGreaterThan5) ? _myText : Container(),
          _conditionalDisplay(),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_conditionalTitle),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
