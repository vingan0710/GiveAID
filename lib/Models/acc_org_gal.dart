class AccOrgGal {
  int? id_account;
  String? username;
  String? avt;
  String? name;
  String? description;
  bool? type_acc;
  int? follower;
  int? like;
  int? support;
  List<Organization>? lsOrg;
  List<Gallery>? lsGal;

  AccOrgGal({
    this.id_account,
    this.avt,
    this.name,
    this.username,
    this.type_acc,
    this.description,
    this.follower,
    this.like,
    this.support,
    this.lsOrg, this.lsGal
  });

  factory AccOrgGal.fromJson(Map<String, dynamic> json) => AccOrgGal(
        id_account: json["id_account"],
        avt: json["avt"],
        username: json["username"],
        name: json["name"],
        type_acc: json["type_acc"],
        description: json["description"],
        follower: json["follower"],
        like: json["like"],
        support: json["support"],
        lsOrg: List<Organization>.from(
            json["lsOrg"].map((x) => Organization.fromJson(x))),
            lsGal: List<Gallery>.from(
            json["lsGal"].map((x) => Gallery.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "id_account": id_account,
        "avt": avt,
        "name": name,
        "username": username,
        "type_acc": type_acc,
        "description": description,
        "follower": follower,
        "like": like,
        "support": support,
        "lsOrg": List<dynamic>.from(lsOrg!.map((x) => x.toJson())),
        "lsGal": List<dynamic>.from(lsOrg!.map((x) => x.toJson())),
      };
  List<Organization> getOrganizations() => lsOrg!;
  List<Gallery> getGallery() => lsGal!;

}

class Organization {
  int? id;
  String? o_name;
  String? o_image;
  DateTime? day_start;
  double? target;
  double? current;

  Organization({
    this.id,
    this.o_name,
    this.o_image,
    this.day_start,
    this.target,
    this.current,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json['id'],
        o_name: json['o_name'],
        o_image: json['o_image'],
        day_start: DateTime.parse(json['day_start'] as String),
        target: json['target'] == null ? 0 : json['target'].toDouble(),
        current: json['current'] == null ? 0 : json['current'].toDouble(),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "o_name": o_name,
        "o_image": o_image,
        "day_start": day_start,
        "target": target,
        "current": current,
      };
}

class Gallery {
  int? id;
  String? image;
  String? image1;
  String? image2;

  Gallery({
    this.id,
    this.image,
    this.image1,
    this.image2,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json['id'],
        image: json['image'],
        image1: json['image1'],
        image2: json['image2'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "image1": image1,
        "image2": image2,
      };
}
