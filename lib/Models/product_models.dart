class PopularFoodModels {
  String? image;
  String? name;
  String? description;
  String? price;

  PopularFoodModels({this.image, this.name, this.description, this.price});

  PopularFoodModels.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    return data;
  }
}