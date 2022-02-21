import 'package:flutter/material.dart';
import '../utilities/colors.dart';


class MyCards extends StatelessWidget {
    final String imagE;
  final Widget firsttexT1;
  final Widget  firsttexT2;
  final Widget  secondtexT1;
  final Widget  secondtexT2;

  MyCards({required this.imagE, required this.firsttexT1, required this.firsttexT2, required this.secondtexT1, required this.secondtexT2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: kWhite,
                  maxRadius: 25.0,
                  child: ClipOval(
                      child: Image(
                    image: AssetImage(imagE),
                  ))),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  firsttexT1,
                  firsttexT2,
                ],
              ),
            ],
          ),
          Column(
            children: [
              secondtexT1,
              secondtexT2
            ],
          ),
        ],
      ),
    );
  }
}

class MyMiniCards extends StatelessWidget {
    final String imagE;
  final Widget firsttexT;
  final Widget  secondtexT;

  MyMiniCards({required this.imagE, required this.firsttexT, required this.secondtexT,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:15.0, vertical: 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 25.0,
                  backgroundImage: AssetImage(imagE),),
              SizedBox(
                width: 10.0,
              ),
              firsttexT,  
            ],
          ),
          secondtexT    
        ],
      ),
    );
  }
}
