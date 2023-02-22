import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class MyButton extends StatelessWidget {
final String title;
final Color color;
final VoidCallback onPress;
  const MyButton({Key? key,
    required this.title,
    this.color = Colors.grey,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(pi / 6),
                  alignment: FractionalOffset.center,
                  child: CircleAvatar(
                    radius: 35,
                    child: Center(
                      child: Text(title, style: textHeadingStyle),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}