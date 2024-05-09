class Organization {
  int? id;
  String? o_name;
  String? o_description;
  String? o_image;
  DateTime? day_start;
  DateTime? day_end;
  double? target;
  double? current;
  int? status;
  bool? outstanding;
  int? topic_id;
  int? id_account;
  String? username;
  String? avt;
  String? name;
  Organization(
      {this.id,
      this.o_name,
      this.o_description, this.o_image,
      this.day_start,
      this.day_end,
      this.target,
      this.current,
      this.status,
      this.outstanding,
      this.topic_id,
      this.id_account,
      this.username,
      this.avt,
      this.name});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    o_name = json['o_name'];
    o_description = json['o_description'];
    o_image = json['o_image'];
    day_start = DateTime.parse(json['day_start'] as String);
    day_end = json['day_end'];
    target = json['target'] == null ? 0 : json['target'].toDouble();
    current = json['current'] == null ? 0 : json['current'].toDouble();
    status = json['status'];
    outstanding = json['outstanding'];
    topic_id = json['topic_id'];
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
    data['day_start'] = day_start;
    data['day_end'] = day_end;
    data['target'] = target;
    data['current'] = current;
    data['status'] = status;
    data['outstanding'] = outstanding;
    data['topic_id'] = topic_id;
    data['id_account'] = id_account;
    data['username'] = username;
    data['avt'] = avt;
    data['name'] = name;
    return data;
  }
}
