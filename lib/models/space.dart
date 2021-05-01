class Space{
  int id;
  String name;
  int price;
  String imgUrl;
  String city;
  int rating;
  String country;

  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchen;
  int numberOfBethrum;
  int numberOfCupboard;

  Space({
    this.city, this.name, this.price, this.imgUrl, this.id, this.country, this.rating, 
    this.address,this.phone, this.mapUrl,  this.photos,this.numberOfBethrum,this.numberOfCupboard,
    this.numberOfKitchen,
    });

    Space.fromJson(json){
      id = json['id'];
      name = json['name'];
      city = json['city'];
      country = json['country'];
      imgUrl = json['image_url'];
      price = json['price'];
      rating = json['rating'];
      address = json['address'];
      phone = json['phone'];
      photos = json['photos'];
      mapUrl = json['map_url'];
      numberOfBethrum = json['number_of_bedrooms'];
      numberOfCupboard = json['number_of_cupboards'];
      numberOfKitchen = json['number_of_kitchens']; 
    }
}