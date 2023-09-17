class PostModel {
  String userName;
  String userImageProfile;
  String post;
  String postDesription;
  bool isFavarite;
  PostModel({
    required this.userName,
    required this.userImageProfile,
    required this.post,
    required this.postDesription,
    this.isFavarite = false,
  });
}
