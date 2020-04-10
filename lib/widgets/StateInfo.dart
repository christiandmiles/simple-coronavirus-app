import 'package:coronavirus_app/converters/state-cases.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StateInfo extends StatefulWidget {
  const StateInfo({Key key, this.stateInfo}) : super(key: key);

  final StateCases stateInfo;

  @override
  StateInfoState createState() => StateInfoState();
}

class StateInfoState extends State<StateInfo> {
  @override
  Widget build(BuildContext context) {
    final stateInfo = widget.stateInfo;
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: 22.5,
              ),
              title: Text(
                'Total Cases - ${stateInfo.cases}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.skullCrossbones,
                color: Colors.black,
                size: 22.5,
              ),
              title: Text(
                'Total Deaths - ${stateInfo.deaths}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.chartLine,
                color: Colors.blue,
                size: 22.5,
              ),
              title: Text(
                'Cases Today - ${stateInfo.todayCases}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.check,
                color: Colors.green,
                size: 22.5,
              ),
              title: Text(
                'Total Recovered - ${stateInfo.cases - stateInfo.active} ',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
    );
  }
}
