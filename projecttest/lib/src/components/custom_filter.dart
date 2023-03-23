import 'package:flutter/material.dart';
import 'package:projecttest/src/enums/categorys_enum.dart';

class Filter extends StatefulWidget {
  final Map<Categorys, bool> categorys;
  Function? onItem;
  final double heightList;
  final Color colorFilterSecondary;
  final Color colorFilterPrimary;

  Filter(this.categorys,
      {this.onItem,
      this.heightList = 55,
      this.colorFilterSecondary = Colors.red,
      this.colorFilterPrimary = Colors.black,
      super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categorysList(),
      ],
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
                    widget.categorys.updateAll((key, value) => false);
                    widget.categorys.update(
                        widget.categorys.keys.elementAt(index),
                        (value) => true);
                    if (widget.onItem != null) {
                      widget.onItem!();
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(widget.categorys.keys.elementAt(index).name,
                              style: TextStyle(
                                  color:
                                      widget.categorys.values.elementAt(index)
                                          ? widget.colorFilterSecondary
                                          : widget.colorFilterPrimary,
                                  fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.circle,
                              color: widget.categorys.values.elementAt(index)
                                  ? widget.colorFilterSecondary
                                  : Colors.transparent,
                              size: 8,
                            ),
                          )
                        ],
                      )));
            }));
  }
}
