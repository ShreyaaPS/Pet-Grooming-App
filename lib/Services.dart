import 'package:flutter/material.dart';

import 'package:petgrooming/HomePage.dart';
import './hairstyles.dart';
import 'package:petgrooming/hairstyles.dart';
import './Spa.dart';
import 'Bath.dart';
import 'package:petgrooming/main_drawer.dart';
import 'hair.dart';
class Services extends StatelessWidget {
  static const routeName = '/Services';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paws for you -Quality at it\'s best')),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'We can do anything you wish as long as your pet has the coat to support it. We will be happy to make suggestions, but it’s your choice and we listen. Pets haircut service, Pets haircut service in Chennai.',
              style: TextStyle(
                background: Paint()
                  ..strokeWidth = 30.0
                  ..color = Colors.lightBlueAccent
                  ..style = PaintingStyle.stroke
                  ..strokeJoin = StrokeJoin.round,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'HAIRSTYLES',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Hair.routeName);
              },
              child: Container(
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
                            'https://previews.123rf.com/images/larisaglushkova/larisaglushkova1904/larisaglushkova190400015/124386861-dogs-grooming-haircut-puppy-salon-for-animals.jpg'))),
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
            ),
            SizedBox(height: 20.0),
            Text(
              'SPA SERVICES',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Spa.routeName);
              },
              child: Container(
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
                            'https://d2qpatdq99d39w.cloudfront.net/wp-content/uploads/2020/01/07132025/dog-spa-2.jpg'))),
                /* alignment: Alignment
                      .bottomRight, // This aligns the child of the container
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0), //some spacing to the child from bottom
                      child: Text('Hello',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))*/
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'BATHING SERVICES',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Bath.routeName);
              },
              child: Container(
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
                            'https://www.nicepng.com/png/detail/67-676097_dog-spas-in-europe-spa-dog.png'))),
                /* alignment: Alignment
                      .bottomRight, // This aligns the child of the container
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0), //some spacing to the child from bottom
                      child: Text('Hello',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))*/
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'PET ACCESSORIES',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(hairstyles.routeName);
              },
              child: Container(
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
                            'https://static.vecteezy.com/system/resources/thumbnails/000/154/037/small/free-dogs-accessories-line-icon-vector.jpg'))),
                /* alignment: Alignment
                      .bottomRight, // This aligns the child of the container
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.0), //some spacing to the child from bottom
                      child: Text('Hello',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            GestureDetector(
             onTap: () {
              Navigator.of(context).pushNamed(hairstyles.routeName);
            },
              
              child: Image.network(
                'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Show text here',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
            ),
            
            
          ],
        ),
      ),*/