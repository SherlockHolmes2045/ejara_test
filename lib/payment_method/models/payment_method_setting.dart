class PaymentMethodSetting {
  int? dateCreation;
  int? dateUpdate;
  int? id;
  String? identification;
  String? status;
  String? data;
  String? fullName;
  String? address;
  String? accountName;
  String? imageLink;
  int? lastUsed;
  int? customer;
  int? country;
  int? paymentType;
  int? paymentMode;
  int? transactionType;

  PaymentMethodSetting(
      {this.dateCreation,
      this.dateUpdate,
      this.id,
      this.identification,
      this.status,
      this.data,
      this.fullName,
      this.address,
      this.accountName,
      this.imageLink,
      this.lastUsed,
      this.customer,
      this.country,
      this.paymentType,
      this.paymentMode,
      this.transactionType});

  PaymentMethodSetting.fromJson(Map<String, dynamic> json) {
    dateCreation = json['date_creation'];
    dateUpdate = json['date_update'];
    id = json['id'];
    identification = json['identification'];
    status = json['status'];
    data = json['data'];
    fullName = json['fullName'];
    address = json['address'];
    accountName = json['accountName'];
    imageLink = json['imageLink'];
    lastUsed = json['lastUsed'];
    customer = json['customer'];
    country = json['country'];
    paymentType = json['paymentType'];
    paymentMode = json['paymentMode'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date_creation'] = dateCreation;
    data['date_update'] = dateUpdate;
    data['id'] = id;
    data['identification'] = identification;
    data['status'] = status;
    data['data'] = this.data;
    data['fullName'] = fullName;
    data['address'] = address;
    data['accountName'] = accountName;
    data['imageLink'] = imageLink;
    data['lastUsed'] = lastUsed;
    data['customer'] = customer;
    data['country'] = country;
    data['paymentType'] = paymentType;
    data['paymentMode'] = paymentMode;
    data['transactionType'] = transactionType;
    return data;
  }
}
