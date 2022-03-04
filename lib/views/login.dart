import 'package:flutter/material.dart';
import 'package:ohm_card/models/models.dart';
import 'package:ohm_card/controller/api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool validateUserInput(var value) {
    final regex = RegExp(r'^[a-zA-Z][a-zA-Z]+[0-9]{5}$');

    final match = regex.firstMatch(value);
    if (match != null) {
      print('$value is a correct input');
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  var _logoSection = Padding(
    padding: const EdgeInsets.only(top: 50.0, right: 25, bottom: 50, left: 25),
    child: Center(
      child: Container(
        child: Image.asset('assets/images/ohm_logo.png'),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //OhmLogo
              _logoSection,
              //Textfield Username
              Padding(
                padding:
                    EdgeInsets.only(top: 0.0, right: 25, bottom: 25, left: 25),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username ',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !validateUserInput(value)) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              //Textfield PW
              Padding(
                padding:
                    EdgeInsets.only(top: 0.0, right: 25, bottom: 15, left: 25),
                child: TextFormField(
                  //keyboardType: TextInputType.text,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
              ),
              //Alert PW vergessen
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Servicecenter'),
                      content:
                          const Text('Please contact your admin or IT center!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                  child: Text(
                    'Support',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
              //Login button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var loginRequestModel = new LoginRequestModel(
                        _usernameController.text, _passwordController.text);
                    var api = new Api();
                    if (_formKey.currentState!.validate()) {
                      api.loginUser(loginRequestModel).then((value) {
                        if (value.token.isNotEmpty) {
                          print("Login successful");
                          api.getUserContent(value.token).then((value) {
                            if (value) {
                              Navigator.pushNamed(context, '/page');
                            }
                          });
                        }
                      });
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
