// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petgrooming/HomePageController.dart';
import 'package:petgrooming/itemModel.dart';
import 'constants.dart';
import 'hairstyles.dart';
//import 'constants.dart';
import 'package:petgrooming/product_title_with_image.dart';
import 'package:petgrooming/hairstyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'CustomButton.dart';
class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(title: Text('Paws for you -Quality at it\'s best')),
      body: Body(product: product),
    );
    // It provide us total height and width
    /*Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );*/
  }
}

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      //CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description!,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddToCart extends StatelessWidget {
  AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  /*Map data;
  addData() {
    Map<String, dynamic> demodata = {"title": "hello", "price": "234"};
    CollectionReference collectionReference =
        Firestore.instance.collection('data');
    collectionReference.add(data);
  }*/

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();

    void addToCart(HomePageController controller) async {
      final ShopItemModel model = ShopItemModel(
        id: product.id,
        price: product.price!.toDouble(),
        image: product.image,
        name: product.title,
        description: product.description,
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          /*Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: product.color,
              ),
              onPressed: () {},
            ),
          ),*/
         /* Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: product.color,
                onPressed: () => addToCart(controller),
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
          ),*/
          GetBuilder<HomePageController>(builder: (_) {
                bool isAdded = controller.isAlreadyInCart(product.id);
                if (isAdded) {
                  return CustomButton(
                    name: "REMOVE CART",
                    onTap: () async {
                      try {
                        controller.removeFromCart(product.id!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Item removed from cart successfully")));
                      } catch (e) {
                        print(e);
                      }
                    },
                  );
                }
                return CustomButton(
                  name: "ADD TO CART",
                  onTap: controller.isLoading
                      ? null
                      : () async {
                          try {
                            addToCart(controller);
                            //var result = await controller.addToCart();
                            controller.getCardList();
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(const SnackBar(
                                  content:
                                      Text("Item added in cart successfully")));
                          } catch (e) {
                            print(e);
                          }
                        },
                );
              })
        ],
      ),
    );
  }
}

/*class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}*/