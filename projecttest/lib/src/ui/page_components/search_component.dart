import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchComponent extends StatefulWidget {
  TextEditingController? controller;
  SearchComponent({super.key, this.controller});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25)),
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          contentPadding: EdgeInsets.only(bottom: 15),
        ),
      ),
    );
  }
}
