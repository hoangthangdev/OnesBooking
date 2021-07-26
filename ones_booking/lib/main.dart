import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/ViewPage/login/login_manager.dart';
import 'package:ones_booking/ViewPage/CreateNewAccount/new_account_manager.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    initialRoute: '/',
    routes: <String, WidgetBuilder>{},
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ones Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const HomeNewAccount(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/vietnam.png'),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/golf-logo.png",
                          cacheHeight: 100,
                          cacheWidth: 100,
                        ),
                        const Text(
                          "OneS-Golf Booking",
                          style: TextStyle(
                              height: 2,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const LoginManager(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/second'),
                style: ElevatedButton.styleFrom(primary: Colors.white60),
                child: const Text(
                  'Create account',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                    fontFamily: 'openSans',
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => print('Forgot Password?'),
                style: ElevatedButton.styleFrom(primary: Colors.white60),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                    fontFamily: 'openSans',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
