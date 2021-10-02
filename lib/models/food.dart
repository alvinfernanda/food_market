part of 'models.dart';

enum FoodType {new_food, popular, recommended}

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> type;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.type = const []
  });

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath: "http://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg",
      name: "Sate Kambing Madura Enak",
      description:
          "Sate merupakan salah satu warisan kuliner nusantara yang paling populer. Tidak mengherankan jika banyak yang menjual hidangan ini, mulai dari kaki lima hingga hotel bintang lima.",
      ingredients: "Daging ayam, bumbu kecap, bawang",
      price: 100000,
      rate: 5,
      type: [FoodType.new_food, FoodType.popular, FoodType.recommended] 
      ),
  Food(
      id: 2,
      picturePath: "http://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg",
      name: "Sate Kelinci",
      description:
          "Sate merupakan salah satu warisan kuliner nusantara yang paling populer. Tidak mengherankan jika banyak yang menjual hidangan ini, mulai dari kaki lima hingga hotel bintang lima.Sate merupakan salah satu warisan kuliner nusantara yang paling populer. Tidak mengherankan jika banyak yang menjual hidangan ini, mulai dari kaki lima hingga hotel bintang lima.",
      ingredients: "Daging ayam, bumbu kecap, bawang",
      price: 100000,
      rate: 4,
      type: [FoodType.popular]),
  Food(
      id: 3,
      picturePath: "http://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg",
      name: "Sate Ayam",
      description:
          "Sate merupakan salah satu warisan kuliner nusantara yang paling populer. Tidak mengherankan jika banyak yang menjual hidangan ini, mulai dari kaki lima hingga hotel bintang lima.",
      ingredients: "Daging ayam, bumbu kecap, bawang",
      price: 100000,
      rate: 3.5,
      type: [FoodType.new_food]),
  Food(
      id: 4,
      picturePath: "http://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg",
      name: "Sate Ayam",
      description:
          "Sate merupakan salah satu warisan kuliner nusantara yang paling populer. Tidak mengherankan jika banyak yang menjual hidangan ini, mulai dari kaki lima hingga hotel bintang lima.",
      ingredients: "Daging ayam, bumbu kecap, bawang",
      price: 100000,
      rate: 5),
];
