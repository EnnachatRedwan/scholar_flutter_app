import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme.dart';
import '../widgets/title.dart';
import 'login_screen.dart';
import '../apis/register_api.dart';
import 'loading_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  final _fullnaemFocud = FocusNode();
  final _specialityFocus = FocusNode();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _fullnaemFocud.dispose();
    _specialityFocus.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _email = '';
  String _password = '';
  String _fullName = '';
  String _speciality = '';

  void _validAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final regApi = RegisterApi(_email, _password, _fullName, _speciality);
      Navigator.of(context).pushNamed(LoadingScreen.routeName);
      bool isAdded = await regApi.regUser();
      _popScreen();
      if (isAdded) {
        _pushRoute(LoginScreen.routeName);
      } else {
        _showSnackBar();
      }
    }
  }

  void _popScreen() {
    Navigator.of(context).pop();
  }

  void _pushRoute(String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'An error occured',
      ),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var theme=Provider.of<AppTheme>(context);
    var bounds = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
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
                vertical: bounds.height * .1, horizontal: bounds.width * .05),
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
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Full name',
                            ),
                            focusNode: _fullnaemFocud,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_emailFocus);
                            },
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please provide a full name.';
                              }
                              if (value.length < 5 || value.length > 20) {
                                return 'Please provide a full name between 5 and 20 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _fullName = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            focusNode: _emailFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocus);
                            },
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please provide an email.';
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please provide a valid email.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            autocorrect: false,
                            enableSuggestions: false,
                            obscureText: true,
                            focusNode: _passwordFocus,
                            controller: _passwordController,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_confirmPasswordFocus);
                            },
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please provide a password.';
                              }
                              if (value.length < 8) {
                                return 'Password should includes more than 8 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Confirm password',
                            ),
                            autocorrect: false,
                            enableSuggestions: false,
                            obscureText: true,
                            focusNode: _confirmPasswordFocus,
                            validator: (value) {
                              if (value!.trim() != _passwordController.text) {
                                return 'Password should match';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_specialityFocus);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'speciality',
                            ),
                            focusNode: _specialityFocus,
                            onFieldSubmitted: (_) => _validAndSubmit(),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please provide a speciality.';
                              }
                              if (value.length < 5) {
                                return 'speciality should includes more than 5 characters';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _speciality = value!;
                            },
                          ),
                        ),
                        //----------------Login Button----------------//
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: _validAndSubmit,
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
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
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
