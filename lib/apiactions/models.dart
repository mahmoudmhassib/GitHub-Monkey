class Product{
 final  int id;
 final String title;
 final String menuType;
 final  int price;
 final  int oldPrice;
 final double rating;
 final String details;
 final String image;
 Product( {
   required this.id,
   required this.title,
   required this.menuType,
   required this.price,
   required this.rating,
   required this.details,
   required this.image,
   required this.oldPrice,
});
 factory Product.fromJson(Map<String,dynamic> json){
   return Product(
       id: json['id'],
       title:json['title'] ,
       menuType: json['menuType'],
       price: json['price'],
       rating: json['rating'],
       details: json['details'],
       image: json['image'],
     oldPrice: json['oldPrice'],
   );

 }
}