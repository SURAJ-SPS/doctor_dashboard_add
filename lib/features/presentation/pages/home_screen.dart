import 'package:flutter/material.dart';
import '../../../core/util/button_constants.dart';
import '../widgets/doctor_info_widget.dart';
import '../widgets/navigation_drawer.dart';

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
