import 'package:dpm_application/conmmon/refrence.dart';
import 'package:flutter/material.dart';
import '../../../core/util/color_constants.dart';
import '../widgets/doctor_info_container.dart';
import '../widgets/text_field_widget.dart';
import 'edit_doctor_profile.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  void initState() {
    fNameController.text = "Suraj";
    lNameController.text = "Singh";
    genderController.text = "Mail";
    contNumController.text = "+919717065425";
    super.initState();
  }

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
                    alignment: Alignment.centerLeft,
                    color: kPrimaryColour,
                    height: size.height * .14,
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: kAccentColor,
                        )),
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
                        Text(
                          "${fNameController.text} ${lNameController.text}",
                          style: const TextStyle(
                            color: kPrimaryColorTint80,
                            fontSize: 16.0,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.bold,
                            package: 'common_library_package',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => const EditDoctorProfile(),
                              ),
                            ).then(
                              (value) => setState(
                                () {
                                  profileImagePath = profileImagePath;
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('EDIT PROFILE'),
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
                  backgroundImage: AssetImage(
                    profileImagePath ??
                        'assets/images/ic_policy_card_icon_three.png',
                  )),
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
                  enabled: false,
                  controller: fNameController,
                  hintText: "First Name",
                  label: "FIRST NAME",
                ),
                TextFieldWidget(
                  enabled: false,
                  controller: lNameController,
                  label: "LAST NAME",
                  hintText: "Last Name",
                ),
                TextFieldWidget(
                  enabled: false,
                  controller: genderController,
                  label: "GENDER",
                  hintText: "Gender",
                ),
                TextFieldWidget(
                  enabled: false,
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
                      enabled: false,
                      controller: dayController,
                    ),
                    DoctorInfoContainer(
                      controller: monthNumController,
                      title: "MONTH",
                      icon: Icons.calendar_month,
                      enabled: false,
                    ),
                    DoctorInfoContainer(
                      controller: yearNumController,
                      title: "YEAR",
                      icon: Icons.calendar_month,
                      enabled: false,
                    ),
                    DoctorInfoContainer(
                      title: "BLOOD GROUP",
                      icon: Icons.monitor_weight,
                      enabled: false,
                      controller: bloodGController,
                    ),
                    DoctorInfoContainer(
                      controller: heightController,
                      title: "HEIGHT",
                      icon: Icons.calendar_month,
                      enabled: false,
                    ),
                    DoctorInfoContainer(
                      controller: weightController,
                      title: "WEIGHT",
                      icon: Icons.calendar_month,
                      enabled: false,
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
