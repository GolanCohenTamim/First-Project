import 'package:flutter/material.dart';
import '../data/data.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';




class LatestPosts extends StatelessWidget {
  const LatestPosts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      height: 480.0,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
        itemCount:  posts.length,
          itemBuilder: (BuildContext context, int index){
          Post post = posts[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:10.0 ),
            Text(post.title , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color:Theme.of(context).primaryColor),
            ),
            Text(post.location , style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),),
            Container(
              padding: EdgeInsets.only(top: 5.0),
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage(post.imageUrl),
            fit: BoxFit.cover,)),

            Container(
              margin: EdgeInsets.all(10.0),
              height: 20.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
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
            ),

          ],

        );


        }),

    );

  }
}
