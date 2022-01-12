// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

var data = [
  {
    "name": "Lamb Cut",
    "price": 150.0,
    "fav": false,
    "rating": 4.5,
    "description":
        "To achieve this style, the hair on the body and neck is clipped short, leaving the hair longer on the head and legs. This is not a breed-specific haircut, but it’s often seen on poodles.",
    "image":
        "https://nationalpurebreddogday.com/wp-content/uploads/2016/03/12310575_514606248706475_2541310186079438272_n.jpg",
    //"https://rukminim1.flixcart.com/image/832/832/jao8uq80/shoe/3/r/q/sm323-9-sparx-white-original-imaezvxwmp6qz6tg.jpeg?q=70"
  },
  {
    "name": "Lion Cut",
    "price": 250.0,
    "fav": false,
    "rating": 4.5,
    "description":
        "Just like it sounds, this is when the hair cut resembles a lion’s mane. Body hair is cut short, while the hair on the neck and head is left much longer in comparison.",
    "image":
        "https://glamorousdogs.com/blog/wp-content/uploads/2019/05/lion-dog-haircut.jpg",
    //"https://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/merrell_0.jpg?itok=wFRPiIPw"
  },
  {
    "name": "Puppy Cut",
    "price": 110.0,
    "fav": false,
    "rating": 4.5,
    "description":
        "This is really another name for what we call a Neaten without the feathering, where the hair is cut to a uniform length all over the body. Usually, 1-2 inches of fur is left behind. Because it’s short all over, there isn’t the need for much grooming once you get home.",
    "image":
        "https://i.pinimg.com/474x/3a/34/14/3a341416a7143f0b8299b549600a2379--puppy-cut-maltese-maltese-haircut.jpg",
    //"https://n4.sdlcdn.com/imgs/d/h/i/Asian-Gray-Running-Shoes-SDL691594953-1-2127d.jpg"
  },
  {
    "name": "Teddy Bear Cut",
    "price": 160.0,
    "fav": false,
    "rating": 3.5,
    "description":
        "This is basically the opposite of the Lion Cut, where we trim the hair on the head shorter, but leave the hair on the rest of the body longer – it can be clipped to any length, as per the pet parent’s preference. The end-result resembles a Teddy Bear",
    "image":
        "https://i.pinimg.com/originals/ea/6e/8b/ea6e8bea6c1b4f3bb47ff073f606f61b.jpg",
    //"https://cdn.pixabay.com/photo/2014/06/18/18/42/running-shoe-371625_960_720.jpg"
  },
  {
    "name": "The Practical Top-Knot",
    "price": 250.0,
    "fav": false,
    "rating": 4.5,
    "description":
        "This style is usually seen in long-haired dogs such as Lhasa Apso, Maltese or Shih Tzu. In the Top-Knot, some of the hair on the head is gathered and secured with a band or clip, making a sort of a ponytail. Hair on the rest of the body can be clipped to any length.",
    "image":
        "https://iheartdogs.com/wp-content/uploads/2017/01/14993536_371744223172233_769859934824158915_n.jpg",
    //"https://pixel.nymag.com/imgs/fashion/daily/2018/04/18/uglee-shoes/70-fila-disruptor.w710.h473.2x.jpg"
  },
  {
    "name": "Schnauzer Cut",
    "price": 120.0,
    "fav": false,
    "rating": 4.0,
    "description":
        "Contrary to its name, this cut isn’t just for Schnauzers. Appropriate for large and small dogs alike, it leaves longer hair on the dog’s legs while trimming the back and sides very short. Its distinguishing characteristic is the light fringe of hair left on the lower side of the dog’s body, and a little ‘mustache’ cut around the dog’s face.",
    "image":
        "https://i.pinimg.com/originals/0e/11/46/0e11461bb5ccf122a7c8f4f62540012c.jpg",
    //"https://n.nordstrommedia.com/ImageGallery/store/product/Zoom/9/_100313809.jpg?h=365&w=240&dpr=2&quality=45&fit=fill&fm=jpg"
  },
  /*{
    "name": "ShoeGuru",
    "price": 205.0,
    "fav": false,
    "rating": 4.0,
    "image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc_R7jxbs8Mk2wjW9bG6H9JDbyEU_hRHmjhr3EYn-DYA99YU6zIw"
  },
  {
    "name": "Shoefly black",
    "price": 200.0,
    "fav": false,
    "rating": 4.9,
    "image":
        "https://rukminim1.flixcart.com/image/612/612/j95y4cw0/shoe/d/p/8/sho-black-303-9-shoefly-black-original-imaechtbjzqbhygf.jpeg?q=70"
  }*/
];

class ShopItemModel {
  String? name;
  double? price;
  bool? fav;
  double? rating;
  String? image;
  int? id;
  int? shopId;
  String? description;

  ShopItemModel(
      {this.shopId,
      this.id,
      this.fav,
      this.rating,
      this.price,
      this.image,
      this.name,
      this.description});

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}
