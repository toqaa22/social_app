class PostModel {
  String? imageUrl;
  String? time;
  String? caption;
  String? name;
  String? profileImage;

  PostModel({
    required this.imageUrl,
    required this.time,
    required this.caption,
    required this.name,
    required this.profileImage,
  });
  PostModel.fromJson(Map<String, dynamic>? json) {
    imageUrl = json!['imageUrl'];
    time = json['time'];
    caption = json['caption'];
    name = json['name'];
    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() => {
        'imageUrl': imageUrl,
        'time': time,
        'caption': caption,
        'name': name,
        'profileImage': profileImage,
      };
}
