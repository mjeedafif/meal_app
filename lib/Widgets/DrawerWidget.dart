// ignore_for_file: file_names

import 'package:flutter/material.dart';
//Screen
import '../Screens/Tab_screen.dart';
import '../Screens/Filter_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  Widget _listTileBuilder(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        if (title == "Categories") {
          Navigator.of(context).pushReplacementNamed('/');
        } else {
          Navigator.of(context).pushReplacementNamed(FiltterScreen.routeName);
        }
      },
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2
              .merge(const TextStyle(color: Colors.black)),
        ),
        trailing: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                "Your meals app",
                style: Theme.of(context).textTheme.headline1.merge(
                      const TextStyle(color: Colors.red, fontSize: 28),
                    ),
              ),
            ),
          ),
          _listTileBuilder(context, "Categories", Icons.category),
          _listTileBuilder(context, "Setting", Icons.settings),
        ],
      ),
    );
  }
}
