import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/helper/routes.dart';
import '../model/product_model.dart';
import '../services/get_all_product_service.dart';
import 'detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  }
  List<Recipes> filterProducts = [];

  //fetch data
  List<Recipes> recipesModel = [];
  myProducts() {
    getAllProducts().then((value) {
      setState(() {
        recipesModel = value;
      });
    });
  }

  @override
  void initState() {
    myProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.black,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      const DrawerHeader(
                        margin: EdgeInsets.all(0.0),
                        child: Center(
                          child: Text("My Profile"),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text("Home"),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, MyRoutes.homeScreenRoute);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.favorite),
                        title: const Text("Favourites"),
                        onTap: (){
                          Navigator.pushReplacementNamed(context, MyRoutes.favouritesScreenRoute);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.shopping_cart),
                        title: const Text("My Cart"),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, MyRoutes.cartScreenRoute);
                        },
                      ),
                      //const Expanded(child: SizedBox()),
                      ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text("Logout"),
                        onTap: (){
                          FirebaseAuth.instance.signOut();
                          AwesomeDialog(
                            context: context,
                            title:"Logout",
                            body:const Text("Are want to logout"),
                            animType: AnimType.bottomSlide,
                            dialogType: DialogType.warning,
                            btnCancelOnPress:(){},
                            btnOkOnPress:(){
                              Navigator.pushReplacementNamed(context, MyRoutes.loginScreenRoute);
                            }
                          ).show();
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What Would",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Row(
              children: [
                Text(
                  "You ",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "like to order",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: double.infinity,
                color: const Color(0xffE4E0F1),
                child: TextFormField(
                  onChanged:(val){
                     addDataToFilterData(input: val);
                  },
                  decoration: InputDecoration(
                    prefixIcon:  IconButton(
                      onPressed:(){
                        setState(() {
                          searchController.text = '';
                          isSearching = true;
                        });
                      },
                      icon:const Icon(Icons.search , size: 30,),
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                        onPressed:(){
                          setState(() {
                            filterProducts.clear();
                          });
                        },
                        icon: const Icon(Icons.clear , size: 30,)
                    ),
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      letterSpacing: 1.2,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(0xffE4E0F1),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(0xffE4E0F1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(0xffE4E0F1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 400,
                    height: 170,
                    decoration: BoxDecoration(
                        color: const Color(0xffC69CF4),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 40,
                          left: 30,
                          child: Text(
                            "-50% off the full",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 65,
                          left: 30,
                          child: Text(
                            "price of the traditional",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 95,
                          left: 30,
                          child: Text(
                            "food",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 240,
                          child: Image.asset(
                            "assets/images/burger.png",
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 400,
                    height: 170,
                    decoration: BoxDecoration(
                        color: const Color(0xffF49CC8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 40,
                          left: 30,
                          child: Text(
                            "-50% off the full",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 65,
                          left: 30,
                          child: Text(
                            "price of the traditional",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 95,
                          left: 30,
                          child: Text(
                            "food",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 240,
                          child: Image.asset(
                            "assets/images/chicken2.png",
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 400,
                    height: 170,
                    decoration: BoxDecoration(
                        color: const Color(0xff9CE5F4),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 40,
                          left: 30,
                          child: Text(
                            "-50% off the full",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 65,
                          left: 30,
                          child: Text(
                            "price of the traditional",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 95,
                          left: 30,
                          child: Text(
                            "food",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 240,
                          child: Image.asset(
                            "assets/images/pizza.png",
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Recommended for you",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:filterProducts.isNotEmpty ? filterProducts.length : recipesModel.length,
                  itemBuilder: (context, index) {
                    final recipes = filterProducts.isEmpty ? recipesModel[index] : filterProducts[index];
                    return Stack(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:(context){
                                return DetailedScreen(products:recipes);
                              }),);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20 , top: 20),
                              height: 250,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 4,
                                        blurRadius: 2.5),
                                  ],
                                  image: DecorationImage(image: NetworkImage(recipes.image) , fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                          ),
                        ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
  //search for specific products
  void addDataToFilterData({required String input}) {
    setState(() {
      filterProducts = recipesModel
          .where((element) => element.name.toLowerCase().contains(input))
          .toList();
    });
  }
}
