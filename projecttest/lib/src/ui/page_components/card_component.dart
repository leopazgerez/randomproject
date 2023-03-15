import 'package:flutter/material.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

class CardComponent extends StatelessWidget {
  String? image;
  String? title;
  String? subtitle;
  double? price;
  double? rating;
  double? height;
  Color? color;
  CardComponent({Key? key, this.rating, this.price, this.image, this.title, this.subtitle, this.height, this.color})
      : assert (height!>=250, 'height must be greater than 250') ,super(key: key);

  @override
  Widget build(BuildContext context) {
    double _radius = 50;
    Color _fontCOlor = Colors.white;
    var size = MediaQuery.of(context).size;
    var _width = size.width;
    return SizedBox(
      width: _width,
      height: height != null ? height : 250,
      child: ListView.separated(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
          itemCount: 50,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 25,),
          itemBuilder: (context, index) {
            return (buildCard(_radius, _fontCOlor));
          }),
    );
  }

  Widget buildCard(double _radius, Color _fontColor) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 5/8,
          child: Container(
            decoration: BoxDecoration(
              color: color != null ? color : Colors.black,
              borderRadius: BorderRadius.circular(_radius)
            ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    module1(_radius),
                    const SizedBox(
                      height: 10,
                    ),
                    module2(_fontColor),
                    module3(_fontColor),
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }

  Widget module3(Color _fontColor) {
    double _sizePrice = height! *0.08;
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: FittedBox(
              child: Text(
                 '${price!}',
                style: TextStyle(color: _fontColor, fontSize: height != null ? _sizePrice : 20),
              ),
            ),
          ),
          Container(
            child: FittedBox(
              child: Icon(
                Icons.add_circle_outline,
                color: _fontColor,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget module2(Color _fontColor) {
    double _sizeTitle = height! *0.08;
    double _sizeSubtitle = height! *0.04;
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
                    color: _fontColor,
                    fontSize: height != null ? _sizeTitle : 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle!,
                style: TextStyle(color: _fontColor, fontSize: height != null ? _sizeSubtitle : 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget module1(double _radius) {
    return Expanded(
      flex: 8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: Stack(
            children: [imageBuild(), ratingBuild()],
          )),
    );
  }

  Widget ratingBuild() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          color: Colors.black54,
        ),
        width: 75,
        height: 25,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const FittedBox(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                // size: 20,
              ),
            ),
            FittedBox(
              child: Text(
                '${rating!}',
                // style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
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
