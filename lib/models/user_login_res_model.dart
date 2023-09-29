class UserLoginResModel {
  User? user;
  String? token;

  UserLoginResModel({this.user, this.token});

  UserLoginResModel.fromJson(Map<String, dynamic> json) {
    // ignore: unnecessary_new
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals, unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    if (this.user != null) {
      // ignore: unnecessary_this
      data['user'] = this.user!.toJson();
    }
    // ignore: unnecessary_this
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profileUrl;
  // ignore: prefer_void_to_null, unnecessary_question_mark
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.profileUrl,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileUrl = json['profile_url'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['id'] = this.id;
    // ignore: unnecessary_this
    data['name'] = this.name;
    // ignore: unnecessary_this
    data['email'] = this.email;
    // ignore: unnecessary_this
    data['profile_url'] = this.profileUrl;
    // ignore: unnecessary_this
    data['email_verified_at'] = this.emailVerifiedAt;
    // ignore: unnecessary_this
    data['created_at'] = this.createdAt;
    // ignore: unnecessary_this
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
