import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/page_components/custom_button.dart';
// ignore_for_file: must_be_immutable, non_constant_identifier_names

class SecondCardComponent extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final double height;
  final double aspectRatio;
  Color? color;
  SecondCardComponent(
      {Key? key,
      required this.rating,
        this.height = 280,
      required this.price,
      required this.image,
      required this.title,
      required this.subtitle,
      this.color, required this.aspectRatio})
      : assert(height >= 280, 'El alto debe ser mayor a 280. Por defecto el alto es de 280'), super(key: key);

  @override
  State<SecondCardComponent> createState() => _SecondCardComponentState();
}

class _SecondCardComponentState extends State<SecondCardComponent> {
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6/6,
        child: Container(
          color: Colors.amber,
          child: FittedBox(child: Text('data')),
        ));
  }
  // double _radius = widget!.height*0.1;
  @override
  // Widget build(BuildContext context) {
  //   double radius = widget.height * 0.1;
  //   List<Color> colors = [const Color(0xff312b2c), Colors.black];
  //   return Container(
  //     width: widget.height * 0.625,
  //     height: widget.height,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(radius), color: Colors.black,
  //         gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(15),
  //       child: Column(
  //         children: [
  //           Expanded(flex: 8, child: _part1(radius)),
  //           Expanded(flex: 3, child: _part2()),
  //           Expanded(flex: 2, child: _part3()),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _part1(radius) {
    double widthRating = widget.height *0.189;
    double heightRating = widget.height *0.064;
    double sizeIcon = widget.height *0.039;
    double fontSize = widget.height *0.042;
    double boxSize = widget.height *0.028;
    double boxSize2 = widget.height *0.014;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Stack(
        children: [
          SizedBox(
            child: Image.network(
              widget.image,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius)),
                color: Colors.black54,
              ),
              width: widthRating,
              height: heightRating,
              child: Row(
                children: [
                   SizedBox(
                    width: boxSize,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: sizeIcon,
                  ),
                  SizedBox(
                    width: boxSize2,
                  ),
                  Text(
                    widget.rating.toString(),
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _part2() {
    double fontSizeTitle = widget.height *0.1;
    double fontSizeSubtitle = widget.height *0.046;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: TextStyle(fontSize: fontSizeTitle),),
          const SizedBox(
            height: 2,
          ),
          Text(widget.subtitle, style: TextStyle(fontSize: fontSizeSubtitle))
        ],
      ),
    );
  }

  Widget _part3() {
    double fontSizePrice = widget.height *0.1;
    double iconSize = widget.height *0.089;
    double buttonSize = widget.height *0.16;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              children: [
                Icon(Icons.attach_money, size: iconSize, color: const Color(0xffcf7842),),
                Text(widget.price.toString(), style: TextStyle(fontSize: fontSizePrice))
              ],
            ),
          ),
          CustomButton(
            color: const Color(0xffcf7842),
            size: buttonSize,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
