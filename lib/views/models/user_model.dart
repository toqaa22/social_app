class UserModel {
  String? name;
  String? phoneNo;
  String? id;
  String?profileImage;
  String? bio;

  List<PostImage>? postImages;

  UserModel(this.name, this.id, this.phoneNo,this.profileImage,this.bio,this.postImages);

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    phoneNo = json['phoneNo'];
    id = json['id'];
    profileImage = json['profileImage'];
    bio =json['bio'];




  }

  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'phoneNo':phoneNo,
      'id': id,
      'profileImage':profileImage,
      'bio':bio,



    };
  }




}

 class PostImage {
   final String imageUrl;
   final DateTime time;
   final String caption;

   PostImage({
     required this.imageUrl,
     required this.time,
     required this.caption
   });
 }
