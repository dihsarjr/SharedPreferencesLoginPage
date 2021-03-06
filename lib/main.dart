import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _mail;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _mail = (prefs.getString('email') ?? '');

      print(_mail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _mail == '' ? MyHomePage() : HomePageOne(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _mail = '';
  String _pass = '';
  String emailCont = '';
  String passCont = '';
  String passError = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    setState(() {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        emailCont = emailController.text;
        passCont = passwordController.text;

        _loadCounter();

        print(emailCont);
        print(passCont);
        print(_mail);
        print(_pass);
        if (emailCont == _mail && passCont == _pass) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePageOne()));
        } else {
          passError = 'invalid email and password';
        }
      } else {
        passError = 'invalid email and password';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _mail = (prefs.getString('email') ?? '');
      _pass = (prefs.getString('password') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 150,
                ),
                Text(
                  'Welcome,',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Sign In to continue',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (String val) =>
                      !val.contains('@') && !val.contains('.')
                          ? 'Invalid Email'
                          : null,
                  onSaved: (String val) => _email = val,
                  controller: emailController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short' : null,
                  onSaved: (val) => _password = val,
                  controller: passwordController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    onPressed: _submit,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      color: Colors.black87,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                      child: emailCont != _mail &&
                              passCont != _pass &&
                              _email == null
                          ? Text(
                              passError,
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            )
                          : Container()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
