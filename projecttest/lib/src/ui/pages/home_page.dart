import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_button.dart';
import 'package:projecttest/src/components/custom_card.dart';
import 'package:projecttest/src/models/breakfast_model.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BreakfastModel product = BreakfastModel(
        title: "Capuccino",
        subtitle: "With oat milk",
        photo:
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        description:
            " aaaaaaaaaaaaa aaaaaaa defefew efwefewfew efewefwee eegre",
        rating: 4.5);
    ItemBreakfastModel example =
        ItemBreakfastModel(product: product, price: 4.20);

    List<ItemBreakfastModel> items = [
      example,
      example,
      example,
      example,
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        CustomButton(
          onTap: () {
            print("siiiii");
          },
          color: Colors.green,
          size: 80,
          //icon: const Icon(
          // Icons.favorite,
          //color: Colors.black,
          // size: 40,
          // ),
          urlImage:
              "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 20,
                    ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(items[index]);
                })),
      ]),
    );
  }
}
