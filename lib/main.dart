// first page (login page)
import 'package:flutter/material.dart';
import './second_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Librewery',
      theme: ThemeData(
        fontFamily: 'Schyler',
      ),
      home: const MyHomePage(title: 'Welcome to Librewery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String password = '';
  bool isPasswordVisible = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(
                  usernameHolder: usernameController.text,
                  passwordHolder: passwordController.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.pink,
                  Colors.blue,
                  Colors.deepPurple,
                ]),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                // login container
                child: Container(
                  height: 50.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.deepPurple.shade200,
                            Colors.pink.shade200,
                            Colors.deepPurple.shade200,
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                // login card username and password
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 300,
                  width: 350,
                  child: Card(
                    // username and password card login
                    shadowColor: Colors.deepPurple.shade600,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            // username
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: usernameController,
                              style: const TextStyle(color: Colors.black87),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                fillColor: Colors.white,
                                prefixIcon:
                                    const Icon(Icons.account_circle_rounded),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple, width: 5.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            // password
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: passwordController,
                              style: const TextStyle(color: Colors.black87),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                fillColor: Colors.white,
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                suffixIcon: IconButton(
                                  icon: isPasswordVisible
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: () => setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  }),
                                ),
                                filled: true,
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple, width: 5.0),
                                ),
                              ),
                              obscureText: isPasswordVisible,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            //login button
                            padding: const EdgeInsets.all(5),
                            child: ButtonTheme(
                              height: 40,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                child: const Text('Login',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                color: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () => getItemAndNavigate(context),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
