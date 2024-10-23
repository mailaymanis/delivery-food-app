import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';

class CartProvider extends ChangeNotifier{
  int quantity = 1;
  final List<Recipes> _cart = [];
  List<Recipes> get cart => _cart;

  void addToCart(Recipes recipes){
    if(_cart.contains(recipes)){
      for(Recipes element in _cart){
        element.quantity++;
      }
    }else{
      _cart.add(recipes);
    }
    notifyListeners();
  }
// increment quantity for products
  incrementQuantity(){
    quantity++;
    notifyListeners();
  }
//decrement quantity for products
  decrementQuantity(){
    if(quantity <= 1){
      return;
    }
    quantity--;
    notifyListeners();
  }

  totalPrice(){
    double myTotal = 0.0;
    for(Recipes element in _cart){
      myTotal += element.servings * quantity;
    }
    return myTotal;
  }

  static CartProvider of(BuildContext context , {bool listen = true}){
    return Provider.of<CartProvider>(
      context,
      listen: true,
    );
  }
}