class Account {
  int? id;
  String? username;
  String? password;
  String? avt;
  String? name;
  String? email;
  String? description;
  bool? type_acc;
  int? follower;
  int? like;
  int? support;
  DateTime? created_at;
  Account(
      {this.id,
      this.username,
      this.password,
      this.avt,
      this.name,
      this.email,
      this.description,
      this.type_acc,
      this.follower,
      this.like,
      this.support,
      this.created_at});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    avt = json['avt'];
    name = json['name'];
    email = json['email'];
    description = json['description'];
    type_acc = json['type_acc'];
    follower = json['follower'];
    like = json['like'];
    support = json['support'];
    created_at = json['created_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['avt'] = avt;
    data['name'] = name;
    data['email'] = email;
     data['description'] = description;
    data['type_acc'] = type_acc;
     data['follower'] = follower;
    data['like'] = like;
    data['support'] = support;
    data['created_at'] = created_at;
    return data;
  }
}
