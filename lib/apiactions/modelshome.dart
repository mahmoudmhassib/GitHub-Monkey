class Items{
  final String title;
  final String image;
  Items( {
    required this.title,
    required this.image,
  });
  factory Items.fromJson(Map<String,dynamic> json){
    return Items(
      title:json['title'] ,
      image: json['image'],
    );

  }
}