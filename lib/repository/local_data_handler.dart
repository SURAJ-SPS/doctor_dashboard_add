import 'package:hive/hive.dart';

import '../data/model/doctor_contect_model.dart';

class LocalDataHandler {
  Future<Box?> getDoctorBox() async {
    try {
      bool isDoctorAdapterRegistered = Hive.isAdapterRegistered(1);
      if (isDoctorAdapterRegistered == false) {
        Hive.registerAdapter(DoctorInfoModelAdapter());
      }
      bool isDoctorBoxOpen = Hive.isBoxOpen('DoctorBox');
      late Box doctorBox;
      if (isDoctorBoxOpen == false) {
        doctorBox = await Hive.openBox('DoctorBox');
      } else {
        doctorBox = Hive.box('DoctorBox');
      }
      return doctorBox;
    } catch (e) {
      return null;
    }
  }
}
