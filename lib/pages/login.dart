import 'package:aryanwheels_flutter/api_services/user_api.dart';
import 'package:aryanwheels_flutter/models/user_model.dart';
import 'package:aryanwheels_flutter/util/mobile_text_size.dart';

import './signup.dart';
import '../util/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _username='';
  String _password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Log in',
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
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: Text('Log in here.'),
                    ),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,10,0),
                            child: TextFormField(

                              validator: (value){
                                if(value==null || value.isEmpty) {
                                  return "Please enter your username";
                                }
                                return null;
                              },
                              onSaved: (val){

                                _username=val!;
                              },
                              decoration: const InputDecoration(labelText: 'Username'),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,10,0),
                            child: TextFormField(

                              validator: (value){
                                if(value==null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                              onSaved: (val){
                                print ('value : ' +val.toString());
                                _password= val!;
                              },
                              decoration: const InputDecoration(labelText: 'Password'),
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: TextButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                             await UserApi.login(UserCredential(username: _username ,password: _password ),context);
                             Navigator.pushNamed(context, '/home');
                            // Navigator.pop(context);
                            return;
                          }

                        },
                        child: const Text(
                          'Log in',
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
                        const Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Signup()));
                            },
                            child: const Text(
                              'Create an account here.',
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
