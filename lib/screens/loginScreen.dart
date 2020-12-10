import 'package:flutter/material.dart';
import 'package:itravel/screens/HomeScreen.dart';
import 'package:itravel/screens/SignUpScreen.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _rememberMe = false;
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
                  vertical: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30.0),
                    _EmailWidget(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _PassWidget(),

                    //forgot password
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () =>
                            print('Forgot Password Button Pressed'),
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          'Forgot Password?',
                        ),
                      ),
                    ),

                    //Remember me
                    Container(
                      child: Row(
                        children: [
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: _rememberMe,
                              checkColor: Colors.green,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                            ),
                          ),
                          Text('Remember me')
                        ],
                      ),
                    ),

                    //Login Button
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
                          'Login',
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
                    _buildSocialBtnRow(),
                    //Sign up Button
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen()))
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: 'Sign Up ',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                      ),
                    )

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
                color: Theme.of(context).iconTheme.color,
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
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
              enabledBorder: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).iconTheme.color,
              ),
              hintText: '********',
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).textTheme.bodyText1.color,
              offset: Offset(0, 2),
              blurRadius: 2.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
