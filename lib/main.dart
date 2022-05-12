import 'package:cocktails/constants.dart';
import 'package:cocktails/pages/search_page.dart';
import 'package:cocktails/providers/cocktail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyCocktail()));
}

class MyCocktail extends StatelessWidget{
  const MyCocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => CocktailProvider(),
      child: MaterialApp(
        home: const SearchPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
        ),
      ),
  );
}