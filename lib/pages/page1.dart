import 'package:fineasy/pages/page2.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart';
import '../widgets/texts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FineEasy',
        home: Scaffold(
          backgroundColor: kGold,
          resizeToAvoidBottomInset: true,
          body:
              // Page2Login()
              Page1(),
        ));
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _keY = GlobalKey<FormState>();
  bool isNotVisible = true;
  String ? _email = '';
  String _password = '';

//  eMAIL => _email;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(color: kWhite),
      child: Stack(
        children: [
          _welcomeImage(),
          _welcomeText(),
          _welcomeWhiteContainer(),
        ],
      ),
    );
  }

  _welcomeImage() => Positioned(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage('assets/images/stephen.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
      );

  _welcomeText() => Positioned(
        top: MediaQuery.of(context).size.height / 4,
        left: 0,
        right: 0,
        child: Column(
          children: [
            TexT(
              text: 'finEasy',
              fontsize: 24.0,
              color: kGreen,
              fontfamily: 'Super',
            ),
            SizedBox(
              height: 10.0,
            ),
            TexT(
                text: 'WELCOME',
                fontfamily: 'Shizuru',
                fontsize: 30.0,
                color: kGreen),
          ],
        ),
      );
  _welcomeWhiteContainer() => Positioned(
      top: MediaQuery.of(context).size.height / 2.15,
      height: MediaQuery.of(context).size.height / 1.85,
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Form(
            child: _welcomeField(),
            key: _keY,
          )));

  _welcomeField() => ListView(
        padding: EdgeInsets.only(top: 40.0),
        children: [
          _emailFormField(),
          SizedBox(
            height: 20.0,
          ),
          _passwordFormField(),
          SizedBox(
            height: 40.0,
          ),
          _forgotPassword(),
          SizedBox(
            height: 4.0,
          ),
          _logIn()
        ],
      );

  _emailFormField() => Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextFormField(
          onSaved: (String ? email) => _email = email,
          autofillHints: [AutofillHints.email],
          validator: (String? email) =>
              email != null && email.contains('@gmail.com')
                  ? 'Enter a valid email address without @gmail.com'
                  : email == null
                      ? 'You are yet to enter your email'
                      : null,
          style: TextStyle(color: kLabelColor, fontFamily: 'Super'),
          keyboardType: TextInputType.emailAddress,
          cursorColor: kGold,
          decoration: InputDecoration(
              filled: true,
              fillColor: kFillColor.withOpacity(0.2),
              labelText: 'Email',
              labelStyle: TextStyle(color: kLabelColor, fontFamily: 'Super'),
              suffixText: '@gmail.com',
              suffixStyle: TextStyle(color: kLabelColor, fontFamily: 'Super'),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide.none)),
        ),
      );

  _passwordFormField() => Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextFormField(
          onSaved: (String? password) => password = _password,
          validator: (String? password) =>
              password == null && password!.length < 6
                  ? 'Incorrect password'
                  : null,
          style: TextStyle(color: kLabelColor, fontFamily: 'Super'),
          keyboardType: TextInputType.visiblePassword,
          cursorColor: kGold,
          obscureText: isNotVisible,
          obscuringCharacter: '~',
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isNotVisible = !isNotVisible;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: kLabelColor.withOpacity(0.4),
                  )),
              filled: true,
              fillColor: Color(0xFFE7C3A1).withOpacity(0.2),
              labelText: 'Password',
              labelStyle: TextStyle(color: kLabelColor, fontFamily: 'Super'),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide.none)),
        ),
      );

  _forgotPassword() => GestureDetector(
        child: Center(
            child: TexTbutton(
          text: TexT(
            text: 'FORGOT PASSWORD',
            fontsize: 18.0,
            color: kBrown,
          ),
          overlaycolor: Color(0xFFE7C3A1).withOpacity(0.2),
        )),
      );

  _logIn() => Center(
          child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              decoration: BoxDecoration(
                  color: kBrown, borderRadius: BorderRadius.circular(20.0)),
              width: MediaQuery.of(context).size.width - 80,
              height: 50.0,
              child: TextButton(
                onPressed: () {
                  if (_keY.currentState!.validate()) {
                    // return;
                    _keY.currentState!.save();
                    print('Here: $_email');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page2Login(eMAIL: '$_email'),
                        ));
                  } else {
                    return null;
                  }
                },
                child: TexT(
                  text: 'LOG IN',
                  fontsize: 18.0,
                  color: kGreen,
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                  Color(0xFFE7C3A1).withOpacity(0.2),
                )),
              )),
          SizedBox(
            height: 10.0,
          ),
          // TextButton(
          //     onPressed: () {},
          //     child: TexTrich(
          //       text1: 'Don\'t have an account yet?  ',
          //       style1: TextStyle(
          //           color: kLabelColor, fontFamily: 'Super', fontSize: 10.0),
          //       text2: 'Register',
          //       style2: TextStyle(color: kGreen, fontFamily: 'Super'),
          //     ))
        ],
      ));

  // _login() {
  //   final form = _keY.currentState!;
  //   if (form.validate()) {
  //     form.save();
  //     print('Valid email $_email');
  //   } else {
  //     print('Invalid email');
  //   }
  // }
}
