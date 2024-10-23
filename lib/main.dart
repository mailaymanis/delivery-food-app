import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/auth/login_screen.dart';
import 'package:food_delivery/auth/signup_screen.dart';
import 'package:food_delivery/helper/routes.dart';
import 'package:food_delivery/provider/cart_provider.dart';
import 'package:food_delivery/provider/favourites_provider.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/favourites_screen.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartProvider(),),
      ChangeNotifierProvider(create: (_) => FavouritesProvider(),),
    ],
    child: MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null ? const HomeScreen() : const LoginScreen(),

      routes: {
        MyRoutes.homeScreenRoute : (context) => const HomeScreen(),
        MyRoutes.cartScreenRoute : (context) => const CartScreen(),
        MyRoutes.favouritesScreenRoute : (context) => const FavouritesScreen(),
        MyRoutes.loginScreenRoute : (context) => const LoginScreen(),
        MyRoutes.signupScreenRoute : (context) => const SignupScreen(),
      },
    ),
  );


}
