import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/screens/sign_up.dart';
import 'package:news_app/utility/validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String _userName, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),

            //decoration: BoxDecoration(color: Colors.orangeAccent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!!',
                        style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 45.0,
                            child: TextFormField(

                              validator: (value) {
                                return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!)
                                    ? null
                                    : "Please enter a valid email";
                              },
                              onSaved: (value)=> _userName = value!,

                              style: TextStyle(color: Colors.white),
                              decoration: kTextInputDecoration.copyWith(
                                hintText: 'Email:',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40.0,
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) =>
                              value!.length < 6 ? 'Incorrect password' : null,
                                onSaved: (value)=> _password = value!,
                              style: TextStyle(color: Colors.white),
                              decoration: kTextInputDecoration.copyWith(
                                hintText: 'Password:',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 180.0),
                            child: Text.rich(
                              TextSpan(
                                text: 'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            elevation: 0.0,
                            color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                Row(children: <Widget>[
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 15.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 50,
                                        )),
                                  ),
                                  Text(
                                    "or Sign In with",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 15.0, right: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 50,
                                        )),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/google1.png',
                                      height: 50.0,
                                    ),
                                    Image.asset(
                                      'assets/facebook2.jpg',
                                      height: 35.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignUp()));;
                              },
                              child: Wrap(
                                children: [
                                  Text('Don\'t Have an Account?'),
                                  Text('Sign Up',style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
