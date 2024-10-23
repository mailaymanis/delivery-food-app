import 'dart:convert';

class FoodModel {
  final int total;
  final int skip;
  final int limit;
  final List<Recipes> recipes;

  FoodModel(
      {required this.total,
        required this.skip,
        required this.limit,
        required this.recipes});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
      recipes: List<Recipes>.from(json["recipes"].map((x) => Recipes.fromJson(x))),
    );
  }
}


class Recipes {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final dynamic rating;
  final int reviewCount;
  final List<String> mealType;
  dynamic quantity = 1;

  Recipes(
      {required this.id,
        required this.name,
        required this.ingredients,
        required this.instructions,
        required this.prepTimeMinutes,
        required this.cookTimeMinutes,
        required this.servings,
        required this.difficulty,
        required this.cuisine,
        required this.caloriesPerServing,
        required this.tags,
        required this.userId,
        required this.image,
        required this.rating,
        required this.reviewCount,
        required this.quantity,
        required this.mealType});

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      id: json["id"],
      name: json["name"],
      ingredients: List<String>.from(json['ingredients'].map((x) => x)),
      instructions: List<String>.from(json['instructions'].map((x) => x)),
      prepTimeMinutes: json["prepTimeMinutes"],
      cookTimeMinutes: json["cookTimeMinutes"],
      servings: json["servings"],
      difficulty: json["difficulty"],
      cuisine: json["cuisine"],
      caloriesPerServing: json["caloriesPerServing"],
      tags: List<String>.from(json['tags'].map((x) => x)),
      userId: json["userId"],
      image: json["image"],
      rating: json["rating"],
      reviewCount: json["reviewCount"],
      quantity: json["quantity"],
      mealType: List<String>.from(json['mealType'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "ingredients": jsonEncode(ingredients),
      "instructions": jsonEncode(instructions),
      "prepTimeMinutes": prepTimeMinutes,
      "cookTimeMinutes": cookTimeMinutes,
      "servings": servings,
      "difficulty": difficulty,
      "cuisine": cuisine,
      "caloriesPerServing": caloriesPerServing,
      "tags": jsonEncode(tags),
      "userId": userId,
      "image": image,
      "rating": rating,
      "reviewCount": reviewCount,
      "quantity": quantity,
      "mealType": jsonEncode(mealType),
    };
  }
}