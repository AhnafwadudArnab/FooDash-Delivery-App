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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}