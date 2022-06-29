import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../widgets/title.dart';
import './login.dart';
import './home.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName='/login';

  @override
  Widget build(BuildContext context) {
    var bounds = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 200,
            maxWidth: 800,
            minHeight: 250,
            maxHeight: 1000,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: bounds.height * .1, horizontal: bounds.width * .1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //----------------Title----------------//
                  const TitleWidget(
                    title: 'Register',
                    padding: 0.02,
                  ),
                  //----------------Form fields----------------//
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Full name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Confirm password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'speciality',
                            ),
                          ),
                        ),
                        //----------------Login Button----------------//
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Text('Register'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //----------------Goto Register button----------------//
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: const Text("Already have an account?"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
