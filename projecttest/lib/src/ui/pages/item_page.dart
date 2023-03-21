import 'package:flutter/material.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class ItemPage extends StatefulWidget {
  ItemBreakfastModel item;

  ItemPage(this.item, {super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String sizeS = "S";
  String sizeM = "M";
  String sizeL = "L";
  late List<String> sizes = [sizeS, sizeM, sizeL];
  late String sizeSelect;

  @override
  void initState() {
    sizeSelect = sizeS;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image(
                image: NetworkImage(widget.item.product!.photo),
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Expanded(
                  child: Container(
                color: Colors.red,
              ))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                color: Colors.amber.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Color(0xff0e1318),
                      child: Column(
                        children: [
                          // cardOpacity(),
                          // descriptionContainer(),
                          selectSize(),
                          priceCard(),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget selectSize() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Size",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              return celdSize(sizes[index]);
            },
          ),
        )
      ]),
    );
  }

  Widget celdSize(String size) {
    return InkWell(
      onTap: () {
        setState(() {
          sizeSelect = size;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.decelerate,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: size == sizeSelect ? Colors.transparent : Color(0xff312b2c),
            border: Border.all(
              color: size == sizeSelect ? Color(0xffcf7842) : Color(0xff312b2c),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                color: size == sizeSelect ? Color(0xffcf7842) : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget priceCard() {
    return Container(
      padding: EdgeInsets.all(10),
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
