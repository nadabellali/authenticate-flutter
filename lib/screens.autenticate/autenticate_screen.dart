
import 'package:flutter/material.dart';
import 'package:untitled4/common/loading.dart';

import '../../custominput.dart';

class AutenticateScreen extends StatefulWidget {
  @override
  _AutenticateScreenState createState() =>  _AutenticateScreenState();

  }

class _AutenticateScreenState extends State<AutenticateScreen> {
  final _formkey= GlobalKey<FormState>();
  String error='';
  bool loading = false;

  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  bool showSingIN = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {

    setState(() {
      emailController.text='';
      passwordController.text='';
      showSingIN = !showSingIN;
    });
  }


  @override
  Widget build(BuildContext context) {
    return loading? Loading():
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text(showSingIN
        ? 'Sign in'
            : 'Register'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person,color: Colors.white),
            label: Text(showSingIN ? 'Sign in' : 'Register',
            style :TextStyle(color: Colors.white)),
            onPressed: () => toggleView(),
          )
        ],
        ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 30.0),
        child: Form(
          key: _formkey,
          child: Column(
            children:[
            CustomInput(
              controller: emailController,
              maxLines: 1,
              hintText: 'email',
              validator: (value){
              if (value!.isEmpty )
              return "invalid adresse e-mail";
           }
            ),
              SizedBox(height: 10.0),
              CustomInput(
                  controller: passwordController,
                  maxLines: 1,
                  hintText: 'password',
                  obscureText: true,
                  validator: (value){
                    if (value!.length <4)
                    return "Enter a password with at least 4 character";
                  }
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                child: Text(
                  showSingIN ? 'Sign in' : 'Register',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: (){
                  if (_formkey.currentState!.validate()){
                    setState(() => loading = true);
                    var password = passwordController.value.text;
                    var email = emailController.value.text;

                    dynamic result;
                    if (result == null) {
                      setState(() {
                        //loading = false;
                        error = "please supply a valid email";
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 10.0),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 15.0),
              )
          ]
          ),
        ),
      ),
    );
  }
}