import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_button.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class CustomCard extends StatefulWidget {
  final ItemBreakfastModel item;
  final double height;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color colorIcons;
  final Color prymaryColor;
  final Color secondaryColor;

  CustomCard(this.item,
      {this.height = 240,
      this.textPrimaryColor = Colors.white,
      this.textSecondaryColor = Colors.grey,
      this.prymaryColor = const Color(0xff0e1318),
      this.secondaryColor = const Color(0xff312b2c),
      this.colorIcons = const Color(0xffcf7842),
      super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[widget.secondaryColor, widget.prymaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp)),
          height: widget.height,
          width: widget.height / 1.7 + 20,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [photo(), titleAndSubtitle(), price()]),
          ),
        ));
  }

  Widget photo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(children: [
        Image(
          image: NetworkImage(
            widget.item.product!.photo,
          ),
          height: widget.height / 1.7,
          width: widget.height / 1.7,
          fit: BoxFit.cover,
        ),
        Align(alignment: Alignment.topRight, child: raiting())
      ]),
    );
  }

  Widget titleAndSubtitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              widget.item.product!.title.name,
              style: TextStyle(color: widget.textPrimaryColor, fontSize: 25),
            ),
          ),
          Text(
            widget.item.product!.subtitle,
            style: TextStyle(color: widget.textSecondaryColor, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Row(
      children: [
        Icon(
          Icons.attach_money,
          color: widget.colorIcons,
          size: 25,
        ),
        Text(
          widget.item.price!.toStringAsFixed(2),
          style: TextStyle(color: widget.textPrimaryColor, fontSize: 25),
        ),
        const Expanded(child: SizedBox.shrink()),
        CustomButton(
          color: widget.colorIcons,
          size: 35,
          icon: const Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget raiting() {
    return Container(
        width: 63,
        height: 20,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: widget.prymaryColor.withOpacity(0.5),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(35)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 3),
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 13,
              ),
            ),
            Text(
              widget.item.product!.rating.toStringAsFixed(1),
              style: TextStyle(color: widget.textPrimaryColor, fontSize: 13),
            )
          ],
        ));
  }
}
