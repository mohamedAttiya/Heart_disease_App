
class UserModel {
  String? userId, email, name;
  String? pic;

  UserModel({ this.userId,  this.email,  this.name,  this.pic,});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      name: map['name'],
      email: map['email'],
      pic: map['pic'],
    );
  }

  UserModel copyWith({String? userId, String? name,String? email, String? pic}) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      pic: pic ?? this.pic,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'email': email,
        'name': name,
        'pic': pic,
      };


}
