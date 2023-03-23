import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/page_components/custom_button.dart';
// ignore_for_file: must_be_immutable, non_constant_identifier_names

class CardComponent extends StatelessWidget {
  String? image;
  String? title;
  String? subtitle;
  double? price;
  double? rating;
  double? height;
  Color? color;

  CardComponent({Key? key, this.rating, this.price, this.image, this.title, this.subtitle, this.height = 250, this.color})
      : assert (height! >= 250, 'height must be greater than 250') ,super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 30;
    Color fontColor = Colors.white;
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return SizedBox(
      width: width,
      height: height ?? 250,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 25,),
          itemBuilder: (context, index) {
            return (buildCard(radius, fontColor));
          }),
    );
  }

  Widget buildCard(double radius, Color fontColor) {
    return AspectRatio(
      aspectRatio: 5/8,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? const Color(0xff0e1318),
          borderRadius: BorderRadius.circular(radius)
        ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                module1(radius),
                const SizedBox(
                  height: 10,
                ),
                module2(fontColor),
                module3(fontColor),
              ],
            ),
          ),
      ),
    );
  }

  Widget module3(Color fontColor) {
    double sizePrice = height! *0.08;
    double sizeButton = height! *0.13;

    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.attach_money, color: Color(0xffcf7842),),
              Text(
                 '${price!}',
                style: TextStyle(color: fontColor, fontSize: height != null ? sizePrice : 20),
              ),
            ],
          ),
          CustomButton(color: const Color(0xffcf7842), size: height != null ? sizeButton : 40, icon: const Icon(Icons.add),),
        ],
      ),
    );
  }

  Widget module2(Color fontColor) {
    double sizeTitle = height! *0.08;
    double sizeSubtitle = height! *0.04;
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(
                    color: fontColor,
                    fontSize: height != null ? sizeTitle : 20,
                    ),
              ),
              const SizedBox(height: 3,),
              Text(
                subtitle!,
                style: TextStyle(color: fontColor, fontSize: height != null ? sizeSubtitle : 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget module1(double radius) {
    return Expanded(
      flex: 8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            children: [imageBuild(), ratingBuild()],
          )),
    );
  }

  Widget ratingBuild() {
    var sizeIcon = height! * 0.043;
    var sizePrice = height! * 0.046;
    var innerWidth = height! * 0.2;
    var innerHeight = height! * 0.075;
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          color: Colors.black54,
        ),
        width: height != null ? innerWidth : 60,
        height: height != null ? innerHeight : 20,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
              size: height != null ? sizeIcon : 13,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${rating!}',
              style: TextStyle(
                  fontSize: height != null ? sizePrice : 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget imageBuild() {
    return Image.network(
        image!,
        fit: BoxFit.fill);
  }
}
