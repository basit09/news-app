import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/providers/auth_provider.dart';
import 'package:news_app/screens/sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  late String _userName, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {

   // AuthProvider auth = Provider.of<AuthProvider>(context);

//===============Sign Up method ==========================================
     doSignUp(){
       print('on register');
       final form = _formkey.currentState;
       if (form!.validate()) {

         form.save();



         //Checking confirm password
         if(_password.endsWith(_confirmPassword)){

           //auth.registeredInStatus
             ;


         }else{
           Flushbar(
             title: 'Mismatch password',
             message: 'Please enter the same password',
             duration: Duration(seconds: 10),
           ).show(context);

         }



       } else {
         Flushbar(
           title: 'Invalid Form',
           message: 'Please complete the form properly',
           duration: Duration(seconds: 10),
         ).show(context);
       }
    }
//====================SCAFFOLD================================
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                // <-- BACKGROUND IMAGE
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
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
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 35.0,
                            child: TextFormField(
                              validator: (value) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value!)
                                    ? null
                                    : "Please enter a valid email";
                              },
                              onSaved: (value) => _userName = value!,
                              controller: _emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: kTextInputDecoration.copyWith(
                                hintText: 'Email:',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Container(
                            height: 35.0,
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) => value!.length < 6
                                  ? 'Please enter password 6 char long'
                                  : null,
                              onSaved: (value) => _password = value!,
                              controller: _passwordController,
                              style: TextStyle(color: Colors.white),
                              decoration: kTextInputDecoration.copyWith(
                                hintText: 'Password:',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Container(
                            height: 35.0,
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) =>
                                  value!.isEmpty ?'Re-enter your password': null,
                              onSaved: (value) => _confirmPassword = value!,
                              controller: _confirmPasswordController,
                              style: TextStyle(color: Colors.white),
                              decoration: kTextInputDecoration.copyWith(
                                hintText: 'Re-enter Password:',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          RaisedButton(
                            onPressed: () {
                              doSignUp();
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
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
                                    "or Sign Up with",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                              child: Wrap(
                                children: [
                                  Text('Have an Account?'),
                                  Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.bold),
                                  )
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
