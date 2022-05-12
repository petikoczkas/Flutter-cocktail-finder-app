import 'dart:convert';

import 'package:cocktails/services/cocktail_manager.dart';
import 'package:http/http.dart';

import '../constants.dart';

class CocktailApi{
  static Future<List<CocktailManager>> receiveCocktails(String cocktailName) async{
      var request = await get(Uri.parse(kNameUrl + cocktailName));
      List<CocktailManager> cmList = [];
      if(jsonDecode(request.body)['drinks'] == null) {
        return cmList;
      }

        List<dynamic> json = jsonDecode(request.body)['drinks'];


        cmList = json
            .map(
              (dynamic item) => CocktailManager.fromJson(item),
        ).toList();

        return cmList;

  }
  static Future<CocktailManager> receiveRandomCocktail() async{
    var request = await get(Uri.parse(kRandomUrl));

    var json = jsonDecode(request.body)['drinks'][0];
    CocktailManager cm = CocktailManager.fromJson(json);

    return cm;
  }
}