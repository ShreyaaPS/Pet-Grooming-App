// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petgrooming/CartPage.dart';
import 'package:petgrooming/HomePageController.dart';
import 'package:petgrooming/constants.dart';
import 'package:petgrooming/HomePage.dart';
import 'package:petgrooming/itemModel.dart';

class Bath extends StatefulWidget {
  static const routeName = '/Bath';
  const Bath({
    Key? key,
    this.product,
  }) : super(key: key);

  final Product? product;

  @override
  State<Bath> createState() => _BathState();
}

class _BathState extends State<Bath> {
  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();

    void addToCart(HomePageController controller,
        {int? id,
        double? price,
        String? image,
        String? name,
        String? description}) async {
      final ShopItemModel model = ShopItemModel(
        id: id!,
        price: price!,
        image: image!,
        name: name!,
        description: description!,
      );
      try {
        var result = await controller.addToCart(model);
        controller.getCardList();
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
              const SnackBar(content: Text("Item added in cart successfully")));
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bath services'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkResponse(
                onTap: () async {
                  final result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                  if (result == "success") {
                    setState(() {});
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text("Order placed"),
                        ),
                      );
                  }
                },
                child: Stack(
                  children: [
                    GetBuilder<HomePageController>(
                        builder: (_) => Align(
                              child: Text(controller.cartItems.length > 0
                                  ? controller.cartItems.length.toString()
                                  : ''),
                              alignment: Alignment.topLeft,
                            )),
                    Align(
                      child: Icon(Icons.shopping_cart),
                      alignment: Alignment.center,
                    ),
                  ],
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Bathing Services',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              height: 400,
              //height: MediaQuery.of(context).size.height *
              //    0.3, // ignore this, cos I am giving height to the container
              //width: MediaQuery.of(context).size.width *
              //  0.5, // ignore this, cos I am giving width to the container
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/golden-retriever-dog-in-a-grooming-salon-is-taking-a-shower-picture-id1277453154?b=1&k=20&m=1277453154&s=170667a&w=0&h=d8QuEs4oDJjJKnHqpuXdBR7-k7YvJ5tH4Sh0XcC7OyM='))),
              /*alignment: Alignment
                      .bottomRight, // This aligns the child of the container
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0), //some spacing to the child from bottom
                      child:
                          Text('Click here to view the various styles provided',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              )))*/
            ),
            /* SizedBox(height: 20.0),
          Text(
            'Flee Bath',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),*/

            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Text(
            "Hair Cutting Styles",
            style: TextStyle(color: Colors.white),
          ),*/
                  Text(
                    'Orange Peel Oil Bath',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'To achieve this style, the hair on the body and neck is clipped short, leaving the hair longer on the head and legs. This is not a breed-specific haircut, but it’s often seen on poodles.',
                      style: TextStyle(height: 1.5)),
                  SizedBox(height: kDefaultPaddin),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                              text: " Price:Rs 234",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: Colors.grey,
                          onPressed: () {
                            addToCart(
                              controller,
                              id: 1,
                              name: "Orange Peel Oil Bath",
                              description:
                                  "To achieve this style, the hair on the body and neck is clipped short, leaving the hair longer on the head and legs. This is not a breed-specific haircut, but it’s often seen on poodles.",
                              image:
                                  "https://media.istockphoto.com/photos/golden-retriever-dog-in-a-grooming-salon-is-taking-a-shower-picture-id1277453154?b=1&k=20&m=1277453154&s=170667a&w=0&h=d8QuEs4oDJjJKnHqpuXdBR7-k7YvJ5tH4Sh0XcC7OyM=",
                              price: 234.00,
                            );
                          },
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /*SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )*/
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Text(
            "Hair Cutting Styles",
            style: TextStyle(color: Colors.white),
          ),*/
                  Text(
                    'Blow dry',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Drying your pet dog\'s hair after taking bath is as important as bathing itself.Double coat hair must be taken care of.Here we solve this problem using force dryer by blasting water off your pet\'s coat.It i also helpful in blasting shedding hair',
                      style: TextStyle(height: 1.5)),
                  SizedBox(height: kDefaultPaddin),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                              text: " Price: Rs 234",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: Colors.grey,
                          onPressed: () {
                            addToCart(
                              controller,
                              id: 1,
                              name: "Blow dry",
                              description:
                                  "To achieve this style, the hair on the body and neck is clipped short, leaving the hair longer on the head and legs. This is not a breed-specific haircut, but it’s often seen on poodles.",
                              image:
                                  "https://media.istockphoto.com/photos/golden-retriever-dog-in-a-grooming-salon-is-taking-a-shower-picture-id1277453154?b=1&k=20&m=1277453154&s=170667a&w=0&h=d8QuEs4oDJjJKnHqpuXdBR7-k7YvJ5tH4Sh0XcC7OyM=",
                              price: 234.00,
                            );
                          },
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /*SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )*/
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Text(
            "Hair Cutting Styles",
            style: TextStyle(color: Colors.white),
          ),*/
                  Text(
                    'Oatmeal and Aloe',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'HELPS RELIEVE ITCHING & DRY SKIN: Specially formulated to address the needs of pets with dry, itchy skin. Colloidal oatmeal and organic aloe vera help combat skin irritation, promote healing, and re-moisturize sensitive, dry skin. This concentrated shampoo is soap free and pH-balanced to clean and deodorize safely and thoroughly, leaving your pet\'s coat soft, plush, and smelling better than ever.',
                      style: TextStyle(height: 1.5)),
                  SizedBox(height: kDefaultPaddin),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                              text: " Price: Rs 234",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: Colors.grey,
                          onPressed: () {
                            addToCart(
                              controller,
                              id: 1,
                              name: "Oatmeal and Aloe",
                              description:
                                  "HELPS RELIEVE ITCHING & DRY SKIN: Specially formulated to address the needs of pets with dry, itchy skin. Colloidal oatmeal and organic aloe vera help combat skin irritation, promote healing, and re-moisturize sensitive, dry skin. This concentrated shampoo is soap free and pH-balanced to clean and deodorize safely and thoroughly, leaving your pet\'s coat soft, plush, and smelling better than ever.",
                              image:
                                  "https://media.istockphoto.com/photos/golden-retriever-dog-in-a-grooming-salon-is-taking-a-shower-picture-id1277453154?b=1&k=20&m=1277453154&s=170667a&w=0&h=d8QuEs4oDJjJKnHqpuXdBR7-k7YvJ5tH4Sh0XcC7OyM=",
                              price: 234.00,
                            );
                          },
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /*SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )*/
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Text(
            "Hair Cutting Styles",
            style: TextStyle(color: Colors.white),
          ),*/
                  Text(
                    'Whitening ',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'This treatment is intended for dogs with dull white coats. It includes a whitening (non-bleach) shampoo and rich conditioning treatment to intensify your pooch’s coat colour. Does not stain the outer layer of the hair surface, thus allowing passage of light through the translucent hair surface to amplify gloss and colour. We advise combining this with our Tear Stain Treatment for a complete whitening experience.',
                      style: TextStyle(height: 1.5)),
                  SizedBox(height: kDefaultPaddin),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                              text: " Price: Rs 234",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: Colors.grey,
                          onPressed: () {
                            addToCart(
                              controller,
                              id: 1,
                              name: "Whitening",
                              description:
                                  "This treatment is intended for dogs with dull white coats. It includes a whitening (non-bleach) shampoo and rich conditioning treatment to intensify your pooch’s coat colour. Does not stain the outer layer of the hair surface, thus allowing passage of light through the translucent hair surface to amplify gloss and colour. We advise combining this with our Tear Stain Treatment for a complete whitening experience.",
                              image:
                                  "https://media.istockphoto.com/photos/golden-retriever-dog-in-a-grooming-salon-is-taking-a-shower-picture-id1277453154?b=1&k=20&m=1277453154&s=170667a&w=0&h=d8QuEs4oDJjJKnHqpuXdBR7-k7YvJ5tH4Sh0XcC7OyM=",
                              price: 234.00,
                            );
                          },
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /*SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )*/
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Text(
            "Hair Cutting Styles",
            style: TextStyle(color: Colors.white),
          ),*/
                  Text(
                    'Flee Bath',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Fleas leave tiny, red, raised dots on your dog’s skin. They are typically smaller than other insect bites, although they can become inflamed after a dog scratches. Some dogs have a stronger reaction to flea bites than others, which creates a much larger red area.So flee treatment is neccessary',
                      style: TextStyle(height: 1.5)),
                  SizedBox(height: kDefaultPaddin),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                              text: " Price: Rs 234",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          color: Colors.grey,
                          onPressed: () {
                            addToCart(
                              controller,
                              id: 1,
                              name: "Flee bath",
                              description:
                                  "Fleas leave tiny, red, raised dots on your dog’s skin. They are typically smaller than other insect bites, although they can become inflamed after a dog scratches. Some dogs have a stronger reaction to flea bites than others, which creates a much larger red area.So flee treatment is neccessary",
                              image:
                                  "https://media.istockphoto.com/photos/golden-retriever-dog-in-a-grooming-salon-is-taking-a-shower-picture-id1277453154?b=1&k=20&m=1277453154&s=170667a&w=0&h=d8QuEs4oDJjJKnHqpuXdBR7-k7YvJ5tH4Sh0XcC7OyM=",
                              price: 234.00,
                            );
                          },
                          child: Text(
                            "Add to Cart".toUpperCase(),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      /*SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )*/
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String? image, title, description;
  final int? price, size, id;
  final Color? color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Flee Bath",
    price: 234,
    //size: 12,
    description:
        'To achieve this style, the hair on the body and neck is clipped short, leaving the hair longer on the head and legs. This is not a breed-specific haircut, but it’s often seen on poodles.',
  ),
  Product(
    id: 2,
    title: "Lion Cut",
    price: 234,
    description:
        'Just like it sounds, this is when the hair cut resembles a lion’s mane. Body hair is cut short, while the hair on the neck and head is left much longer in comparison.',
  ),
  Product(
    id: 3,
    title: "The Practical Top-Knot",
    price: 234,
    description:
        'This style is usually seen in long-haired dogs such as Lhasa Apso, Maltese or Shih Tzu. In the Top-Knot, some of the hair on the head is gathered and secured with a band or clip, making a sort of a ponytail. Hair on the rest of the body can be clipped to any length.',
  ),
  Product(
    id: 4,
    title: "Schnauzer Cut",
    price: 234,
    description:
        'Contrary to its name, this cut isn’t just for Schnauzers. Appropriate for large and small dogs alike, it leaves longer hair on the dog’s legs while trimming the back and sides very short. Its distinguishing characteristic is the light fringe of hair left on the lower side of the dog’s body, and a little ‘mustache’ cut around the dog’s face.',
  ),
  Product(
    id: 5,
    title: "Teddy Bear Cut",
    price: 234,
    description:
        ' This is basically the opposite of the Lion Cut, where we trim the hair on the head shorter, but leave the hair on the rest of the body longer – it can be clipped to any length, as per the pet parent’s preference. The end-result resembles a Teddy Bear.',
  ),
  Product(
    id: 6,
    title: "Puppy Cut",
    price: 234,
    description:
        ' This is really another name for what we call a Neaten without the feathering, where the hair is cut to a uniform length all over the body. Usually, 1-2 inches of fur is left behind. Because it’s short all over, there isn’t the need for much grooming once you get home.',
  ),
];
