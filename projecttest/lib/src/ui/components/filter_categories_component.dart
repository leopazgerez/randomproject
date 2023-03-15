import 'package:flutter/material.dart';

//Orange/Brown #d27841
//BackgroundColor #0c1015
class FilterCategoriesComponent extends StatefulWidget {
  final List<String>? categories;
  final Function(int) onSelected;

  const FilterCategoriesComponent(
      {Key? key, this.categories, required this.onSelected})
      : super(key: key);

  @override
  State<FilterCategoriesComponent> createState() =>
      _FilterCategoriesComponentState();
}

class _FilterCategoriesComponentState extends State<FilterCategoriesComponent> {
  int checkPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff0c1015),
      ),
      alignment: Alignment.center,
      child: widget.categories != null
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(widget.categories!.length, (index) {
                  const separatorVertical8 = SizedBox(
                    height: 8,
                  );
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        checkPosition = index;
                        widget.onSelected(index);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.categories![index],
                            style: TextStyle(
                              color: checkPosition == index
                                  ? const Color(0xffd27841)
                                  : const Color(0xff3f4348),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          separatorVertical8,
                          checkPosition == index
                              ? const CheckCircle(
                                  visible: true,
                                )
                              : const CheckCircle(
                                  visible: false,
                                ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          : const Text("Sin categorias"),
    );
  }
}

class CheckCircle extends StatelessWidget {
  final bool visible;
  const CheckCircle({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: visible ? const Color(0xffd27841) : const Color(0xff0c1015),
        shape: BoxShape.circle,
      ),
    );
  }
}
