import 'package:flutter/material.dart';

import '../../../../../core/util/color_constants.dart';
import 'nav_tile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kPrimaryColour,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 60.0,
              ),
              ListTile(
                leading: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: kGreyColorTint35,
                    child: Icon(
                      Icons.person,
                      size: 40.0,
                      color: Colors.white,
                    )),
                title: const Text(
                  'Mehreen Azasma',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'View Profile',
                  style: TextStyle(
                    color: kAccentColor,
                    fontSize: 14.0,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 50.0,
              ),
              NavTile(
                tileIcon: 'assets/images/nav_home_icon.svg',
                tileTitle: 'Home',
                onPressed: () {
                  //Navigator.of(context).pushReplacementNamed(HomePage.id);
                },
              ),
              NavTile(
                tileIcon: 'assets/images/nav_consultation_history_icon.svg',
                tileTitle: 'Consultation History',
                onPressed: () {},
              ),
              NavTile(
                tileIcon: 'assets/images/nav_ask_a_doctor_icon.svg',
                tileTitle: 'Ask a BIMA Doctor',
                onPressed: () {},
              ),
              NavTile(
                tileIcon: 'assets/images/nav_health_topics_icon.svg',
                tileTitle: 'Health Topics',
                onPressed: () {},
              ),
              NavTile(
                tileIcon: 'assets/images/nav_my_subscription_icon.svg',
                tileTitle: 'My Subscription',
                onPressed: () {},
              ),
              NavTile(
                tileIcon: 'assets/images/nav_find_nearest_icon.svg',
                tileTitle: 'Find The Nearest',
                onPressed: () {},
              ),
              NavTile(
                tileIcon: 'assets/images/nav_settings_icon.svg',
                tileTitle: 'Settings',
                onPressed: () {},
              ),
              NavTile(
                tileIcon: 'assets/images/nav_about_bima_icon.svg',
                tileTitle: 'About Us',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/images/img_bima_logo_name.png',
                    fit: BoxFit.cover, color: Colors.white, height: 32),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
