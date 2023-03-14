import 'package:flutter/material.dart';
import 'package:projecttest/src/components/custom_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomButton(
          onTap: () {
            print("siiiiiii al fiiiiin");
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
      ),
    );
  }
}
