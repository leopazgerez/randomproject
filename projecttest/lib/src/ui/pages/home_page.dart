import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:projecttest/src/ui/pagescontroller/home_pagecontroller.dart';
import '../page_components/search_component copy.dart';
import '../page_components/second_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  final HomePageController _con = HomePageController();

  @override
  void initState() {
    _con.initPage();
    _con.filterController.addListener(() {
      setState(() {
        _con.filterResult();
      });
      print(_con.filterController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SearchComponent(
              controller: _con.filterController,
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: ListView.builder(
                  itemCount: _con.searchResult.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_con.searchResult[index].title!),
                    subtitle: Text(_con.searchResult[index].subtitle!),
                  ),
                ),
              ),
            ),
            SecondFilter(
                categories: _con.categories,
                selectCategory: _con.selectCategory)
          ],
        ),
      ),
    );
  }
}
