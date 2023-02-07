class User {
  dynamic id;
  dynamic firstname;
  dynamic lastname;
  dynamic phone;
  dynamic avatar;
  dynamic code;
  dynamic birthDate;
  dynamic birthPlace;
  dynamic size;
  dynamic gender;
  dynamic profession;
  dynamic address;
  dynamic fathername;
  dynamic mothername;
  dynamic cniCode;
  dynamic cniDeliveryDate;
  dynamic cniExpiryDate;
  dynamic createdAt;
  dynamic updatedAt;

  User(
      {this.id,
      this.firstname,
      this.lastname,
      this.phone,
      this.avatar,
      this.code,
      this.birthDate,
      this.birthPlace,
      this.size,
      this.gender,
      this.profession,
      this.address,
      this.fathername,
      this.mothername,
      this.cniCode,
      this.cniDeliveryDate,
      this.cniExpiryDate,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    avatar = json['avatar'];
    code = json['code'];
    birthDate = json['birthDate'];
    birthPlace = json['birthPlace'];
    size = json['size'];
    gender = json['gender'];
    profession = json['profession'];
    address = json['address'];
    fathername = json['fathername'];
    mothername = json['mothername'];
    cniCode = json['cniCode'];
    cniDeliveryDate = json['cniDeliveryDate'];
    cniExpiryDate = json['cniExpiryDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['code'] = this.code;
    data['birthDate'] = this.birthDate;
    data['birthPlace'] = this.birthPlace;
    data['size'] = this.size;
    data['gender'] = this.gender;
    data['profession'] = this.profession;
    data['address'] = this.address;
    data['fathername'] = this.fathername;
    data['mothername'] = this.mothername;
    data['cniCode'] = this.cniCode;
    data['cniDeliveryDate'] = this.cniDeliveryDate;
    data['cniExpiryDate'] = this.cniExpiryDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
