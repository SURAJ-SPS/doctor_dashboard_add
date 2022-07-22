import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'core/features/presentation/widgets/doctor_info_widget.dart';
import 'core/features/presentation/widgets/navigation_drawer.dart';
import 'core/util/button_constants.dart';
import 'core/util/color_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            'assets/images/img_bima_logo_name.png',
            fit: BoxFit.cover,
            color: Colors.white,
            height: 32,
            width: 70,
          ),
        ],
        centerTitle: false,
        title: const Text(
          "BIMA DOCTOR",
          style: kAppBarTitleText,
        ),
      ),
      drawer: const NavigationDrawer(),
      body: ListView(
        children: const [
          DoctorInFoWidget(),
        ],
      ),
    );
  }
}
