class PaymentMethod {
  int? id;
  String? code;
  String? titleEn;
  String? titleFr;
  String? descriptionEn;
  int? minAmount;
  String? descriptionFr;
  String? iconImage;

  PaymentMethod(
      {this.id,
      this.code,
      this.titleEn,
      this.titleFr,
      this.descriptionEn,
      this.minAmount,
      this.descriptionFr,
      this.iconImage});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    titleEn = json['title_en'];
    titleFr = json['title_fr'];
    descriptionEn = json['description_en'];
    minAmount = json['min_amount'];
    descriptionFr = json['description_fr'];
    iconImage = json['icon_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['title_en'] = titleEn;
    data['title_fr'] = titleFr;
    data['description_en'] = descriptionEn;
    data['min_amount'] = minAmount;
    data['description_fr'] = descriptionFr;
    data['icon_image'] = iconImage;
    return data;
  }
}
