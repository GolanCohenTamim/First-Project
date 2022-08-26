import 'package:flutter/material.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/posts_carusel.dart';

import '../models/user_model.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _yourPostController;
  PageController _favoritesController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300.0,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 40.0,
                    left: 20.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    )),
                Positioned(
                    bottom: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0),
                        ],
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 120.0,
                          width: 120.0,
                          image: AssetImage(widget.user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 26.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarusel(
              pageController: _yourPostController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostsCarusel(
              pageController: _favoritesController,
              title: 'Favorites',
              posts: widget.user.favorites,
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
