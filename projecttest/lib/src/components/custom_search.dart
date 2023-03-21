import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final TextEditingController controller;
  final String textSearch;
  final Color colorPrimarySearch;
  final Icon iconSearch;
  final Color colorSecondarySearch;

  const Search(this.controller,
      {this.textSearch = "Buscar",
      this.colorPrimarySearch = Colors.white,
      this.colorSecondarySearch = Colors.black,
      this.iconSearch = const Icon(
        Icons.search,
        color: Colors.black,
      ),
      super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return search();
  }

  Widget search() {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      child: TextField(
        controller: widget.controller,
        //diseño y estilo
        style: TextStyle(
          color: widget.colorSecondarySearch,
        ),
        cursorColor: widget.colorSecondarySearch,
        decoration: InputDecoration(
          hintText: widget.textSearch,
          hintStyle: TextStyle(color: widget.colorSecondarySearch),
          filled: true,
          fillColor: widget.colorPrimarySearch,
          border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.colorPrimarySearch),
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: widget.iconSearch,
        ),
      ),
    );
  }
}
