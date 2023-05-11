class Postmodel{
  String? imageUrl;
  String? time;
  String? caption;
  String?profileimage;
  String?name;

  Postmodel({required this.imageUrl,required this.caption,required this.time,this.name,this.profileimage});

  Postmodel.fromJson(Map<String, dynamic>? json) {
    imageUrl = json!['imageUrl'];
    time = json['time'];
    caption = json['caption'];
    name = json['name'];
    profileimage = json['profileimage'];





  }

  Map<String,dynamic>toMap(){
    return {
      'imageUrl':imageUrl,
      'time':time,
      'caption':caption,
      'name':name,
      'profileimage':profileimage,


    };
  }

}