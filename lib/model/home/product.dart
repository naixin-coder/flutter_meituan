class Product {
  String imageUrl;
  String title;
  String score;
  String nowPrice;
  String oldPrice;
  String discount;
  String sales;
  String evaluation;
  List<String> tags;
  Product({
    this.imageUrl,
    this.title,
    this.score,
    this.nowPrice,
    this.oldPrice,
    this.discount,
    this.evaluation,
    this.sales,
    this.tags,
  });

  factory Product.formJson(dynamic json) {
    return Product(
        imageUrl: json['imageUrl'].toString(),
        title: json['title'].toString(),
        score: json['score'].toString(),
        nowPrice: json['nowPrice'].toString(),
        oldPrice: json['oldPrice'].toString(),
        discount: json['discount'].toString(),
        evaluation: json['evaluation'].toString(),
        sales: json['sales'].toString(),
        tags: json['tags']);
  }
}

class Products {
  List<Product> data;
  Products(this.data);

  factory Products.fromJson(List json) {
    return Products(json.map((i) => Product.formJson(i)).toList());
  }
}
