import 'package:flutter/material.dart';
import 'package:ohm_card/models/models.dart';
import 'package:ohm_card/service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences pref;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //OhmLogo
            _logoSection,
            //Textfield Username
            Padding(
              padding: EdgeInsets.only(
                top: 0.0,
                right: 25,
                bottom: 25,
                left: 25,
              ),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username ',
                ),
                keyboardType: TextInputType.text,
                //onSaved: (value) => loginRequestModel.username = value!,
                validator: (value) =>
                    (value!.isEmpty) ? "Please enter your username" : null,
              ),
            ),
            //Textfield PW
            Padding(
              padding:
                  EdgeInsets.only(top: 0.0, right: 25, bottom: 15, left: 25),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                //onSaved: (value) => loginRequestModel.userpassword = value!,
                validator: (value) =>
                    (value!.isEmpty) ? "Please enter your password" : null,
              ),
            ),
            //Alert PW vergessen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Congratz'),
                    content: const Text(
                        'Please contact your admin or the IT center!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: Text(
                  'Forgot Password',
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
                  api.loginUser(loginRequestModel).then((value) {
                    if (value.token.isNotEmpty) {
                      print("Login successful");
                      // _setStringValue("token", value.token);
                      // _setStringValue("username", value.username);
                      // _setStringValue("firstname", value.firstname);
                      // _setStringValue("surname", value.surname);
                      // _setStringValue("birthday", value.birthday);
                      // _setStringValue("email", value.email);
                      Navigator.pushNamed(context, '/page');
                    }
                  });
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _setStringValue(String key, String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }

  // FutureBuilder<User> buildFutureBuilder() {
  //   return FutureBuilder<User>(
  //     future: _futureUser,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data!.username);
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }

}
