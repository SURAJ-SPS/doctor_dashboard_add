import 'package:dpm_application/core/util/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../refrence.dart';
import 'features/presentation/widgets/doctor_info_container.dart';
import 'features/presentation/widgets/text_field_widget.dart';

class EditDoctorProfile extends StatefulWidget {
  const EditDoctorProfile({Key? key}) : super(key: key);

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    color: kPrimaryColour,
                    height: size.height * .14,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: size.height * .12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                            color: kPrimaryColorTint80,
                            fontSize: 16.0,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.bold,
                            package: 'common_library_package',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('SAVE PROFILE'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundColor: kGreyColorTint35,
                child: SvgPicture.asset(
                  'assets/images/nav_about_bima_icon.svg',
                  height: 40.0,
                  width: 40.0,
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey.shade100,
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "PERSONAL DETAILS",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.w700,
                      package: 'common_library_package',
                    ),
                  ),
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: fNameController,
                  hintText: "First Name",
                  label: "FIRST NAME",
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: lNameController,
                  label: "LAST NAME",
                  hintText: "Last Name",
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: genderController,
                  label: "GENDER",
                  hintText: "Gender",
                ),
                TextFieldWidget(
                  enabled: true,
                  controller: contNumController,
                  label: "CONTACT NUMBER",
                  hintText: "Number",
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "DATE OF BIRTH",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.w700,
                      package: 'common_library_package',
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    DoctorInfoContainer(
                      title: "DAY",
                      icon: Icons.calendar_month,
                      enabled: true,
                      controller: dayController,
                    ),
                    DoctorInfoContainer(
                      controller: monthNumController,
                      title: "MONTH",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                    DoctorInfoContainer(
                      controller: yearNumController,
                      title: "YEAR",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                    DoctorInfoContainer(
                      title: "BLOOD GROUP",
                      icon: Icons.monitor_weight,
                      enabled: true,
                      controller: bloodGController,
                    ),
                    DoctorInfoContainer(
                      controller: heightController,
                      title: "HEIGHT",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                    DoctorInfoContainer(
                      controller: weightController,
                      title: "WEIGHT",
                      icon: Icons.calendar_month,
                      enabled: true,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
