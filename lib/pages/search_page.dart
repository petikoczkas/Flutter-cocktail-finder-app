import 'package:cocktails/constants.dart';
import 'package:cocktails/pages/detail_page.dart';
import 'package:cocktails/pages/list_page.dart';
import 'package:cocktails/services/cocktail_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cocktail_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);


  @override
  _SearchPage createState() => _SearchPage();
}
class _SearchPage extends State<SearchPage>{

  String? cocktailName;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                kSizedBox100,
                // Title
                kSearchPageTitle,
                kSizedBox100,
                //Input
                TextField(
                  onChanged: (value) {
                    cocktailName = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: kEdgeInsetsAll20,
                    hintText: "Name a cocktail...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: kBorderSide,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: kBorderSide,
                    ),
                  ),
                ),

                kSizedBox25,
                //Search Button
                ElevatedButton(
                  onPressed: () async {
                    if(cocktailName == null || cocktailName == ''){
                      ScaffoldMessenger.of(context).showSnackBar(kSnackBarNoName);
                      return;
                    }
                    cocktailName?.toLowerCase().replaceAll(' ', '_');

                    List<CocktailManager> cmList = await Provider.of<CocktailProvider>(context, listen: false).getCocktails(cocktailName!);

                    if (cmList.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(kSnackBarNotFound);
                      return;
                    }

                    List<CocktailManager> list = await Provider.of<CocktailProvider>(context, listen: false).getFavorites();

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return ListPage(cmList: cmList, cmFav: list);
                        }),
                    );
                  },
                  child: kTextSearch,
                  style: ElevatedButton.styleFrom(
                    primary: kBtnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: kButtonMinSize,
                  ),
                ),

                kSizedBox25,

                //Random Button
                ElevatedButton(onPressed: () async{
                  final provider = Provider.of<CocktailProvider>(context, listen: false);

                  CocktailManager cm = await provider.getRandomCocktail();

                  List<CocktailManager> cmList = await provider.getFavorites();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return DetailPage(
                          cm: cm,
                          cmFav: cmList,
                          favPage: false,
                      );
                    }),
                  );
                },
                  child: kTextRandom,
                  style: ElevatedButton.styleFrom(
                    primary: kBtnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: kButtonMinSize,
                  ),
                ),

                kSizedBox25,

                //Favorites Button
                ElevatedButton(onPressed: () async {

                  List<CocktailManager> cmList = await Provider.of<CocktailProvider>(context, listen: false).getFavorites();


                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListPage(cmList: cmList, cmFav: cmList),
                    ),
                  );

                },
                    child: kTextFavorites,
                  style: ElevatedButton.styleFrom(
                    primary: kBtnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: kButtonMinSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

