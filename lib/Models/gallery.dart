class Galleries {
  int? id;
  String? image;
  String? image1;
  String? image2;
  String? g_description;
  int? program_id;
  String? o_name;
  int? id_account;
  String? avt;
  String? name;
  DateTime? created_at;
  Galleries(
      {this.id,
      this.image,
      this.image1,
      this.image2,
      this.g_description,
      this.program_id,
      this.o_name,
      this.id_account,
      this.avt,
      this.name,
      this.created_at});

  Galleries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    image1 = json['image1'];
    image2 = json['image2'];
    g_description = json['g_description'];
    program_id = json['program_id'];
    o_name = json['o_name'];
    id_account = json['id_account'];
    avt = json['avt'];
    name = json['name'];
    created_at = DateTime.parse(json['created_at'] as String);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['image1'] = image1;
    data['image2'] = image2;
    data['g_description'] = g_description;
    data['program_id'] = program_id;
    data['o_name'] = o_name;
    data['id_account'] = id_account;
    data['avt'] = avt;
    data['name'] = name;
    data['created_at'] = created_at;
    return data;
  }
}
