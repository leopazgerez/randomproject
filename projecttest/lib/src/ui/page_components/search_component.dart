import 'package:flutter/material.dart';

import '../../models/breakfast_model.dart';

class SearchComponent extends StatefulWidget {
  final List<BreakfastModel>? list;
  SearchComponent({Key? key, this.list}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
TextEditingController search = TextEditingController();
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: search,
        decoration: const InputDecoration(
          icon:  Icon(Icons.search),
        ) ,
      ),
    );
  }
}