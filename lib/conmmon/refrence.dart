import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../repository/api_handler.dart';
import '../repository/home_repository.dart';
import '../repository/local_data_handler.dart';
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

final LoginRepository loginRepository = LoginRepository();
final APIHandler apiHandler = APIHandler();
final HomeRepository homeRepository = HomeRepository();
final LocalDataHandler localDataHandler = LocalDataHandler();

FirebaseAuth auth = FirebaseAuth.instance;

const String baseUrl = "https://5efdb0b9dd373900160b35e2.mockapi.io/";
const String contacts = "contacts";
