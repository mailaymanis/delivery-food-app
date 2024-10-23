import 'package:flutter/material.dart';
import 'package:food_delivery/provider/favourites_provider.dart';

import '../helper/routes.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouritesProvider.of(context);
    final finalList = provider.favourites;
    return Scaffold(
      body: SafeArea (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 10,
                      )
                    ]),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.homeScreenRoute);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: finalList.length,
                    itemBuilder: (context, index) {
                      final cartItems = finalList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        clipBehavior: Clip.none,
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2.5,
                              blurRadius: 2.5,
                              blurStyle: BlurStyle.inner
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 25,
                              left: 0,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage( cartItems.image),
                              ),
                            ),
                            Positioned(
                                top: 20,
                                left: 130,
                                child: Text(
                                  cartItems.name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                                top: 50,
                                left: 130,
                                child: Text(
                                  cartItems.cuisine,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                              top: 85,
                              left: 130,
                              child: Container(
                                clipBehavior: Clip.none,
                                //height: 40,
                                child: Text("${cartItems.servings.toString()}\$" , style: const TextStyle(
                                    fontSize: 20
                                ),),
                              ),
                            ),
                            Positioned(
                                top: 50,
                                left: 330,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        finalList.removeAt(index);
                                      });
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: const Text("Product deleted successfully" ,
                                            style: TextStyle(
                                                fontSize: 20
                                            ),),
                                          backgroundColor: Colors.red,
                                          shape: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.delete , color: Colors.red,size: 40,)
                                )
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
