import 'package:fineasy/pages/page1.dart';
import 'package:fineasy/widgets/itemheading.dart';
import 'package:fineasy/widgets/mycards.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart';
import '../widgets/texts.dart';
import '../widgets/buttoncontainer.dart';

class Page2Login extends StatefulWidget {
  final String eMAIL;
  Page2Login({required this.eMAIL});

 get emaill => eMAIL;
  @override
  _Page2LoginState createState() => _Page2LoginState();
}

class _Page2LoginState extends State<Page2Login> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    _item() => Positioned(
        top: 130.0,
        child: Container(
          width: w,
          height: h,
          child: _itemContainer(),
          decoration: BoxDecoration(
              color: kBlack87,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              )),
        ));

    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kLabelColor,
          bottomNavigationBar: SizedBox(
            height: h / 8.5,
            child: BottomNavigationBar(
                currentIndex: index,
                onTap: (indexed) => setState(() {
                      index = indexed;
                    }),
                unselectedItemColor: kWhite,
                unselectedFontSize: 10.0,
                selectedFontSize: 12.0,
                selectedIconTheme: IconThemeData(size: 12.0),
                unselectedIconTheme: IconThemeData(size: 10.0),
                selectedItemColor: kGreen,
                backgroundColor: kBlack87,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        icon: Icon(Icons.favorite_border)),
                    label: 'Favorites ',
                  ),
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.folder_open)),
                      label: 'Cards'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.card_travel_outlined)),
                      label: 'Transactions'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person_outline_rounded)),
                      label: 'Profile')
                ]),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: h,
              width: w,
              child: Stack(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  _listtile(),
                  _balance(),
                  _item(),
                  Positioned(
                    top: 280.0,
                    child: Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      decoration: BoxDecoration(
                          color: kBlack87.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width - 30,
                      child: _firstSingleChildViewContainer(),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: 290.0 + MediaQuery.of(context).size.height / 4.5,
                          left: 15.0,
                          right: 15.0),
                      child: ItemHeading(
                          text1: 'Recent Transactions', text2: 'View All')),
                  Positioned(
                      top: 320 + MediaQuery.of(context).size.height / 4.5,
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                            color: kBlack87.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width - 30,
                        child: _secondSingleChildViewContainer(),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _listtile() => ListTile(
        title: TexT(
          text: 'Hi!',
          color: Colors.white60,
          fontsize: 18.0,
          fontfamily: 'Roboto',
        ),
        subtitle: TexT(
          text: '${widget.emaill}',
          color: Colors.white60,
          fontweight: FontWeight.bold,
          fontsize: 22.0,
          fontfamily: 'Roboto',
        ),
        trailing: CircleAvatar(
            backgroundImage: AssetImage('assets/images/babe2.jpg')),
      );

  _balance() => Positioned(
        top: 70.0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            TexT(
              text: '   \$89,805,002.00',
              color: kWhite,
              fontsize: 24.0,
            ),
            TexT(
              text: 'Available Balance',
              color: Colors.white60,
            )
          ],
        ),
      );

  _itemContainer() => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                _itemContainerRow1(),
                SizedBox(
                  height: 10.0,
                ),
                _itemContainerRow2(),
                SizedBox(
                  height: 15.0,
                ),
                _itemContainerRow3(),
              ],
            ),
          )
        ],
      );

  _itemContainerRow1() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonContainer(hh: Icons.transform_outlined),
          ButtonContainer(hh: Icons.payment_outlined),
          ButtonContainer(hh: Icons.phone_android_rounded),
          ButtonContainer(hh: Icons.more_horiz)
        ],
      );

  _itemContainerRow2() => Container(
        margin: EdgeInsets.only(right: 20.0, left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ));
                },
                child: TexT(
                  text: 'Transfer',
                  color: kWhite,
                  fontfamily: 'Super',
                ),
              ),
            ),
            TexT(
              text: 'Bills',
              color: kWhite,
              fontfamily: 'Super',
            ),
            TexT(
              text: 'Recharge',
              color: kWhite,
              fontfamily: 'Super',
            ),
            TexT(
              text: 'More',
              color: kWhite,
              fontfamily: 'Super',
            ),
          ],
        ),
      );

  _itemContainerRow3() => ItemHeading(text1: 'My Cards', text2: 'View All');

  _firstSingleChildViewContainer() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MyCards(
              imagE: 'assets/images/visa.png',
              firsttexT1: TexT(
                text: 'Visa Card',
                color: kWhite,
              ),
              firsttexT2: TexT(text: '**5674', color: kWhite.withOpacity(0.3)),
              secondtexT1: TexT(
                text: '\$10,200',
                color: kWhite,
              ),
              secondtexT2: TexT(
                text: '02/19',
                color: kWhite.withOpacity(0.3),
              ),
            ),
            Divider(
              color: kGreen,
              height: 0.0,
            ),
            MyCards(
                imagE: 'assets/images/mastercard.png',
                firsttexT1: TexT(
                  text: 'Master Card',
                  color: kWhite,
                ),
                firsttexT2:
                    TexT(text: '**9369', color: kWhite.withOpacity(0.3)),
                secondtexT1: TexT(
                  text: '\$1,080',
                  color: kWhite,
                ),
                secondtexT2:
                    TexT(text: '02/18', color: kWhite.withOpacity(0.3))),
            Divider(
              color: kGreen,
              height: 0.0,
            ),
            MyCards(
                imagE: 'assets/images/mastercard.png',
                firsttexT1: TexT(
                  text: 'Master Card',
                  color: kWhite,
                ),
                firsttexT2:
                    TexT(text: '**9369', color: kWhite.withOpacity(0.3)),
                secondtexT1: TexT(
                  text: '\$1,080',
                  color: kWhite,
                ),
                secondtexT2:
                    TexT(text: '02/18', color: kWhite.withOpacity(0.3))),
            Divider(
              color: kGreen,
              height: 0.0,
            ),
            MyCards(
              imagE: 'assets/images/visa.png',
              firsttexT1: TexT(
                text: 'Visa Card',
                color: kWhite,
              ),
              firsttexT2: TexT(text: '**5674', color: kWhite.withOpacity(0.3)),
              secondtexT1: TexT(
                text: '\$10,200',
                color: kWhite,
              ),
              secondtexT2: TexT(
                text: '02/19',
                color: kWhite.withOpacity(0.3),
              ),
            ),
          ],
        ),
      );

  _secondSingleChildViewContainer() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MyMiniCards(
              imagE: 'assets/images/grocery.jpg',
              firsttexT: TexT(
                text: 'Grocery',
                color: kWhite,
              ),
              secondtexT: TexT(
                text: '-\$1,200',
                color: kWhite,
              ),
            ),
            Divider(
              color: kGreen,
              height: 0.0,
            ),
            MyMiniCards(
              imagE: 'assets/images/utility.jpg',
              firsttexT: TexT(
                text: 'Utility Bills',
                color: kWhite,
              ),
              secondtexT: TexT(
                text: '-\$2,800',
                color: kWhite,
              ),
            ),
            Divider(
              color: kGreen,
              height: 0.0,
            ),
            MyMiniCards(
              imagE: 'assets/images/housing.jpg',
              firsttexT: TexT(
                text: 'Housing',
                color: kWhite,
              ),
              secondtexT: TexT(
                text: '-\$1,750',
                color: kWhite,
              ),
            )
          ],
        ),
      );
}
