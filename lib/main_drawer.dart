import 'package:flutter/material.dart';
import 'package:petgrooming/feedback_screen.dart';
import './cart.dart';
import 'package:petgrooming/cart.dart';
import './Services.dart';
import 'package:petgrooming/Services.dart';
import 'package:petgrooming/HomePage.dart';
import 'CartPage.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.orange,
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10,
                    child:Image.network('https://www.animaltalk.com.au/wp-content/uploads/2018/07/dog-and-human-together-.png')
                    //child: Image.asset('images/start.jpg',
                      //  width: 100, height: 100),
                  ),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Text('Navigate to explore',
                      style: TextStyle(
                        fontSize: 15,
                      ))
                ],
              ),
            ),
          ),
          /*ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),*/
           ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'HomePage',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              Navigator.of(context).pop();
              await Navigator.of(context).pushNamed(HomePage.routeName);
            },
          ),
           ListTile(
            leading: Icon(Icons.pets),
            title: Text(
              'Services',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              Navigator.of(context).pop();
              await Navigator.of(context).pushNamed(Services.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.featured_play_list),
            title: Text(
              'feedback',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              Navigator.of(context).pop();
              final result = await Navigator.of(context)
                  .pushNamed(FeedbackScreen.routeName);
              debugPrint(result.toString());
              
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(
              'View cart',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              Navigator.of(context).pop();
              await Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
         
         
        ],
      ),
    );
  }
}
