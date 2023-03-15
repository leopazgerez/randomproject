import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        _customTextformField()
      ]
    );
  }
  Widget _customTextformField() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.search),
        ) ,
      ),
    );
  }
}
