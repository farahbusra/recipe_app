import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color(0xFFFFFFFE);
const paragraphColor = Color(0xFF2B2C34);
const buttonTextColor = Color(0xFFFFFFFE);
const buttonColor = Color(0xFF6246EA);
const secondaryColor = Color(0xFFD1D1E9);
const tertiaryColor = Color(0xFFE45858);

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: tertiaryColor,
        ),
        onPressed: press,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Expanded(
                child: Text(text,
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ))),
            const Icon(
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
  void showAlertLogout(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          'Are you sure you want to exit?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => Navigator.pop(context, 'Cancel'),
              ),
              TextButton(
                child: const Text('Yes',
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                onPressed: () => SystemNavigator.pop(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showAlertNotifications(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text(
          'Do you want to turn on notifications?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () => Navigator.pop(context, 'Cancel'),
              ),
              TextButton(
                child: const Text('Yes',
                    style: TextStyle(
                      color: buttonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
                onPressed: () => Navigator.pop(context, 'Yes'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(color: primaryColor, fontSize: 22),
            ),
          ],
        ),
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: buttonColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
            ),
            SizedBox(height: 20),
            Text(
              'Natalie Portman',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'natalie.man@gmail.com',
              style: TextStyle(
                color: paragraphColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Divider(
              color: Colors.grey,
              thickness: 0.6,
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
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
                    press: () => {showAlertNotifications(context)},
                  ),
                  ProfileMenu(
                    text: "Recipes",
                    icon: const Icon(
                      Icons.dining,
                      color: primaryColor,
                    ),
                    press: () => {},
                  ),
                  ProfileMenu(
                    text: "FAQ",
                    icon: const Icon(
                      Icons.question_mark,
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
                    press: () => {
                      showAlertLogout(context),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
