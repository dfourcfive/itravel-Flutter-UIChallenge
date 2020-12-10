import 'package:flutter/material.dart';
import 'package:itravel/Utilites/constants.dart';
import 'package:itravel/screens/HomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _FullNameWidget(),
                    SizedBox(height: 10.0),
                    _EmailWidget(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _PassWidget(),

                    //registre Button
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: 200.0,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () => {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()))
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: Theme.of(context).backgroundColor,
                        child: Text(
                          'Registre',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              letterSpacing: 0.5,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                    //Sign up Button

                    //
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _FullNameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          //style
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
              enabledBorder: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
              hintText: 'Entre Full Name',
            ),
          ),
        )
      ],
    );
  }

  Widget _EmailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          //style
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
              enabledBorder: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
              hintText: 'Entre your email',
            ),
          ),
        )
      ],
    );
  }

  Widget _PassWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          //style
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: ,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
              enabledBorder: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
              hintText: 'Entre your Password',
            ),
          ),
        )
      ],
    );
  }
}
