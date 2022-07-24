import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/util/button_constants.dart';
import '../../../core/util/color_constants.dart';
import '../pages/docto_profile_screen.dart';

class DoctorInFoWidget extends StatelessWidget {
  const DoctorInFoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 10),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: kGreyColorTint35,
          child: SvgPicture.asset(
            'assets/images/nav_about_bima_icon.svg',
            height: 40.0,
            width: 40.0,
          ),
        ),
        title: const Text(
          'Mehreen Azasma',
          style: TextStyle(
            color: kPrimaryColorTint100,
            fontSize: 16.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            package: 'common_library_package',
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 5,
            ),
            Text(
              'Specialization',
              style: TextStyle(
                color: kPrimaryColorTint110,
                fontSize: 14.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Description ,hjwcbdjhcbewjchbjhbbewjhebbjwhbjhbewcwbcjhbcwjwbjhwbcjhbwjhbwhjbjwhdbwhedbhwcbhcbw',
              style: kSubtitleCondensedText,
            ),
          ],
        ),
        trailing: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Icon(Icons.arrow_forward_ios),
        ),
        onTap: () {
          Navigator.push(
            (context),
            MaterialPageRoute(
              builder: (context) => const DoctorProfileScreen(),
            ),
          );
        },
      ),
    );
  }
}
