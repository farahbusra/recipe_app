import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final dynamic icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const tertiaryColor = Color(0xFFE45858);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: tertiaryColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Expanded(
                child: Text(text,
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          child: SizedBox(height: 30),
          backgroundColor: Colors.black,
          radius: 45.0,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
        ),
        SizedBox(height: 20),
        Text(
          'Natalie Portman',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22.0),
        ),
        SizedBox(height: 5),
        Text(
          'natalie.man@gmail.com',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0),
        ),
        new Divider(
          Size
          color: Colors.grey,
          thickness: 0.5,
        ),
        SizedBox(height: 15),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ProfileMenu(
              text: "My Account",
              icon: const Icon(
                Icons.person,
                color: primaryColor,
              ),
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: const Icon(
                Icons.notifications,
                color: primaryColor,
              ),
              press: () => {},
            ),
            ProfileMenu(
              text: "Recipes",
              icon: const Icon(
                Icons.book,
                color: primaryColor,
              ),
              press: () => {},
            ),
            ProfileMenu(
              text: "Logout",
              icon: const Icon(
                Icons.logout,
                color: primaryColor,
              ),
              press: () => {},
            ),
          ],
        ),
      ],
    );
  }
}
