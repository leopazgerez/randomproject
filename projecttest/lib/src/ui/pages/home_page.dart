import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:projecttest/src/components/custom_card.dart';
import 'package:projecttest/src/components/custom_filter.dart';
import 'package:projecttest/src/components/custom_search.dart';
import 'package:projecttest/src/ui/pages/item_page.dart';
import 'package:projecttest/src/ui/pagescontroller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomePageController _con;

  _HomePageState() : super(HomePageController()) {
    _con = HomePageController.con;
    _con.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: textTitle(),
              ),
            ),
            Search(
              _con.searchControl,
              colorPrimarySearch: Colors.grey.shade900,
              colorSecondarySearch: Colors.grey.shade500,
              iconSearch: Icon(
                Icons.search,
                color: Colors.grey.shade500,
              ),
            ),
            Filter(
              _con.getCategorys(),
              onItem: _con.onItem,
              colorFilterPrimary: Colors.grey.shade50,
              colorFilterSecondary: const Color(0xffcf7842),
            ),
            listScroll(),
          ]),
        ),
      ),
    );
  }

  Widget listScroll() {
    return SizedBox(
        height: 260,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  width: 20,
                ),
            itemCount: _con.searchControl.text.isNotEmpty
                ? _con.itemsSearch.length
                : _con.itemsFilter.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                //redireccion a otra pagina
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (ItemPage(
                              _con.searchControl.text.isNotEmpty
                                  ? _con.itemsSearch[index]
                                  : _con.itemsFilter[index],
                            ))),
                  );
                },
                child: CustomCard(
                  _con.searchControl.text.isNotEmpty
                      ? _con.itemsSearch[index]
                      : _con.itemsFilter[index],
                ),
              );
            }));
  }

  Widget textTitle() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: const Text(
        "Finde the best coffe for you",
        textAlign: TextAlign.left,
        maxLines: 2,
        style: TextStyle(
          fontSize: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
