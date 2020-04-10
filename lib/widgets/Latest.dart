import 'package:coronavirus_app/converters/state-cases.dart';
import 'package:flutter/material.dart';

import 'NavDrawer.dart';
import '../services/novel-covid.dart';
import 'StateInfoPage.dart';

class Latest extends StatefulWidget {
  @override
  LatestState createState() => LatestState();
}

class LatestState extends State<Latest> {
  final _states = NovelCovid().getStates();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Latest State Info'),
        ),
        body: FutureBuilder<List<StateCases>>(
            future: _states,
            builder: (BuildContext context,
                AsyncSnapshot<List<StateCases>> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else {
                var tiles = <ListTile>[];
                snapshot.data.sort((a, b) => a.state.compareTo(b.state));
                for (final item in snapshot.data) {
                  tiles.add(ListTile(
                      title: Text(item.state),
                      onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      StateInfoPage(stateInfo: item)),
                            )
                          }));
                }
                return ListView(children: tiles);
              }
            }));
  }
}
