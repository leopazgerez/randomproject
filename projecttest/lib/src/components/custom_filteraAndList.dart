import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_card.dart';

class FilterAndList extends StatefulWidget {
  final TextEditingController controller;
  final double heightList;
  final String textSearch;
  final Color colorSearch;
  final Icon iconSearch;
  final Color colorSecundarySearch;

  const FilterAndList(this.controller,
      {this.heightList = 282,
      this.textSearch = "Buscar",
      this.colorSearch = Colors.white,
      this.colorSecundarySearch = Colors.black,
      this.iconSearch = const Icon(
        Icons.search,
        color: Colors.black,
      ),
      super.key});

  @override
  State<FilterAndList> createState() => _FilterAndListState();
}

class _FilterAndListState extends State<FilterAndList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        search(),
        categorys(),
      ],
    );
  }

  Widget search() {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          // pendiente
        },
        //diseño y estilo
        style: TextStyle(
          color: widget.colorSecundarySearch,
        ),
        cursorColor: widget.colorSecundarySearch,
        decoration: InputDecoration(
          hintText: widget.textSearch,
          filled: true,
          fillColor: widget.colorSearch,
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

  Widget categorys() {
    return Container(height: 40);
  }

  Widget listScroll() {
    return SizedBox(
      height: widget.heightList,
      // child: ListView.separated(
      //     scrollDirection: Axis.horizontal,
      //     separatorBuilder: (BuildContext context, int index) =>
      //         const SizedBox(
      //           width: 20,
      //         ),
      //     itemCount: widget.items.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return CustomCard(widget.items[index]);
      //     })
    );
  }
}
