// ignore_for_file: file_names

import 'package:flutter/material.dart';
//Widget
import '../Widgets/DrawerWidget.dart';

class FiltterScreen extends StatefulWidget {
  static String routeName = "/filtter-screen";
  Function(Map<String, bool> filtter) toggleFiltter;
  Map<String, bool> filtterData;
  FiltterScreen(
      {@required this.toggleFiltter, @required this.filtterData, Key key})
      : super(key: key);

  @override
  _FiltterScreenState createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  bool _vegan;
  bool _vegetarian;
  bool _lactose;
  bool _gluten;

  @override
  void initState() {
    _vegan = widget.filtterData["vegan"] as bool;
    _vegetarian = widget.filtterData["vegetarian"] as bool;
    _lactose = widget.filtterData["lactose"] as bool;
    _gluten = widget.filtterData["gluten"] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text("Filtter"),
        actions: [
          IconButton(
              onPressed: () {
                final filtter = {
                  "gluten": _gluten,
                  "lactose": _lactose,
                  "vegetarian": _vegetarian,
                  "vegan": _vegan,
                };
                widget.toggleFiltter(filtter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SwitchListTile(
            value: _gluten,
            onChanged: (val) => {
              setState(() {
                _gluten = val;
              })
            },
            title: const Text("Gluten-free"),
            subtitle: const Text("Only include gluten-free meals."),
          ),
          SwitchListTile(
            value: _lactose,
            onChanged: (val) => {
              setState(() {
                _lactose = val;
              })
            },
            title: const Text("Lactose-free"),
            subtitle: const Text("Only include lactose-free meals."),
          ),
          SwitchListTile(
            value: _vegetarian,
            onChanged: (val) => {
              setState(() {
                _vegetarian = val;
              })
            },
            title: const Text("Vegetarian"),
            subtitle: const Text("Only include vegetarian meals."),
          ),
          SwitchListTile(
            value: _vegan,
            onChanged: (val) => {
              setState(() {
                _vegan = val;
              })
            },
            title: const Text("Vegan"),
            subtitle: const Text("Only include vegan meals."),
          ),
        ],
      ),
    );
  }
}
