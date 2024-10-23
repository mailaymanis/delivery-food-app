import 'package:flutter/material.dart';
import 'package:food_delivery/provider/favourites_provider.dart';
import '../model/product_model.dart';
import '../provider/cart_provider.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({super.key, required this.products});
  final Recipes products;
  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final secProvider = FavouritesProvider.of(context);
    return Scaffold(
      body: ListView(
          children:[ Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
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
                           Navigator.pop(context);
                         },
                         icon: const Icon(
                           Icons.arrow_back,
                           size: 30,
                         )),
                   ),
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
                           secProvider.addToFavourites(widget.products);
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: const Text("Product add to favourites" ,
                                 style: TextStyle(
                                     fontSize: 20
                                 ),),
                               backgroundColor: Colors.green,
                               shape: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(5)
                               ),
                             ),
                           );
                         },
                         icon:  Icon(
                          secProvider.isExist(widget.products) ? Icons.favorite : Icons.favorite_border,
                           color: Colors.red,
                           size: 30,
                         )),
                   ),
                 ],
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    widget.products.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.products.cuisine,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                    Row(
                      children: [
                        Text(widget.products.rating.toString() , style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54
                        ),),
                        const Icon(Icons.star , color: Colors.yellow,size: 30,)
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.products.reviewCount.toString() , style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54
                        ),),
                        const Icon(Icons.person , color: Colors.black54,)
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(image: NetworkImage(widget.products.image))
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Details" , style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 30
                    ),),
                    Row(
                      children: [
                        Text(widget.products.cookTimeMinutes.toString()),
                        const Icon(Icons.access_alarm , color: Colors.black54,)
                      ],
                    ),
                    Text(widget.products.mealType.toString()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Ingredients" , style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                ),),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                   List.generate(widget.products.ingredients.length, (index){
                     return Text("- ${widget.products.ingredients[index].toString()}" , style: const TextStyle(
                         fontSize: 18,
                         letterSpacing: 1.5
                     ),);
                   }),

                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Instructions" , style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30
                ),),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  List.generate(widget.products.instructions.length, (index){
                    return Text("- ${widget.products.instructions[index].toString()}" , style: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.5
                    ),);
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  clipBehavior: Clip.none,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed:(){
                        provider.addToCart(widget.products);
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                               content: const Text("Product add to cart" ,
                                 style: TextStyle(
                                 fontSize: 20
                               ),),
                             backgroundColor: Colors.green,
                             shape: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(5)
                             ),
                           ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber
                      ),
                      child: const Text("add to Cart" , style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),)
                  ),
                ),
              ],
            ),
          ),
          ]),
    );
  }
}
