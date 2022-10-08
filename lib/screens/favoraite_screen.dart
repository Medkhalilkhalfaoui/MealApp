import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class FavoriateScreen extends StatelessWidget {

  final List <Meal> favoriteMeals;
  FavoriateScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('favorites'),
      );
    }else{
      return ListView.builder(
        itemBuilder:(ctx, index){
          return MealItem(
            id: favoriteMeals[index].id,
            imageurl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title ,
            duration:  favoriteMeals[index].duration,
            complexity:  favoriteMeals[index].complexity,
            affordability:  favoriteMeals[index].affordability,

          );
        },
        itemCount: favoriteMeals.length ,

      );
    }

  }
}
