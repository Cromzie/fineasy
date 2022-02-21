import 'package:flutter/material.dart';
import '../utilities/colors.dart';
import './texts.dart';


class ItemHeading extends StatelessWidget {
  final String text1;
  final String text2;
  ItemHeading({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TexT(
            text: text1,
            color: kWhite,
            fontsize: 18.0,
          ),
          TexTbutton(
            text: TexT(
              text: text2,
              color: kWhite,
              fontsize: 12.0,
              decor: TextDecoration.underline,
              decorstyle: TextDecorationStyle.dashed,
              decorcolor: kGreen,
            ),
            overlaycolor: kGreen,
          ),
        ],
      );
  }
}