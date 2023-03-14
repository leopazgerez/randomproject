import 'package:flutter/material.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

class CardComponent extends StatelessWidget {
  String? image;
  double? price;
  double? rating;
  CardComponent({Key? key, this.rating, this.price, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _radius = 50;
    Color _fontCOlor = Colors.white;
    return Card(  
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
      color: Colors.black,
      child: SizedBox(
        width: 250,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              module1(_radius),
              const SizedBox(
                height: 10,
              ),
              module2(_fontCOlor),
              module3(_fontCOlor),
            ],
          ),
        ),
      ),
    );
  }

  Widget module3(Color _fontCOlor) {
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  '\$55',
                  style: TextStyle(color: _fontCOlor, fontSize: 35),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                child: Icon(
                  Icons.add_circle_outline,
                  color: _fontCOlor,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget module2(Color _fontCOlor) {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Capuccino',
                style: TextStyle(
                    color: _fontCOlor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'with Oat Milk',
                style: TextStyle(color: _fontCOlor, fontSize: 20),
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
          children: const [
            SizedBox(width: 10,),
            Icon(Icons.star,color: Colors.amber,size: 20,),
            Text('3.4',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

  Widget imageBuild() {
    return Image.network(
        'https://i.pinimg.com/originals/7d/b3/53/7db3539960576e48ee49f7d1534a8d63.jpg',
        fit: BoxFit.fill);
  }
}
