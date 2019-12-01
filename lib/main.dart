import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String result = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Text("hello"),
            onPressed: () {
              print("BASTIN");
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                .of(context)
                .textTheme
                .display1,
            ),
            RaisedButton(
              child: Text("clear"),
              onPressed: () {
                setState(() {
                  result = "";
                });
              },
            ),
            RaisedButton(
              child: Text("load"),
              onPressed: () async {
                Future<http.Response> future = http.get('https://jsonplaceholder.typicode.com/posts/1');

                http.Response response = await future;
                print(response);
                setState(() {
                  result = response.body;
                });
              },
            ),
            Text("$result"),
            ArtanAzalan(),
            ArtanAzalan(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ArtanAzalan extends StatefulWidget {
  @override
  _ArtanAzalanState createState() => _ArtanAzalanState();
}

class _ArtanAzalanState extends State<ArtanAzalan> {
  int deger = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("-"),
          onPressed: () {
            print("eksi");
            setState(() {
              deger -= 1;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$deger"),
        ),
        RaisedButton(
          child: Text("+"),
          onPressed: () {
            print("artı");
            setState(() {
              deger += 1;
            });
          },
        ),
      ],
    );
  }
}




class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
