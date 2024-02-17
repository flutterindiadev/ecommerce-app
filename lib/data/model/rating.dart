import 'package:ecommerceapp/domain/entities/rating.dart';

class RatingModel extends RatingEntity {
  const RatingModel({num? rate, num? count});

  factory RatingModel.fromJson(Map<String, dynamic> map) =>
      RatingModel(rate: map['rate'], count: map['count']);
}
