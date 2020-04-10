import 'package:coronavirus_app/converters/state-cases.dart';
import 'package:coronavirus_app/widgets/StateNews.dart';
import 'package:flutter/material.dart';

import 'NavDrawer.dart';
import 'StateInfo.dart';

class StateInfoPage extends StatefulWidget {
  const StateInfoPage({Key key, this.stateInfo}) : super(key: key);

  final StateCases stateInfo;

  @override
  StateInfoPageState createState() => StateInfoPageState();
}

class StateInfoPageState extends State<StateInfoPage> {
  @override
  Widget build(BuildContext context) {
    final stateInfo = widget.stateInfo;
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text(stateInfo.state),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          StateInfo(stateInfo: stateInfo),
          StateNews(name: stateInfo.state)
        ])));
  }
}
