//import 'package:grooming/Start.dart';
//import 'dart:html';

// ignore_for_file: file_names

import 'package:petgrooming/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:petgrooming/main_drawer.dart';
import './main_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        user = firebaseUser!;
        isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Paws for you-Quality at it\'s best')),
        drawer: MainDrawer(),
        body: Container(
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn2.vectorstock.com/i/thumb-large/03/41/pet-grooming-and-washing-vector-23730341.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.petsecure.com.au/wp-content/uploads/2019/05/Dog-grooming.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://static.onecms.io/wp-content/uploads/sites/24/2020/05/28/2640602_petsHiGettyImages-1068118124-2000.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://st.depositphotos.com/1063397/1965/i/950/depositphotos_19659581-stock-photo-bathroom-to-a-dog.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //5th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTepmCI3twS8fsnfTPBuyei-TcPKrE1zl4sbQ&usqp=CAU'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 250.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                    /*SizedBox(height: 40.0),
                Container(
                  height: 300,
                  child: Image(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),*/
                    Column(
                      // this makes the column height hug its content
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // first row
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            Text(
                              'QUALIFIED GROOMERS',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            Text(
                              'FULL FLEDGED HYGIENIC GROOMING',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        // second row (single item)
                        /*Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 0,
                          ),
                          child: Text(
                            'Send programmable push notifications to iOS and Android devices with delivery and open rate tracking built in.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),*/

                        // third row
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            Text(
                              'TOP QUALITY SERVICES PROVIDED ',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0),
                    Text(
                      'Pet grooming covers everything involved in caring for a pet’s hygiene, cleaning, and physical appearance. The necessary frequency of pet grooming is dependent on the breed, age and health of the pet but grooming is sure to keep your pet healthy and comfortable.',
                      style: TextStyle(
                          background: Paint()
                            ..strokeWidth = 30.0
                            ..color = Colors.orangeAccent
                            ..style = PaintingStyle.stroke,
                          //..strokeJoin = StrokeJoin.round,
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                            ),
                            Text(
                              'Working hours',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                            ),
                            Text(
                              'Monday-Friday:5pm to 9pm',
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                            ),
                            Text(
                              'Saturday-Sunday:10am to 2pm,5pm to 9pm',
                              style: TextStyle(
                                color: Colors.black,
                                //fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "Hello ${user.displayName} you are Logged in as ${user.email}",
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: signOut,
                      child: Text('Signout',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
        ));
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: !isloggedin
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Container(
                  height: 300,
                  child: Image(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Text(
                    "Hello ${user.displayName} you are Logged in as ${user.email}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: signOut,
                  child: Text('Signout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              ],
            ),
    ));
  }*/
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Anoo\'s Pet Grooming Studio'),
        backgroundColor: Colors.blue,
      ),
      body: _MainScreen(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.blue, Colors.lightBlueAccent])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        elevation: 10,
                        child: Image.asset('images/start.jpg',
                            width: 100, height: 100),
                      ),
                      Padding(padding: EdgeInsets.all(2.0)),
                      Text('QuickNavigationBar',
                          style: TextStyle(
                            fontSize: 15,
                          ))
                    ],
                  ),
                )),
            CustomTitle(Icons.account_circle, 'profile', () => {}),
            CustomTitle(Icons.featured_play_list, 'feedback', () => {}),
            CustomTitle(Icons.home, 'homepage', () => {}),
            CustomTitle(Icons.shopping_cart, 'view cart', () => {}),
            CustomTitle(Icons.lock, 'logout',
                () => {}),
          ],
        ),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;
  CustomTitle(this.icon, this.title, this.onTap());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: InkWell(
          splashColor: Colors.blueAccent,
          onTap: onTap,
          child: Container(
            height: 40.0,
            child: Row(
              children: <Widget>[
                Icon(icon),
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }*/

}

/*class _MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn2.vectorstock.com/i/thumb-large/03/41/pet-grooming-and-washing-vector-23730341.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.petsecure.com.au/wp-content/uploads/2019/05/Dog-grooming.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://static.onecms.io/wp-content/uploads/sites/24/2020/05/28/2640602_petsHiGettyImages-1068118124-2000.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://st.depositphotos.com/1063397/1965/i/950/depositphotos_19659581-stock-photo-bathroom-to-a-dog.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTepmCI3twS8fsnfTPBuyei-TcPKrE1zl4sbQ&usqp=CAU'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 250.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}*/