import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0),
          child: Text(
            'Following',
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 3.0)
                        ],
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(user.profileImageUrl),
                          height: 60.0,
                          width: 60.0,
                          fit: BoxFit.cover,
                        ),
                      )),
                );
              }),
        ),
      ],
    );
  }
}
