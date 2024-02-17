import 'package:ecommerceapp/data/model/rating.dart';
import 'package:ecommerceapp/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required int id,
      required String title,
      required num price,
      required String desc,
      required String category,
      required String imgUrl,
      required RatingModel ratingModel})
      : super(
            id: id,
            title: title,
            price: price,
            desc: desc,
            category: category,
            imgUrl: imgUrl,
            ratingEntity: ratingModel);

  factory ProductModel.fromJson(Map<String, dynamic> map) => ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      desc: map['description'],
      category: map['category'],
      imgUrl: map['image'],
      ratingModel: RatingModel.fromJson(map['rating']));
}
