// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petgrooming/CartPage.dart';
//import 'package:constants.dart';
//import 'package:shop_app/screens/home/components/body.dart';
import 'package:petgrooming/constants.dart';
import 'package:petgrooming/Details1Screen.dart';
import 'package:petgrooming/item1cart.dart';

import 'HomePageController.dart';

class Spa extends StatefulWidget {
  static const routeName = '/Spa';
  final Product? product;
  Spa({Key? key, this.product}) : super(key: key);

  @override
  State<Spa> createState() => _SpaState();
}

class _SpaState extends State<Spa> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaServices'),
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
      body: Body(),
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
                itemBuilder: (context, index) => Item1Card(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details1Screen(
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
      id: 11,
      title: "Body Brushing",
      price: 150,
      size: 12,
      description:
          'Regular brushing removes excess hair from your dog’s coat and cuts down significantly on the amount of hair you have to deal with on your furniture, car, and your favorite black pants. It also helps distribute the natural oils in your dog’s fur and skin, keeping their coat healthy and looking its best.',
      image: "images/brush.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 12,
      title: "Teeth Cleansing",
      price: 220,
      size: 8,
      description:
          'Teeth brushing is very essential for your pets. Without brushing, plaque can build up putting your pet at risk for bad breath, gum disease and tooth decay. It can also cause painful infections. We use specially designed tooth brushes or recommended alternative and pet toothpaste specially made for them.',
      image: "images/teeth1.jpg",
      color: Color(0xFFD3A984)),
  Product(
      id: 13,
      title: "Nail Trimming",
      price: 250,
      size: 10,
      description:
          'Nail trimming for your pets is essential for maintaining their good health. If nails are allowed to grow, they will curl over into a spiral shape ; walking will become painful to your pets as they grow putting pressure on their toes. It is also likely to prevent injuries to you',
      image: "images/nail1.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 14,
      title: "Eye Stain Removal",
      price: 300,
      size: 11,
      description:
          'There are a number of reasons that lead to tear staining. It can be caused by the irritation of an ingrown eyelash, an inverted eyelid, or hair growing too close to the eye. Or, it could be that your dog’s tear ducts aren’t draining properly. There are also several medical conditions that produce excessive tears, such as glaucoma and chronic eye infections.Here naturally we remove eye stains using White Vinegar/Apple Cider Vinegar ,Milk of Magnesia or Hydrogen Peroxide',
      image: "images/eye3.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 15,
      title: "Ear Cleansing",
      price: 150,
      size: 12,
      description:
          ' Heavy, matted, moist ears flaps, surrounding hair and excessively hairy ear canals will decrease the air flow to the ears canal, making it possible for wax and other debris to build up and potentially leading to infections. Excess, dirty, or matted hair should be removed around the ear canal and ear flap',
      image: "images/ear.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 16,
    title: "Face Trim",
    price: 170,
    size: 12,
    description:
        ' Keeping your dog’s face clean and groomed is important, not just for your dog, but also for you. Your dog’s long hair may irritate their eyes or ears, causing them discomfort. Their hair may also become matted with food and debris if they aren’t groomed regularly. Trim your dog’s face every 2 to 4 weeks to keep them comfortable and happy.',
    image: "images/face1.jpg",
    color: Color(0xFFAEAEAE),
  ),
];
