import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'myapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
