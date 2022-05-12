

import 'package:cocktails/apis/cocktail_api.dart';
import 'package:cocktails/services/cocktail_manager.dart';
import 'package:flutter/material.dart';

import '../apis/firebase_api.dart';
import '../apis/cocktail_api.dart';

class CocktailProvider extends ChangeNotifier{
  void addFavorite(CocktailManager cm){
    FirebaseApi.createFavorite(cm);
  }

  void removeFavorite(CocktailManager cm){
    FirebaseApi.deleteFavorite(cm);
  }

  Future<List<CocktailManager>> getFavorites() {
    return FirebaseApi.receiveFavorites();
  }

  Future<List<CocktailManager>> getCocktails(String cocktailName){
    return CocktailApi.receiveCocktails(cocktailName);
  }

  Future<CocktailManager> getRandomCocktail(){
    return CocktailApi.receiveRandomCocktail();
  }
}