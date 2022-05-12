import 'package:cocktails/services/ingredient.dart';

class CocktailManager{
  String name;
  String category;
  String alcoholic;
  String glassType;
  String picUrl;
  String instructions;
  List<Ingredient> ingredients;

  CocktailManager({
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glassType,
    required this.picUrl,
    required this.instructions,
    required this.ingredients,
  });

  factory CocktailManager.fromJson(Map<String, dynamic> json) {

    String? strIngredientName, strIngredientMeasure;
    List<Ingredient> iList = [];

    for(int i = 1; i < 16; i++){
      strIngredientName = json['strIngredient' + i.toString()];
      strIngredientMeasure = json['strMeasure' + i.toString()];
      strIngredientName ??= ' ';
      strIngredientMeasure ??= ' ';
      iList.add(
          Ingredient(name: strIngredientName, measure: strIngredientMeasure)
      );
    }
    iList.removeWhere((element) =>
    element.name == ' ' && element.measure == ' ');

    return CocktailManager(
        name: json['strDrink'],
        category: json['strCategory'],
        alcoholic: json['strAlcoholic'],
        glassType: json['strGlass'],
        picUrl: json['strDrinkThumb'],
        instructions: json['strInstructions'],
        ingredients: iList
      );
  }

  Map<String, dynamic> toJson() {

    Map<String, dynamic> map = {
      'strDrink': name,
      'strCategory': category,
      'strAlcoholic': alcoholic,
      'strGlass': glassType,
      'strDrinkThumb': picUrl,
      'strInstructions': instructions,
    };
    for(int i=1; i<=ingredients.length; i++){
      map['strIngredient' + i.toString()] = ingredients[i-1].name;
      map['strMeasure' + i.toString()] = ingredients[i-1].measure;
    }

    return map;
  }
}