// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:loginui/colors.dart';

// ignore: use_key_in_widget_constructors
class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  decoration: BoxDecoration(color: Colors.transparent),
                  accountName: Text("Your Name"),
                  accountEmail: Text("Youremail@email.com")),
            ),
            MenuList(title: "Orders", iconName: Icons.border_color),
            MenuList(iconName: Icons.bookmark, title: "Address"),
            MenuList(iconName: Icons.notifications, title: "Notification"),
            MenuList(iconName: Icons.help, title: "Help"),
            MenuList(iconName: Icons.account_box, title: "About"),
            MenuList(iconName: Icons.star_half, title: "Rate Us"),
            MenuList(iconName: Icons.exit_to_app, title: "Log Out"),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String title;
  final IconData iconName;
   // ignore: prefer_const_constructors_in_immutables
   MenuList({
   Key? key,
    required this.title,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            iconName,
            color: Colors.white,
          )),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
