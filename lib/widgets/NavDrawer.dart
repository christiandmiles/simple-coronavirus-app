import 'package:coronavirus_app/widgets/Latest.dart';
import 'package:flutter/material.dart';

import 'CDCAdvice.dart';
import 'Map.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Latest Information'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => Latest()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('USA Cases Map'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => Map()),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('CDC Advice'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => CDCAdvice()),
              )
            },
          ),
        ],
      ),
    );
  }
}
