import 'package:flutter/material.dart';

import '../../shared/components/component.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController =TextEditingController();

  var passController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          )
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    defaultFormFieled(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (String? value){
                          if(value!.isEmpty){
                            return 'email address must not be empty';
                          }
                          return null;
                        },
                        label: 'Email',
                        prefix: Icons.email,
                       ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormFieled(
                      controller: passController,
                      type: TextInputType.visiblePassword,
                      validator: (String? value){
                        if(value!.isEmpty){
                          return 'password is not short';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock,
                      isPassword: isPassword,
                      suffixPrassed:(){
                        setState(() {
                          isPassword =  !isPassword;
                          print(
                            isPassword
                          );
                        });
                      },

                      suffix: isPassword? Icons.visibility_off:Icons.visibility,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultButton(
                      width: double.infinity,
                      redius: 10.0,
                      text: 'login',
                      function:(){
                        if(formKey.currentState!.validate()){
                          print(emailController.text);
                          print(passController.text);
                        }
                      },
                      background:Colors.blue,
                   ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultButton(
                      width: double.infinity,
                      redius: 10.0,
                      text: 'Register',
                      function:(){
                        print(emailController.text);
                        print(passController.text);
                      },
                      background:Colors.blue,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?'
                        ),
                        TextButton(
                            onPressed: (){},
                            child: Text(
                              'Register'
                            ),
                        )
                      ],
                    )
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}