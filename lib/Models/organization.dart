class Organization {
  int? id;
  String? o_name;
  String? o_description;
  String? o_image;
  String? o_address;
  DateTime? day_start;
  DateTime? day_end;
  double? target;
  double? current;
  int? status;
  bool? outstanding;
  int? topic_id;
  String? topic_name;
  int? id_account;
  String? username;
  String? avt;
  String? name;
  Organization(
      {this.id,
      this.o_name,
      this.o_description,
      this.o_image, this.o_address,
      this.day_start,
      this.day_end,
      this.target,
      this.current,
      this.status,
      this.outstanding,
      this.topic_id,
      this.topic_name,
      this.id_account,
      this.username,
      this.avt,
      this.name});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    o_name = json['o_name'];
    o_description = json['o_description'];
    o_image = json['o_image'];
    o_address = json['o_address'];
    day_start = DateTime.parse(json['day_start'] as String);
    day_end = json['day_end'] == null
        ? json['day_end']
        : DateTime.parse(json['day_end'] as String);
    target = json['target'] == null ? 0 : json['target'].toDouble();
    current = json['current'] == null ? 0 : json['current'].toDouble();
    status = json['status'];
    outstanding = json['outstanding'];
    topic_id = json['topic_id'];
    topic_name = json['topic_name'];
    id_account = json['id_account'];
    username = json['username'];
    avt = json['avt'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['o_name'] = o_name;
    data['o_description'] = o_description;
    data['o_image'] = o_image;
    data['o_address'] = o_address;
    data['day_start'] = day_start;
    data['day_end'] = day_end;
    data['target'] = target;
    data['current'] = current;
    data['status'] = status;
    data['outstanding'] = outstanding;
    data['topic_id'] = topic_id;
    data['topic_name'] = topic_name;
    data['id_account'] = id_account;
    data['username'] = username;
    data['avt'] = avt;
    data['name'] = name;
    return data;
  }
}
