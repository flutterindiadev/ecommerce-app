class RatingEntity {
  final double? rate;
  final int? count;
  const RatingEntity({
    this.rate,
    this.count,
  });

  factory RatingEntity.fromJson(json) =>
      RatingEntity(rate: json['rate'] ?? "", count: json['count'] ?? "");
}
