// ignore_for_file: avoid_print
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/helper/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/email_form_field.dart';
import '../widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void dispose(){
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formState,
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    width: double.infinity,
                    height: 450,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/background.png"),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 40,
                          child: Image.asset("assets/images/light1.png"),
                        ),
                        Positioned(
                          left: 190,
                          child: Image.asset("assets/images/light2.png"),
                        ),
                        Positioned(
                          top: 110,
                          left: 320,
                          child: Image.asset("assets/images/clock.png"),
                        ),
                        Positioned(
                          top: 240,
                          left: 170,
                          child:DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),
                            child: AnimatedTextKit(animatedTexts:[
                              WavyAnimatedText("Login"),
                              WavyAnimatedText("Welcome"),
                            ],
                              isRepeatingAnimation: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      children: [
                        EmailField(
                          hint: "Enter Your Email",
                          controller: email,
                          validator:(value){
                            if(value!.isEmpty){
                              return "please enter your email";
                            }
                            if(!value.contains('@')){
                              return "enter a valid email you missing @";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PasswordField(
                          hint: "Enter Your Password",
                          controller: password,
                          validator:(value){
                            if(value!.isEmpty){
                              return "please enter an password";
                            }
                            if(value.length < 8){
                              return "your password less than 8";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButton(text: "Login" , onPressed:() async {
                          if(formState.currentState!.validate()){
                            try {
                              // ignore: unused_local_variable
                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text
                              );
                                Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreenRoute);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }
                          }
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextButton(text: "Forget Your Password?", onPressed: (){}),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("don't have an account?" , style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                color: Colors.black26,
                              ),),
                              CustomTextButton(text: "Signup", onPressed:(){
                                Navigator.of(context).pushReplacementNamed(MyRoutes.signupScreenRoute);
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}