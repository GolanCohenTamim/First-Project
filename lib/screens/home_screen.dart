
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/latest_posts.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/following_users.dart';
import '../widgets/posts_carusel.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text(
                'Whistling',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).primaryColor,
              labelStyle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontSize: 15.0),
              indicatorWeight: 4.0,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: <Widget>[
                Tab(
                  text: 'Trending',
                ),
                Tab(text: 'Latest'
                ),
              ],
            ),
          ),
          drawer: CustomDrawer(),
          body: Container(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                 children: <Widget>[
                   FollowingUsers(),
                   PostsCarusel(pageController: _pageController,
                   title: 'Trending',
                   posts: posts,)
                 ],
                ),

                ListView(
                  children: <Widget>[
                    FollowingUsers(),
                    LatestPosts(),
                    ]
                ),

              ],
              
            ),
          )),
    );
  }
}
