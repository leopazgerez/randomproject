import 'package:flutter/material.dart';

import '../../models/breakfast_model.dart';

class SearchComponent extends StatefulWidget {
  final TextEditingController? controller;
  SearchComponent({Key? key, this.controller}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [_customTextformField()]);
  }

  Widget _customTextformField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: const InputDecoration(
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}
