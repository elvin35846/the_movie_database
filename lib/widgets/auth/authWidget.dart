import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
//import 'lib/theme/appColors.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  AuthWidgetState createState() => AuthWidgetState();
}

class AuthWidgetState extends State<AuthWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/mainScreenWidget');
    } else {
      errorText = "Login or password is incorrect!";
    }
    setState(() {});
  }

  void _resetPassword() {
    print('Reset password');
  }

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xFF01B4E4);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/image/TMD_logo.png',
            fit: BoxFit.contain,
            width: 55,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
                    style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: 'Click here',
                    style: TextStyle(color: mainColor, fontSize: 16, decoration: TextDecoration.none),
                    recognizer: new TapGestureRecognizer()..onTap = () => print('Click here onTap 1'),
                  ),
                  TextSpan(
                    text: ' to get started.',
                    style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: 'If you signed up but didn\'t get your verification email, ',
                    style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: 'click here',
                    style: TextStyle(color: mainColor, fontSize: 16, decoration: TextDecoration.none),
                    recognizer: new TapGestureRecognizer()..onTap = () => print('Click here onTap 2'),
                  ),
                  TextSpan(
                    text: ' to have it resent.',
                    style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            if (errorText != null)
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.red[200],
                    ),
                    child: Text(
                      errorText.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            Text(
              'Username',
            ),
            SizedBox(height: 5),
            TextField(
              controller: _loginTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
                isCollapsed: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Password',
            ),
            SizedBox(height: 5),
            TextField(
              controller: _passwordTextController,
              maxLines: 1,
              onSubmitted: (value) {
                _auth();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
                isCollapsed: true,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                TextButton(
                  onPressed: _auth,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                    backgroundColor: MaterialStateProperty.all(mainColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                  ),
                  child: Text('Login'),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: _resetPassword,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                    foregroundColor: MaterialStateProperty.all(mainColor),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
                  ),
                  child: Text('Reset password'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
