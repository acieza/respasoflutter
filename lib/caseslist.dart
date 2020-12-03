import 'package:flutter/material.dart';
import 'package:repasoflutter/models/cases.dart';

class CasesList extends StatelessWidget {
  const CasesList({Key key, this.cases}) : super(key: key);

  final List<Cases> cases;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cases == null ? 0 : cases.length,
      itemBuilder: (BuildContext contex, int index) {
        return Card(
            child: ListTile(
          leading: Icon(Icons.person),
          title: Text(cases[index].name),
          subtitle: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: cases[index].age.toDouble() / 100,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
              backgroundColor: Colors.grey.withOpacity(0.3),
            ),
          ),
        ));
      },
    );
  }
}
