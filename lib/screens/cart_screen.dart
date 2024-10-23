import 'package:flutter/material.dart';
import 'package:food_delivery/helper/routes.dart';
import '../provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;
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
                        height: 200,
                        decoration: BoxDecoration(
                           boxShadow:const [
                             BoxShadow(
                             color: Colors.grey,
                             spreadRadius: 2.5,
                             blurRadius: 2.5,
                             blurStyle: BlurStyle.inner
                             ),],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 25,
                              left: 0,
                              child:CircleAvatar(
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
                            Positioned(
                                top: 90,
                                left: 180,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          setState(() {
                                            provider.incrementQuantity();
                                          });
                                        },
                                        icon: const Icon(Icons.add , color: Colors.red,size: 30,)
                                    ),
                                     Text(provider.quantity.toString()),
                                    IconButton(
                                        onPressed: (){
                                          setState(() {
                                            provider.decrementQuantity();
                                          });
                                        },
                                        icon: const Icon(Icons.remove , color: Colors.red,size: 30,)
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Text("sub total" , style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),),
                  Text(provider.totalPrice().toString() , style: const TextStyle(
                    fontSize: 25,
                  ),),
                ],
              ),
              const Divider(
                endIndent: 10,
                indent: 10,
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("total" , style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  ),),
                  Text(provider.totalPrice().toString() , style: const TextStyle(
                    fontSize: 25
                  ),),
                ],
              ),
              const Divider(
                endIndent: 10,
                indent: 10,
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 50,
                  clipBehavior: Clip.none,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                      onPressed: (){},
                      child: const Text("check out" , style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
