import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projecttest/src/enums/category_enum.dart';

class SecondFilter extends StatefulWidget {
  final Map<CategoryEnum, bool>? categories;
  final Function(CategoryEnum)? selectCategory;
  const SecondFilter({super.key, this.selectCategory, this.categories});

  @override
  State<SecondFilter> createState() => _SecondFilterState();
}

class _SecondFilterState extends State<SecondFilter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: _listTarjet(widget.categories!));
  }

  Widget _listTarjet(Map<CategoryEnum, bool> catg) {
    return ListView.separated(
        itemCount: catg.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => _tarjet(
            catg.keys.elementAt(index).name,
            catg.values.elementAt(index),
            widget.categories!.keys.elementAt(index)));
  }

  Widget _tarjet(String title, bool state, CategoryEnum categories) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 50,
      color: Colors.amberAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
          CupertinoSwitch(
              activeColor: Colors.amber,
              value: state,
              onChanged: (bool value) {
                setState(() {
                  widget.selectCategory!(categories);
                });
              }),
        ],
      ),
    );
  }
}
