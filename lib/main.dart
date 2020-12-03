import 'package:flutter/material.dart';
import 'package:repasoflutter/caseslist.dart';
import 'package:repasoflutter/models/cases.dart';
import 'package:repasoflutter/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  final Apiservice api = Apiservice();
  List<Cases> casesList;

  @override
  Widget build(BuildContext context) {
    if (casesList == null) {
      casesList = List<Cases>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return casesList.length > 0
                  ? CasesList(cases: casesList)
                  : Center(
                      child: Text(' No hay registros'),
                    );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    Future<List<Cases>> futureCases = api.getCases();
    futureCases.then((casesList) {
      setState(() {
        this.casesList = casesList;
      });
    });
    return futureCases;
  }
}
