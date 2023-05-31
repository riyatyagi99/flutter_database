import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'cloud_firestore_operations.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());

}

