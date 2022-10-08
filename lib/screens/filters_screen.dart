import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function savefilter;
  final Map<String,bool> currentfiltres ;

  FiltersScreen(this.currentfiltres,this.savefilter);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;


  @override
  initState(){
    _GlutenFree = widget.currentfiltres['gulten'];
    _LactoseFree = widget.currentfiltres['lactose'] ;
    _Vegan = widget.currentfiltres['vegan'];
    _Vegetarian = widget.currentfiltres['vegetarian'];
    super.initState();
  }


  Widget buildListTile(
      String title, String subtitle, bool currentvalue, Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue ,
      subtitle: Text(subtitle),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your filtres'),
        actions: [
          IconButton(
              onPressed:(){
                final  Map<String,bool> selectedfilter = {

                  'gulten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,

                };
                widget.savefilter(selectedfilter);
              } ,
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection ',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildListTile(
                'Gluten-free',
                "Only include gulten-free meals",
                _GlutenFree,
                (newValue) {
                  setState(() {
                    _GlutenFree = newValue;
                  });
                },
              ),
              buildListTile(
                'Lactose-free',
                "Only include lactose-free meals",
                _LactoseFree,
                (newValue) {
                  setState(() {
                    _LactoseFree = newValue;
                  });
                },
              ),
              buildListTile(
                'vegetarain',
                "Only include vegetarian meals",
                _Vegetarian,
                    (newValue) {
                  setState(() {
                    _Vegetarian = newValue;
                  });
                },
              ),
              buildListTile(
                'vegan',
                "Only include vegan meals",
                _Vegan,
                    (newValue) {
                  setState(() {
                    _Vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
