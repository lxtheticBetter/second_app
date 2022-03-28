import 'package:flutter/material.dart';
import 'package:second_app/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = '';
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.homeScreen);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(255, 255, 255, 1),
      /* appBar: AppBar(
        title: const Text('Login'),
      ), */
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Hello $name',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(59, 59, 59, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter User Name',
                        labelText: 'User Name',
                      ),
                      onChanged: (v) {
                        name = v;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty!';
                        } else if (value.length < 7) {
                          return 'Password cannot be less than 6 characters!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(0, 140, 255, 1),
                        child: InkWell(
                          splashColor: const Color.fromRGBO(50, 163, 255, 1),
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            width: changedButton
                                ? 45
                                : MediaQuery.of(context).size.width * 1,
                            height: 45,
                            alignment: Alignment.center,

                            /* decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 140, 255, 1),
                              borderRadius: BorderRadius.circular(30),
                            ), */
                            child: changedButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      /* ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.homeScreen);
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width * 1, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ), */
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
