import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);
  final imgUrl =
      'https://media-exp1.licdn.com/dms/image/C5603AQHRjFD_0xWyTw/profile-displayphoto-shrink_200_200/0/1621868036436?e=1652918400&v=beta&t=GXUwu-E4Vv1dceRR6ieqQQkSiLxS2_7-8hQWJJ3ZJ84';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: const Text('Alex'),
              accountEmail: const Text('francisalex619@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.email_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
