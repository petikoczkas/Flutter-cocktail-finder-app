import 'package:cocktails/constants.dart';
import 'package:cocktails/pages/components/ingredient_widget.dart';
import 'package:cocktails/pages/components/instruction_widget.dart';
import 'package:cocktails/services/cocktail_manager.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:provider/provider.dart';
import '../providers/cocktail_provider.dart';

class DetailPage extends StatelessWidget{
  final CocktailManager cm;
  final List<CocktailManager> cmFav;
  final bool favPage;

  const DetailPage({Key? key,
    required this.cm,
    required this.cmFav,
    required this.favPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
              hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Cocktail Name
                    Center(
                      child: Text(cm.name,
                        style: kDetailNameTextStyle
                      ),
                    ),

                    //Cocktail Details
                    Container(
                      padding: kDetailEdgeInsetSymmetric,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: kDetailsColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cm.category),
                          kDetailTextSeparator,
                          Text(cm.alcoholic),
                          kDetailTextSeparator,
                          Text(cm.glassType),
                        ],
                      ),
                    ),

                    //Cocktail Image
                    Container(
                      width: 225,
                      height: 225,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(cm.picUrl)),
                      ),
                    ),

                    //Cocktail Ingredients
                    Container(
                      padding: kEdgeInsetsAll20,
                      margin: kDetailEdgeInsetSymmetric,
                      height: 200,
                      decoration: kWidgetDecorationStyle,
                      child: IngredientWidget(
                        iList: cm.ingredients,
                      ),
                    ),


                    //Cocktail Instructions
                    Container(
                      padding: kEdgeInsetsAll20,
                      margin: kDetailEdgeInsetSymmetric,
                      height: 200,
                      decoration: kWidgetDecorationStyle,
                      child: InstructionWidget(
                        instructions: cm.instructions,
                      ),
                    ),

                    //Return and Like Button
                    Container(
                      padding: kDetailEdgeInsetSymmetric,
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (favPage) {
                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                child: kTextReturn,
                                style: ElevatedButton.styleFrom(
                                    primary: kBtnColor,
                                    minimumSize: kButtonMinSize,
                                    shape : RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                ),
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: FavoriteButton(
                              valueChanged: (isLiked) {
                                saveCocktail(isLiked, context);
                              },
                              iconSize: 60,
                              isFavorite: isFavorite(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]
          )
      )
    );
  }

  saveCocktail(bool isLiked, BuildContext context) {

    final provider = Provider.of<CocktailProvider>(context, listen: false);

    if(isLiked ) {
      provider.addFavorite(cm);
      cmFav.add(cm);
    }
    else {
      provider.removeFavorite(cm);
      cmFav.remove(cm);
    }
  }

  isFavorite(){
    for(var i in cmFav){
      if(cm.name == i.name) return true;
    }
    return false;
  }
}