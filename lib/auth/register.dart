import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import 'providers/auth.dart';
import 'providers/user_provider.dart';
import 'util/validators.dart';
import 'util/widgets.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = new GlobalKey<FormState>();

  String first_name, last_name, email, password, password_confirmation;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final firstnameField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please enter first name" : null,
      onSaved: (value) => first_name = value,
      decoration: buildInputDecoration("First name", Icons.person),
    );

    final lastnameField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please enter last name" : null,
      onSaved: (value) => last_name = value,
      decoration: buildInputDecoration("Last name", Icons.person),
    );

    final emailField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => email = value,
      decoration: buildInputDecoration("Email", Icons.email),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => password = value,
      decoration: buildInputDecoration("Password", Icons.lock),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Your password is required" : null,
      onSaved: (value) => password_confirmation = value,
      obscureText: true,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text("Registering ... Please wait")
      ],
    );

    var doRegister = () {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        auth.register(first_name, last_name, email, password, password_confirmation).then((response) {
          if (response['status']) {
            UserModel user = response['data'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            Flushbar(
              title: "Registration failed",
              message: response.toString(),
              duration: Duration(seconds: 20),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: "Invalid form",
          message: "Please complete the form properly",
          duration: Duration(seconds: 20),
        ).show(context);
      }

    };

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label("First Name"),
                firstnameField,
                SizedBox(height: 1.0),
                label("Last Name"),
                lastnameField,
                SizedBox(height: 1.0),
                label("Email"),
                emailField,
                SizedBox(height: 1.0),
                label("Password"),
                passwordField,
                SizedBox(height: 1.0),
                label("Confirm Password"),
                confirmPassword,
                SizedBox(height: 12.0),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : longButtons("Register", doRegister),
              ],
            ),
          ),
        ),
      ),
    );
  }
}