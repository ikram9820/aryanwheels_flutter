import '../util/mobile_text_size.dart';
import '../api_services/user_api.dart';
import '../models/user_model.dart';
import 'package:flutter/material.dart';
import '../util/colors.dart';
class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email='';
  String _password='';
  String _username= '';
  String _firstName= '';
  String _lastName= '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Sign up',
            style: TextStyle(
              fontSize: titleTxt,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: Text('Create an account here.'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,5,0),
                              child: TextFormField(
                                onSaved: (val) {
                                  _firstName= val!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter some value";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'First name'),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,0,5,0),
                              child: TextFormField(
                                onSaved: (val) {
                                  _lastName= val!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter some value";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Last name'),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextFormField(
                        onSaved: (val) {
                          _username= val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some value";
                          }
                          return null;
                        },
                        decoration:
                        const InputDecoration(labelText: 'username'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextFormField(
                        onSaved: (val) {
                          _email= val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some value";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Email'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextFormField(

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some value";
                          }
                          return null;
                        },

                        decoration:
                        const InputDecoration(labelText: 'Password'),
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (val) {
                          _password= val!;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: TextFormField(

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some value";
                          }
                          return null;
                        },

                        decoration:
                        const InputDecoration(labelText: 'Password'),
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (val) {
                          _password= val!;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();


                     await UserApi.createAccount(User(email: _email,firstName: _firstName,
                                                      lastName: _lastName, username: _username,
                                                      password: _password),context);


                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: const Text('Create account',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Log in here.',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
