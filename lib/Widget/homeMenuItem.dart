import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMenuItem extends StatelessWidget {
  final String routeName;
  final String imagePath;
  final String text;
  final bool isSvg;

  const CustomMenuItem({
    required this.routeName,
    required this.imagePath,
    required this.text,
    this.isSvg = false, // default value is false for PNG
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: isSvg ? SvgPicture.asset(imagePath) : Image.asset(imagePath),
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(text),
      ],
    );
  }
}
