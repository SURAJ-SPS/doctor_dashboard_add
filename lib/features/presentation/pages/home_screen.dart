import 'package:flutter/material.dart';
import '../../../conmmon/refrence.dart';
import '../../../core/util/button_constants.dart';
import '../../../core/util/color_constants.dart';
import '../../../data/model/doctor_contect_model.dart';

import '../widgets/doctor_info_widget.dart';
import '../widgets/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool listViewToGridView = true;
  late Future<List<DoctorInfoModel>?> _getDoctorsList;

  @override
  void initState() {
    super.initState();
    _getDoctorsList = homeRepository.getDoctorsInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColour,
        onPressed: () {
          setState(() {
            listViewToGridView = !listViewToGridView;
          });
        },
        child: Icon(listViewToGridView ? Icons.list : Icons.list_alt_outlined),
      ),*/
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColour),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "BIMA DOCTOR",
              style: kAppBarTitleText,
            ),
            Image.asset(
              'assets/images/img_bima_logo_name.png',
              fit: BoxFit.cover,
              color: kPrimaryColour,
              height: size.height * .059,
              width: size.width * .40,
            ),
          ],
        ),
      ),
      drawer: const NavigationDrawer(),
      body: FutureBuilder<List<DoctorInfoModel>?>(
        future: _getDoctorsList,
        // future: localDataHandler.getDoctorBox(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DoctorInfoModel>?> snapshot) {
          Widget? doctorInFoWidget;

          if (snapshot.hasData) {
            doctorInFoWidget = ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return DoctorInFoWidget(
                  doctorInfoModel: snapshot.data![index],
                );
              },
            );
            /*if (listViewToGridView == true) {
              doctorInFoWidget = ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return DoctorInFoWidget(
                    doctorInfoModel: snapshot.data![index],
                  );
                },
              );
            } else {
              doctorInFoWidget = Wrap(
                children: List.generate(
                    snapshot.data!.length,
                    (index) => DoctorInFoWidget(
                          doctorInfoModel: snapshot.data![index],
                        )),
              );
            }*/
          } else {
            doctorInFoWidget = const Center(child: CircularProgressIndicator());
          }

          return doctorInFoWidget;
        },
      ),
    );
  }
}
