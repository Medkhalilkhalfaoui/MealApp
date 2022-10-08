import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/catagories_screen.dart';
import 'package:mealapp/screens/catagories_meal_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filtres ={

    'gulten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,

};
   List <Meal> _availableMeals = DUMMY_MEALS;
  List <Meal> _favoriteMeals = [];

 void _setfilters(Map<String,bool> _filterdata){
   setState(() {
     _filtres= _filterdata;
     _availableMeals = DUMMY_MEALS.where((meal) {
       if(_filtres['gulten']&& !meal.isGlutenFree){
         return false ;
       }
       if(_filtres['lactose']&& !meal.isLactoseFree){
         return false ;
       }
       if(_filtres['vegan']&& !meal.isVegan){
         return false ;
       }
       if(_filtres['vegetarian']&& !meal.isVegetarian){
         return false ;
       }
       return true ;
     }).toList();
   });
 }

 void _toggleFavorite (String mealId){
   final existingindex = _favoriteMeals.indexWhere((meal) => meal.id== mealId);
   if(existingindex>= 0){
     setState(() {
       _favoriteMeals.removeAt(existingindex);
     });
   }else{
     setState(() {
       _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id== mealId));
     });
   }
 }

 bool _isMealFavorite (String id){
   return _favoriteMeals.any((meal) => meal.id== id);
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        )
      ),

      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CatagoriesMealScreen.routeName : (context) => CatagoriesMealScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName : (context) => FiltersScreen(_filtres,_setfilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal APP'),

      ),
      body:null,
    );
  }
}
