import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../repository/login_repository.dart';

TextEditingController fNameController = TextEditingController();
TextEditingController lNameController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController contNumController = TextEditingController();
TextEditingController dayController = TextEditingController();
TextEditingController monthNumController = TextEditingController();
TextEditingController yearNumController = TextEditingController();
TextEditingController bloodGController = TextEditingController();
TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();
String? profileImagePath;
final LoginRepository loginRepository = LoginRepository();
FirebaseAuth auth = FirebaseAuth.instance;
