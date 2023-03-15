import 'package:flutter/material.dart';

class GridCards extends StatelessWidget {
  final List<String>? cards;
  const GridCards({Key? key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 400,
        padding: const EdgeInsets.all(20),
        child: cards != null
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: cards!.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        )),
                    child: Text(
                      cards![index],
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              )
            : const Center(child: Text("Sin tarjetas")),
      ),
    );
  }
}
