class Product {
  int? id;
  String? name;
  int? price;
  int? stock;
  String? image;

  Product({this.id, this.name, this.price, this.stock, this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: int.parse(json['id']),
    name: json['name'],
    price: json['price'],
    stock: json['stock'],
    image: json['image'],
  );

  }
}
