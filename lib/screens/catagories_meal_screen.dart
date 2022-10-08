import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';
import '../dummy_data.dart';

class CatagoriesMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List <Meal> availableMeals;
  CatagoriesMealScreen(this.availableMeals);


  @override
  _CatagoriesMealScreenState createState() => _CatagoriesMealScreenState();
}

class _CatagoriesMealScreenState extends State<CatagoriesMealScreen> {
  String catagoryTitle;
  List<Meal> catagorymeals;
  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catagorId = routeArg['id'];
    catagoryTitle = routeArg['title'];
    catagorymeals = widget.availableMeals.where((meal){
      return meal.categories.contains(catagorId);

    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
   setState(() {
     catagorymeals.removeWhere((meal) => meal.id== mealId);
   });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(catagoryTitle),
      ),
      body: ListView.builder(
        itemBuilder:(ctx, index){
          return MealItem(
            id: catagorymeals[index].id,
            imageurl: catagorymeals[index].imageUrl,
            title: catagorymeals[index].title ,
            duration:  catagorymeals[index].duration,
            complexity:  catagorymeals[index].complexity,
            affordability:  catagorymeals[index].affordability,

          );
        },
        itemCount: catagorymeals.length ,

      ),
    );
  }
}
