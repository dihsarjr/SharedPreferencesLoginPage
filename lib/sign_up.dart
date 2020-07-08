import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKeySignUp = GlobalKey<FormState>();

  String _firstName;
  String _lastName;
  String _mail;
  String _password;

  void _submit() {
    setState(() {
      if (formKeySignUp.currentState.validate()) {
        formKeySignUp.currentState.save();
        print(emailController);
        print(passwordController);

        addStringToSF();
      }
    });
  }

  addStringToSF() async {
    String names = nameController.toString();
    String lastName = lastNameController.toString();
    String email = emailController.toString();
    String password = passwordController.toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', names);
    prefs.setString('lastName', lastName);
    prefs.setString('email', email);
    prefs.setString('password', password);

    print(names);
    print(lastName);

    print(email);

    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeySignUp,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "First Name"),
                    validator: (val) =>
                        val.length < 2 ? 'Need Minimum 2 Characters' : null,
                    onSaved: (val) => _firstName = val,
                    controller: nameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Last Name"),
                    validator: (val) =>
                        val.length < 2 ? 'Need Minimum 2 Characters' : null,
                    onSaved: (val) => _lastName = val,
                    controller: lastNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (val) => !val.contains('@') && !val.contains('.')
                        ? 'Invalid Email'
                        : null,
                    onSaved: (val) => _mail = val,
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (val) =>
                        val.length < 6 ? 'Password too short' : null,
                    onSaved: (val) => _password = val,
                    controller: passwordController,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
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
                          'Register',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
