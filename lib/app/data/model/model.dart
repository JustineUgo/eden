// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EdenOrder {
  final String id;
  final String date;
  final String name;
  final String image;
  final int quantity;
  final int price;
  EdenOrder({
    required this.id,
    required this.date,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  EdenOrder copyWith({
    String? id,
    String? date,
    String? name,
    String? image,
    int? quantity,
    int? price,
  }) {
    return EdenOrder(
      id: id ?? this.id,
      date: date ?? this.date,
      name: name ?? this.name,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }

  factory EdenOrder.fromMap(Map<String, dynamic> map) {
    return EdenOrder(
      id: map['id'] as String,
      date: map['date'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EdenOrder.fromJson(String source) => EdenOrder.fromMap(json.decode(source) as Map<String, dynamic>);
  factory EdenOrder.fixture() => EdenOrder(
        id: "1233445",
        date: "16/11/2023",
        name: "Mens Football Boots",
        image:
            'https://i5.walmartimages.com/seo/Men-s-Soccer-Shoes-Outdoor-Athletics-Training-Football-Boots-Teenagers-Cleats-Spikes-Shoes-AG-FG_5da6a687-c96f-412d-9f45-24fe291870e9.7eab2c907833594e70813a493554166b.jpeg',
        quantity: 2,
        price: 30000,
      );
      

  @override
  bool operator ==(covariant EdenOrder other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.date == date &&
      other.name == name &&
      other.image == image &&
      other.quantity == quantity &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      date.hashCode ^
      name.hashCode ^
      image.hashCode ^
      quantity.hashCode ^
      price.hashCode;
  }
}
