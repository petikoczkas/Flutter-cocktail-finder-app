import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF1F2129);
const kBtnColor = Color(0xFF3C4D74);
const kDetailsColor = Color(0xFF383D4D);

const kBorderSide = BorderSide(
  color: kBtnColor,
  width: 4,
);

const kButtonMinSize = Size(100, 55);

const kWidgetTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500
);

const kWidgetDecorationStyle = BoxDecoration(
  color: kDetailsColor,
  borderRadius: BorderRadius.all(Radius.circular(30),
  ),
);

const kDetailNameTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const kDetailEdgeInsetSymmetric = EdgeInsets.symmetric(horizontal: 20);

const kEdgeInsetsAll20 = EdgeInsets.all(20);

const kDetailTextSeparator = Text(' - ');

const kTextReturn = Text("RETURN");
const kTextSearch = Text("SEARCH");
const kTextRandom = Text("RANDOM");
const kTextFavorites = Text("FAVORITES");

const kListItemTextStyle= TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20);

const kSizedBox100 = SizedBox(height: 100);

const kSizedBox25 = SizedBox(height: 25);

const kSearchPageTitle = Center(
  child: Text("Cocktails",
      style: TextStyle(fontSize: 70)),
);

const kSnackBarNoName = SnackBar(
  content: Text(
      'Name a cocktail!',
      style:  TextStyle(color: Colors.white, fontSize: 20)),
  backgroundColor: Colors.deepOrange,

);

const kSnackBarNotFound = SnackBar(
  content: Text(
      'Cocktail not found!',
      style:  TextStyle(color: Colors.white, fontSize: 20)),
  backgroundColor: Colors.deepOrange,

);

const kNameUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";
const kRandomUrl = "https://www.thecocktaildb.com/api/json/v1/1/random.php";