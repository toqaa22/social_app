class Postmodel {
  String? imageUrl;
  String? time;
  String? caption;
  String? profileImage;
  String? name;

  Postmodel({required this.imageUrl, required this.caption, required this.time, this.name, this.profileImage});

  Postmodel.fromJson(Map<String, dynamic>? json) {
    imageUrl = json!['imageUrl'];
    time = json['time'];
    caption = json['caption'];
    name = json['name'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'time': time,
      'caption': caption,
      'name': name,
      'profileImage': profileImage,
    };
  }
}
