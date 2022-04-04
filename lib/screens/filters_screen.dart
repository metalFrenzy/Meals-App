import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gultenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _gultenFree = widget.currentFilters['gulten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters!'),
        actions: [
          IconButton(
            onPressed: () {
              widget.saveFilters(
                {
                  'gulten': _gultenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan
                },
              );
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Meals Selection !',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _gultenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _gultenFree = newValue;
                    });
                  },
                  title: Text(
                    "Gluten-free",
                  ),
                  subtitle: Text('Select only gluten-free meals.'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  title: Text(
                    "Vegetarian",
                  ),
                  subtitle: Text('Select only vegetarian meals.'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  title: Text(
                    "Vegan",
                  ),
                  subtitle: Text('Select only vegan meals.'),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  title: Text(
                    "Lactose-free",
                  ),
                  subtitle: Text('Select only lactose-free meals.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
