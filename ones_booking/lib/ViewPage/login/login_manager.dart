import 'package:flutter/material.dart';

class LoginManager extends StatefulWidget {
  const LoginManager({Key? key}) : super(key: key);

  @override
  _LoginManagerState createState() => _LoginManagerState();
}

class _LoginManagerState extends State<LoginManager> {
  bool _obscureText = true;
  final _formId = GlobalKey<FormState>();
  final TextEditingController _textAccount = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void Login() {}

  Widget _nameUser() {
    return Column(
      children: [
        TextFormField(
          controller: _textAccount,
          decoration: const InputDecoration(
              hintText: 'Account Name',
              prefixIcon: Icon(
                Icons.perm_identity_outlined,
                color: Colors.black87,
              )),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return ' Please enter some text';
            }
          },
        ),
      ],
    );
  }

  Widget _passWord() {
    return Column(
      children: [
        TextFormField(
          controller: _textPassword,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.black87,
            ),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black87,
              ),
              onPressed: () {
                _toggle();
              },
            ),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return ' Please enter some text';
            }
          },
          obscureText: _obscureText,
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: 180,
      child: ElevatedButton(
        onPressed: () {
          if (_formId.currentState!.validate()) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('User Or Password False!'),
              backgroundColor: Colors.deepOrangeAccent,
            ));
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'openSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formId,
        child: Column(
          children: [
            _nameUser(),
            const SizedBox(
              height: 30,
            ),
            _passWord(),
            const SizedBox(
              height: 50,
            ),
            _buttonLogin(),
          ],
        ));
  }
}
