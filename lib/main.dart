import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailController = null;
  final TextEditingController passwordController = null;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  void _submit() {
    setState(() {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        print(emailController);
        print(passwordController);

        if (_email != null && _password != null) {
          print('object');
        }
      }
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
                  decoration: new InputDecoration(labelText: "Email"),
                  validator: (String val) =>
                      !val.contains('@') && !val.contains('.')
                          ? 'Invalid Email'
                          : null,
                  onSaved: (String val) => _email = val,
                  controller: emailController,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short' : null,
                  onSaved: (val) => _password = val,
                  controller: passwordController,
                  obscureText: true,
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
                        child: _email != null
                            ? Icon(
                                Icons.refresh,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
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
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
