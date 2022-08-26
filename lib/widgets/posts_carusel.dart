import 'package:asset_cache/asset_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/post_model.dart';

class PostsCarusel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;
  final imageAssets = ImageAssetCache(basePath: 'assets/images/');

  PostsCarusel({this.pageController, this.title, this.posts});
  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.30)).clamp(0.0, 1.0);
        }
        return Center(
            child: SizedBox(
          height: Curves.easeInOut.transform(value) * 300.0,
          child: widget,
        ));
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 300.0,
                width: 250.0,
                fit: BoxFit.cover,
                image: AssetImage( post.imageUrl),
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                //BOX SHADOW Column
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    post.title,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.location,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Likes Row
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.thumb_up,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            post.likes.toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      //Comments Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.comment_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            post.comments.toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        Container(
            height: 300.0,
            child: PageView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                controller: pageController,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPost(context, index);
                }))
      ],
    );
  }
}
