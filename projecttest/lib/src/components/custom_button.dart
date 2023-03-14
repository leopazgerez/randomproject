import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color color;
  final String? urlImage;
  final Icon? icon;
  final double size;
  VoidCallback? onTap;

  CustomButton(
      {super.key,
      required this.color,
      required this.size,
      this.icon,
      this.urlImage,
      this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Widget contenido;
    if (widget.icon != null) {
      contenido = widget.icon!;
    } else if (widget.urlImage != null) {
      contenido = ClipRRect(
          borderRadius: BorderRadius.circular(widget.size / 3),
          child: Image(image: NetworkImage(widget.urlImage!)));
    } else {
      contenido = const Icon(
        Icons.hide_image,
        color: Colors.white,
      );
    }
    return InkWell(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size / 3),
        child: Container(
          padding: EdgeInsets.all(3),
          color: widget.color,
          height: widget.size,
          width: widget.size,
          child: contenido,
        ),
      ),
    );
  }
}
