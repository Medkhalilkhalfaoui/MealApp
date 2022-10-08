import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(IconData icon, String txt, Function x) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        txt,
        style: TextStyle(
          fontSize: 24,
          fontFamily: "Raleway",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: x,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'cooking up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListtile(Icons.restaurant, 'Meal',(){Navigator.of(context).pushReplacementNamed('/') ;}),
          buildListtile(Icons.settings, 'Filters',(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName );}),
        ],
      ),
    );
  }
}
