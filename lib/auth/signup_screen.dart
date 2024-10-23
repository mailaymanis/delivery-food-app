// ignore_for_file: avoid_print, unused_local_variable
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/helper/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/email_form_field.dart';
import '../widgets/password_field.dart';
import '../widgets/username_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  void dispose(){
    email.dispose();
    password.dispose();
    username.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:SingleChildScrollView(
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
                              WavyAnimatedText("SignUp"),
                            ],
                              isRepeatingAnimation: true,
                            ),
                          ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Column(
                      children: [
                        UserNameField(
                          hint: "Enter Your Name",
                          controller: username,
                          validator:(value){
                            if(value!.isEmpty){
                              return "please enter your name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                        CustomButton(text: "SignUp" , onPressed:() async {
                          if(formState.currentState!.validate()){
                            try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              Navigator.of(context).pushReplacementNamed(MyRoutes.loginScreenRoute);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              }  if (e.code == 'email-already-in-use') {
                                throw Exception('The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("already have an account?" , style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                color: Colors.black26,
                              ),),
                              CustomTextButton(text: "Login", onPressed:(){
                                Navigator.of(context).pushReplacementNamed(MyRoutes.loginScreenRoute);
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
