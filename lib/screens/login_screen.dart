import 'package:flutter/material.dart';
import 'package:scholar_app/screens/home.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../themes/theme.dart';
import '../widgets/title.dart';
import 'register_screen.dart';
import '../apis/login_api.dart';
import '../screens/loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  String _email = '';
  String _password = '';

  void _validAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final logApi = LoginApi(_email, _password);
      Navigator.of(context).pushNamed(LoadingScreen.routeName);
      User? user = await logApi.authUser();
      _popScreen();
      if (user != null) {
        _pushRoute(HomeScreen.routeName, user);
      } else {
        _showSnackBar();
      }
    }
  }

  void _popScreen() {
    Navigator.of(context).pop();
  }

  void _pushRoute(String route, User user) {
    Provider.of<UserProvider>(context, listen: false).user = user;
    Navigator.of(context).pushReplacementNamed(route);
  }

  void _showSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Wrong email or password',
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var bounds = MediaQuery.of(context).size;
    var theme=Provider.of<AppTheme>(context);
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
                    title: 'Login',
                    padding: 0.03,
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
                              labelText: 'Email',
                            ),
                            focusNode: _emailFocus,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocus);
                            },
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
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
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a password';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              _validAndSubmit();
                            },
                            onSaved: (value) {
                              _password = value!;
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
                              child: Text('Login'),
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
                          .pushReplacementNamed(RegisterScreen.routeName);
                    },
                    child: const Text("Don't have an account?"),
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
