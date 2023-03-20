import 'package:flutter/material.dart';
import 'package:projecttest/src/models/categorys_model.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class Filter extends StatefulWidget {
  final TextEditingController controller;
  final Map<Categorys, bool> categorys;
  final Function filter;
  final double heightList;
  final String textSearch;
  final Color colorSearchPrimary;
  final Color colorSearchSecundary;
  final Icon iconSearch;
  final Color colorSecundarySearch;

  const Filter(this.controller, this.categorys, this.filter,
      {this.heightList = 55,
      this.textSearch = "Buscar",
      this.colorSearchPrimary = Colors.white,
      this.colorSearchSecundary = Colors.red,
      this.colorSecundarySearch = Colors.black,
      this.iconSearch = const Icon(
        Icons.search,
        color: Colors.black,
      ),
      super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        search(),
        categorysList(),
      ],
    );
  }

  Widget search() {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      child: TextField(
        controller: widget.controller,
        //diseño y estilo
        style: TextStyle(
          color: widget.colorSecundarySearch,
        ),
        cursorColor: widget.colorSecundarySearch,
        decoration: InputDecoration(
          hintText: widget.textSearch,
          filled: true,
          fillColor: widget.colorSearchPrimary,
          border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.colorSecundarySearch),
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: widget.iconSearch,
        ),
      ),
    );
  }

  Widget categorysList() {
    return SizedBox(
        height: widget.heightList,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 5),
            itemCount: widget.categorys.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    widget.filter(widget.categorys.keys.elementAt(index));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(widget.categorys.keys.elementAt(index).name,
                              style: TextStyle(
                                  color:
                                      widget.categorys.values.elementAt(index)
                                          ? widget.colorSearchSecundary
                                          : widget.colorSearchPrimary,
                                  fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.circle,
                              color: widget.categorys.values.elementAt(index)
                                  ? widget.colorSearchSecundary
                                  : Colors.transparent,
                              size: 8,
                            ),
                          )
                        ],
                      )));
            }));
  }
}
