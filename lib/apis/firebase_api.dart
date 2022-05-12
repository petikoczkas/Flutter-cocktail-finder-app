import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/cocktail_manager.dart';

class FirebaseApi{
  static Future<List<CocktailManager>> receiveFavorites() async {
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('Cocktails');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();


    List<CocktailManager> cmList = allData
        .map(
          (dynamic item) => CocktailManager.fromJson(item),
    ).toList();

    return cmList;
  }

  static Future createFavorite(CocktailManager cm) async{
    final docFav = FirebaseFirestore.instance.collection('Cocktails').doc();
    await docFav.set(cm.toJson());
  }

  static Future deleteFavorite(CocktailManager cm) async{
    final collection = FirebaseFirestore.instance.collection('Cocktails');
    var snapshot = await collection
        .where('strDrink', isEqualTo: cm.name)
        .get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
      break;
    }
  }
}