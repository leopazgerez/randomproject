import 'package:flutter/material.dart';
// ignore_for_file: avoid_print

//BackgroundColorSearcher #131921
//IconSearcher, HelpTextSearcher, InputTextSearcher #51545c
class SearcherComponent extends StatefulWidget {
  final Function(String) onChanged;
  const SearcherComponent({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<SearcherComponent> createState() => _SearcherComponentState();
}

class _SearcherComponentState extends State<SearcherComponent> {
  // TextEditingController searcherController = TextEditingController();
  FocusNode searcherFocusNode = FocusNode();
  Color iconSearcherColor = const Color(0xff51545c);

  onFocusTextField() {
    setState(() {
      iconSearcherColor = const Color(0xffd27841);
    });
    print("Enfocado");
  }

  unFocusTextField() {
    setState(() {
      iconSearcherColor = const Color(0xff51545c);
    });
    print("Sin foco");
  }

  @override
  void initState() {
    // searcherController.addListener(printText);
    searcherFocusNode.addListener(() {
      if (searcherFocusNode.hasFocus) {
        onFocusTextField();
      } else {
        unFocusTextField();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // searcherController.dispose();
    searcherFocusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        // width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff131921),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onChanged: (text) {
            widget.onChanged(text);
          },
          focusNode: searcherFocusNode,
          // controller: searcherController,
          cursorColor: const Color(0xffd27841),
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: iconSearcherColor,
            ),
            border: InputBorder.none,
            hintText: "Find your coffe...",
          ),
        ));
  }
}
