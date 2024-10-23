import 'package:flutter/material.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:provider/provider.dart';

class FavouritesProvider extends ChangeNotifier{
  final List<Recipes> _favourites = [];
  List<Recipes> get favourites => _favourites;

  void addToFavourites(Recipes recipes){
    if(_favourites.contains(recipes)){
      _favourites.remove(recipes);
    }
    else{
      _favourites.add(recipes);
    }
    notifyListeners();
  }
  bool isExist(Recipes recipes){
    final isExist = _favourites.contains(recipes);
    return isExist;
  }

  static FavouritesProvider of(BuildContext context , {bool listen = true}){
    return Provider.of<FavouritesProvider>(
      context,
      listen: listen,
    );
  }
}