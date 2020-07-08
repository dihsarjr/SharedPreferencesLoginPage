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
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                validator: (val) => !val.contains('@') ? 'Invalid Email' : null,
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                validator: (val) =>
                    val.length < 6 ? 'Password too short' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
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
              Center(
                  child: Text(
                'Don\'t have an account? Sign Up ',
                style: TextStyle(
                  fontSize: 15,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
