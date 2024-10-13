import 'package:ambassador_app/utils/functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'firebase_options.dart';
late FirebaseApp firebaseApp;
fb.User? fbAuthedUser;
void main() async {
  pp('$mmx ... starting ....');
  WidgetsFlutterBinding.ensureInitialized();
  pp('\n\n$mmx DefaultFirebaseOptions.currentPlatform: '
      '\n\n${DefaultFirebaseOptions.currentPlatform.toString()}\n\n');
  //
  pp('$mmx ... Firebase.initializeApp starting ....');
  firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  pp('$mmx'
      ' Firebase App has been initialized: 🅿️${firebaseApp.name}, checking for authed current user\n');

  fbAuthedUser = fb.FirebaseAuth.instance.currentUser;
  if (fbAuthedUser != null) {
    //TODO: REMOVE after test ....
    pp('$mmx fbAuthUser: ${fbAuthedUser!.uid}');
    pp("$mmx .... fbAuthUser is cool! ......  🥬🥬🥬 on to the party!! \n ${await fbAuthedUser?.getIdToken()}");
  } else {
  pp('$mmx fbAuthUser: is null.  😈👿 Need to sign up or in. Authenticate the app!');
  }
  runApp(const MyApp());
}

const mmx = '🐉🐉🐉 Ambassador App 🐉🐉🐉';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambassador',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ambassador App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
