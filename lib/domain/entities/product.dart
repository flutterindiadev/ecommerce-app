// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceapp/domain/entities/rating.dart';

class ProductEntity {
  final num id;
  final String title;
  final num price;
  final String desc;
  final String category;
  final String imgUrl;
  final RatingEntity ratingEntity;
  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.desc,
    required this.category,
    required this.imgUrl,
    required this.ratingEntity,
  });
}
