import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';
import '../models/user_model.dart';
import '../screens/home_screen.dart';



class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      onTap: onTap,
    );
  }

  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10.0,
                left: 10.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(currentUser.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.white,
                            letterSpacing: 1.5)),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
              Icon(
                Icons.chat,
                color: Colors.black,
              ),
              'Chat',
              () {}
          ),
          _buildDrawerOption(
              Icon(
                Icons.location_on_rounded,
                color: Colors.black,
              ),
              'Map',
              () {}
          ),

          _buildDrawerOption(
            Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ProfileScreen(
                        user: currentUser,
                      )),
            ),
          ),
          _buildDrawerOption(
              Icon(
                Icons.settings,
                color: Colors.black,
              ),
              'Settings',
              () {}
          ),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(
                Icon(
                  Icons.directions_run,
                  color: Colors.red,
                ),
                'Logout',
                () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()))),
          ))
        ],
      ),
    );
  }
}
