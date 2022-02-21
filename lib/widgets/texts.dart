import 'package:flutter/material.dart';

class TexT extends StatefulWidget {
  final String text;
  final String fontfamily;
  final double? fontsize;
  final Color? color;
  final FontWeight? fontweight;
  final TextDecoration? decor;
  final TextDecorationStyle? decorstyle;
  final Color? decorcolor;

  TexT(
      {required this.text,
      this.fontfamily = 'Open Sans',
      this.fontsize,
      this.color,
      this.fontweight,
      this.decor, this.decorcolor, this.decorstyle});

  @override
  _TexTState createState() => _TexTState();
}

class _TexTState extends State<TexT> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color,
          fontFamily: widget.fontfamily,
          fontSize: widget.fontsize,
          decoration: widget.decor,
          decorationStyle: widget.decorstyle,
          decorationColor: widget.decorcolor),
    );
  }
}

class TexTrich extends StatelessWidget {
  final String text1;
  final TextStyle? style1;
  final String text2;
  final TextStyle? style2;

  TexTrich(
      {required this.text1, this.style1, this.style2, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: text1, style: style1, children: [
        TextSpan(
          text: text2,
          style: style2,
        ),
      ]),
    ]));
  }
}

class TexTbutton extends StatelessWidget {
  final Function? press;
  final Color? overlaycolor;
  final Widget text;

  TexTbutton({this.press, this.overlaycolor, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(overlaycolor),
        ),
        child: text);
  }
}
