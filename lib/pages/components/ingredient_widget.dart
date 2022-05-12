import 'package:cocktails/constants.dart';
import 'package:cocktails/services/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientWidget extends StatelessWidget{

  const IngredientWidget({Key? key, required this.iList}) : super(key: key);
  final List<Ingredient> iList;

  Widget createTable(){
    List<TableRow> rows = [];

    for(int i=0; i< iList.length; i++){
      rows.add(
        TableRow(
          children: [
            Center(
              child: Text(iList[i].name),
            ),
            Center(
              child: Text(iList[i].measure),
            )
          ],
        ),
      );
    }
    return Table(children: rows);
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Text("Ingredients",
        style: kWidgetTitleStyle,),

        const SizedBox(height: 30,),

        Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: createTable(),
            ),
        ),
      ],
    );
  }
}