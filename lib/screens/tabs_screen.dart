import 'package:flutter/material.dart';
import 'package:mealapp/screens/catagories_screen.dart';
import 'package:mealapp/screens/favoraite_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:mealapp/models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List <Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List <Map<String,Object>> _pages ;
  int _selectedpageindex = 0;
  void _selectPage(int value) {
     setState(() {
       _selectedpageindex = value;
     });
  }
  @override
  void initState() {
    _pages =  [
      {
        'page': CatagoriesScreen(),
        'title': 'catagories',
      },
      {
        'page': FavoriateScreen(widget.favoriteMeals),
        'title': 'your favorites',

      }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedpageindex]['title']),),
      body: _pages[_selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedpageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('categories') ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('favorites') ,
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
