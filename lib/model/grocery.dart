class Grocery {
  int? id;
  String? name;
  double? price;
  String? perPrice;
  String? description;
  double? rating;
  int? quantity;
  int? category;
  bool? isFavorite;
  bool? isExclusive;
  bool? isBestSelling;
  String? nutrients;
  List<String>? photos;

  Grocery({
    this.id,
    this.name,
    this.price,
    this.perPrice,
    this.description,
    this.rating,
    this.quantity,
    this.category,
    this.isFavorite,
    this.isExclusive,
    this.isBestSelling,
    this.nutrients,
    this.photos,
  });

  Grocery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    perPrice = json['perPrice'];
    description = json['description'];
    rating = json['rating'];
    quantity = json['quantity'];
    category = json['category'];
    isFavorite = json['isFavorite'];
    isExclusive = json['isExclusive'];
    isBestSelling = json['isBestSelling'];
    nutrients = json['nutrients'];
    photos = json['photos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['perPrice'] = perPrice;
    data['description'] = description;
    data['rating'] = rating;
    data['quantity'] = quantity;
    data['category'] = category;
    data['isFavorite'] = isFavorite;
    data['isExclusive'] = isExclusive;
    data['isBestSelling'] = isBestSelling;
    data['nutrients'] = nutrients;
    data['photos'] = photos;
    return data;
  }
}
