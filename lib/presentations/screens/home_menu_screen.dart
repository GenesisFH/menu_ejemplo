import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/widgets/botton_search.dart';
import 'package:example_menu/presentations/widgets/build_food_item.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/tamplate_screens.dart';
import 'package:flutter/material.dart';

class HomeMenuScreen extends StatefulWidget {
  const HomeMenuScreen({super.key});

  @override
  State<HomeMenuScreen> createState() => _HomeMenuScreenState();
}

class _HomeMenuScreenState extends State<HomeMenuScreen>
    with CustomText, Header {
  List foodList = Foods.foods;
  List filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = foodList;
  }

  void _searchFood(String query) {
    setState(() {
      filteredList = foodList
          .where((food) =>
              food.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TamplateScreens(
      backgroundColor: Color(0xFF21BFBD),
      header: getHeader(),
      headerWidgetText: Row(
        children: [
          getHeaderText(text: 'Healthy', fontWeight: FontWeight.bold),
          SizedBox(width: 5),
          getHeaderText(text: 'Food'),
        ],
      ),
      body: ListView(
        primary: false,
        padding: EdgeInsets.only(left: 25.0, right: 20.0),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return BuildFoodItem(food: filteredList[index]);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: BottonSearch(onSearch: _searchFood),
    );
  }
}
