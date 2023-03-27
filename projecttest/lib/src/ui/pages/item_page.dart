import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projecttest/src/enums/ingredient_enum.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class ItemPage extends StatefulWidget {
  ItemBreakfastModel item;

  ItemPage(this.item, {super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends StateMVC<ItemPage> {
  String sizeS = "S";
  String sizeM = "M";
  String sizeL = "L";
  late String sizeSelect;
  late bool stateWidget = false;
  Map<IconData, Ingredients> ingredientIcon = {
    Icons.coffee: Ingredients.Cafe,
    Icons.local_drink: Ingredients.Leche,
    Icons.water_drop: Ingredients.Agua,
    Icons.backup_table: Ingredients.Chocolate,
  };

  @override
  void initState() {
    sizeSelect = sizeS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff0e1318),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.item.product!.photo))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [cardOpacity()],
                  ),
                ),
              ),
            ),
            descriptionContainer(),
            Padding(padding: EdgeInsets.only(bottom: 25), child: selectSize()),
            priceCard(),
          ],
        ),
      ),
    );
  }

  Widget cardOpacity() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.185,
          padding: const EdgeInsets.all(20),
          color: const Color(0xff0e1318).withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(flex: 4, child: titleAndSubtile()),
                Expanded(flex: 2, child: featuresProduct()),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 4, child: raiting()),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xff312b2c),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            widget.item.product!.features,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget titleAndSubtile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.item.product!.title.name,
          style: const TextStyle(color: Colors.white, fontSize: 35),
        ),
        Text(
          widget.item.product!.subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 30),
        ),
      ],
    );
  }

  Widget raiting() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        Text(
          widget.item.product!.rating.toStringAsFixed(1),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          "  (${widget.item.product!.likes})",
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        )
      ],
    );
  }

  Widget featuresProduct() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ingredientItem(widget.item.product!.ingredient1),
          ingredientItem(widget.item.product!.ingredient2),
        ]),
      ],
    );
  }

  Widget ingredientItem(Ingredients ingredient) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff312b2c),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            ingredientIcon.keys
                .firstWhere((element) => ingredientIcon[element] == ingredient),
            color: const Color(0xffcf7842),
            size: 15,
          ),
          Text(
            ingredient.name,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget descriptionContainer() {
    String firstPart = widget.item.product!.description.length > 96
        ? widget.item.product!.description.substring(1, 96)
        : widget.item.product!.description;
    String secondPart = widget.item.product!.description.length > 96
        ? widget.item.product!.description
            .substring(97, widget.item.product!.description.length)
        : "";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Descripción",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: firstPart,
                style: const TextStyle(
                    height: 1.8, fontSize: 15, color: Colors.white),
              ),
              TextSpan(
                text: stateWidget ? secondPart : "",
                style: const TextStyle(
                    height: 1.8, fontSize: 15, color: Colors.white),
              ),
              secondPart != ""
                  ? TextSpan(
                      text: stateWidget ? " Ver Menos" : "...Ver más",
                      style: const TextStyle(
                        color: Color(0xffcf7842),
                        fontSize: 15,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            stateWidget = !stateWidget;
                          });
                        })
                  : const TextSpan(text: ""),
            ]),
          ),
        ],
      ),
    );
  }

  Widget selectSize() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Size",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
      SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              celdSize(sizeS),
              celdSize(sizeM),
              celdSize(sizeL),
            ],
          )),
    ]);
  }

  Widget celdSize(String size) {
    return InkWell(
      onTap: () {
        setState(() {
          sizeSelect = size;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: size == sizeSelect
                ? Colors.transparent
                : const Color(0xff312b2c),
            border: Border.all(
              color: size == sizeSelect
                  ? const Color(0xffcf7842)
                  : const Color(0xff312b2c),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                fontSize: 20,
                color:
                    size == sizeSelect ? const Color(0xffcf7842) : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget priceCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Price",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            price(),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffcf7842),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Text("Buy Now", style: TextStyle(fontSize: 20)),
              )),
        )
      ]),
    );
  }

  Widget price() {
    return Row(
      children: [
        const Icon(
          Icons.attach_money,
          color: Color(0xffcf7842),
          size: 25,
        ),
        Text(
          widget.item.price!.toStringAsFixed(2),
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ],
    );
  }
}
