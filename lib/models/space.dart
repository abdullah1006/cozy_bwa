import 'dart:convert';

List<Space> spaceFromJson(String str) => List<Space>.from(
      json.decode(str).map(
            (x) => Space.fromJson(x),
          ),
    );

class Space {
  int? id;
  String? name;
  int? price;
  String? imageUrl;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;
  bool isFavorite;

  Space({
    this.id,
    this.city,
    this.country,
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchens,
    this.phone,
    this.photos,
    this.isFavorite = false,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      imageUrl: json['image_url'],
      price: json['price'],
      rating: json['rating'],
      address: json['address'],
      phone: json['phone'],
      mapUrl: json['map_url'],
      photos: json['photos'],
      numberOfBedrooms: json['number_of_bedrooms'],
      numberOfCupboards: json['number_of_cupboards'],
      numberOfKitchens: json['number_of_kitchens'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'city': city,
      'country': country,
      'image_url': imageUrl,
      'price': price,
      'rating': rating,
      'address': address,
      'phone': phone,
      'map_url': mapUrl,
      'photos': photos,
      'number_of_bedrooms': numberOfBedrooms,
      'number_of_cupboards': numberOfCupboards,
      'number_of_kitchens': numberOfKitchens,
    };
  }
}
