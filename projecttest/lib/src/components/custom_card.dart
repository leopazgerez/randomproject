import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_button.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class CustomCard extends StatefulWidget {
  final ItemBreakfastModel item;
  double height;

  CustomCard(this.item, {this.height = 282, super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Color(0xff312b2c), Color(0xff0e1318)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp)),
          width: MediaQuery.of(context).size.width / 2,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [photo(), titleAndSubtitle(), price()]),
              Align(alignment: Alignment.topRight, child: raiting())
            ]),
          ),
        ));
  }

  Widget photo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image(
        image: NetworkImage(widget.item.product!.photo),
      ),
    );
  }

  Widget titleAndSubtitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(widget.item.product!.title,
                style: const TextStyle(fontSize: 20)),
          ),
          Text(
            widget.item.product!.subtitle,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget price() {
    return Row(
      children: [
        const Icon(
          Icons.attach_money,
          color: Color(0xffcf7842),
          size: 20,
        ),
        Text(
          widget.item.price!.toStringAsFixed(2),
          style: const TextStyle(fontSize: 20),
        ),
        const Expanded(child: SizedBox.shrink()),
        CustomButton(
          color: Color(0xffcf7842),
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
        width: 50,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: const Color(0xff0e1318).withOpacity(0.5),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(30)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 6, right: 3),
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 12,
              ),
            ),
            Text(
              widget.item.product!.rating.toStringAsFixed(1),
              style: const TextStyle(fontSize: 15),
            )
          ],
        ));
  }
}
