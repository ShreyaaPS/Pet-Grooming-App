import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petgrooming/CartPage.dart';
import 'package:petgrooming/HomePageController.dart';
import 'package:petgrooming/constants.dart';
import 'package:petgrooming/HomePage.dart';
import 'package:petgrooming/item_cart.dart';
import 'package:petgrooming/Details_Screen.dart';
import 'package:petgrooming/main_drawer.dart';

class hairstyles extends StatefulWidget {
  static const routeName = '/hairstyles';
  final Product? product;
  hairstyles({Key? key, this.product}) : super(key: key);

  @override
  State<hairstyles> createState() => _hairstylesState();
}

class _hairstylesState extends State<hairstyles> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Accessories'),
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
      drawer: MainDrawer(),
      body: Body(),
      /* appBar: AppBar(title: Text('Paws for you -Quality at it\'s best')),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPaddin,
                        crossAxisSpacing: kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => ItemCard(
                            product: products[index],
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: products[index],
                                  ),
                                )),
                          )),
                ),
              ),
            ]),
      ),*/
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),
                    )),
          ),
        ),
      ],
    );
  }
}

//PRODUCTS FILE
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
      id: 21,
      title: "Collars",
      price: 250,
      size: 12,
      description:
          'In this package you will receive 25 collars that vary in style and color.high-quality nylon strap. This collar for dogs is extra robust due to strain relief. It is durable and tear-proof. It is fully adjustable to your dog\'s neck. This collar can be used for basic dog training. It will be the right collar for your dog. ',
      image: "images/collar.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 22,
      title: "Bowls",
      price: 300,
      size: 8,
      description:
          'A ceramic or stoneware dog bowl is a great way to express your style. These bowls are often decorated with fun designs and may even be handmade by artists. Their protective glaze makes them easy to keep clean, especially if dishwasher-safe.',
      image: "images/bowl.webp",
      color: Color(0xFFD3A984)),
  Product(
      id: 23,
      title: "Chewable Bone Toys",
      price: 150,
      size: 10,
      description:
          'Chew toys are great for puppies or dogs who tend to get bored.This makes great toys for keeping your dog occupied, due to their durability. ',
      image: "images/toys.webp",
      color: Color(0xFF989493)),
  Product(
      id: 24,
      title: "Bows",
      price: 230,
      size: 11,
      description:
          'In this package you will receive 25 bows that vary in style and color.In this set you will find classic polka dot,flowery styles,tartan and many more',
      image: "images/bows.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 25,
      title: "Mutt of course mats",
      price: 800,
      size: 12,
      description:
          ' Mutt of course dog mats have an anti-skid and waterproof bottom. Meant for floor / crates / picnics / car travel etc. Lighter and easier to carry so that you can carry it wherever your doggo goes.',
      image: "images/mat.webp",
      color: Color(0xFFFB7883)),
  Product(
    id: 26,
    title: "Pedigree dog food",
    price: 650,
    size: 12,
    description:
        ' Afordable dog food.A medium size nutritionous chicken pedigree packet can be picked up',
    image: "images/ped.jpg",
    color: Color(0xFFAEAEAE),
  ),
];
