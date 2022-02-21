import 'package:flutter/material.dart';
import '../utilities/colors.dart';

class ButtonContainer extends StatelessWidget {
  final IconData hh;
  ButtonContainer({required this.hh});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(color: kWhite, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            hh,
            color: kGreen,
          ),
        ));
  }
}
