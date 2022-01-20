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
  bool? isMeat;
  bool? isRice;
  bool? isPulse;
  List<Photos>? photos;

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
    this.isMeat,
    this.isRice,
    this.isPulse,
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
    isMeat = json['isMeat'];
    isRice = json['isRice'];
    isPulse = json['isPulse'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
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
    data['isMeat'] = isMeat;
    data['isRice'] = isRice;
    data['isPulse'] = isPulse;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int? id;
  String? image;

  Photos({this.id, this.image});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
