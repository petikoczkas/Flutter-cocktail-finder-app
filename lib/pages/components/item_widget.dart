import 'package:cocktails/constants.dart';
import 'package:cocktails/pages/detail_page.dart';
import 'package:cocktails/services/cocktail_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cocktail_provider.dart';

class ItemWidget extends StatelessWidget {
  final CocktailManager item;
  final bool favPage;
  const ItemWidget({Key? key, required this.item, required this.favPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {

          List<CocktailManager> cmFavList = await Provider.of<CocktailProvider>(context, listen: false).getFavorites();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return DetailPage(
                  cm: item,
                  cmFav: cmFavList,
                  favPage: favPage,
              );
            }),
          );
        },
        child: Card(

          elevation: 0,
          color: kBtnColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(item.picUrl)),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(item.name,style:  kListItemTextStyle)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}