import 'package:cocktails/pages/components/item_widget.dart';
import 'package:cocktails/services/cocktail_manager.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {

  const ListPage({Key? key, required this.cmList, required this.cmFav}) : super(key: key);
  final List<CocktailManager> cmList;
  final List<CocktailManager> cmFav;

  isSame(){
    var condition1 = cmList.toSet().difference(cmFav.toSet()).isEmpty;
    var condition2 = cmList.length == cmFav.length;
    var isEqual = condition1 && condition2;
    return isEqual;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: cmList.length,
                itemBuilder: (context,index){
                  return ItemWidget(
                    item: cmList[index],
                    favPage: isSame(),
                  );
                },
            ),
          ),
        ),
     // ),
    );
  }
}