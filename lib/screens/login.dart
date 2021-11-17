import 'package:flutter/material.dart';
import 'package:ohm_card/models/api_error.dart';
import 'package:ohm_card/models/api_response.dart';
import 'package:ohm_card/models/user.dart';
import 'package:ohm_card/service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    //futureUser = loginUser(_usernameController.text, _passwordController.text);
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
                onPressed: () {
                  futureUser = loginUser(
                      _usernameController.text, _passwordController.text);
                  //print(futureUser);
                  Navigator.pushNamed(context, '/page');
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void _saveAndRedirectToHome() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("username", (_apiResponse.data as User).username);
//     Navigator.pushNamedAndRemoveUntil(
//         context, '/page', ModalRoute.withName('/page'),
//         arguments: (_apiResponse.data as User));
//   }

// if (_formKey.currentState!.validate()) {
//                     setState(() {
//                       _futureUser = loginUser(
//                           _usernameController.text, _passwordController.text);
//                       Navigator.pushNamed(context, '/page');
//                     });

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

    // Future<User> _loginHandler() async {
    //   var user =
    //       await loginUser(_usernameController.text, _passwordController.text);
    //   return user;
    // }
//   }
// }
