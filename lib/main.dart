import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'data/app_database.dart';
import 'firebase_options.dart';
import 'pages/plates_page.dart';
import 'services/plate_remote_service.dart';
import 'services/plate_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final database = AppDatabase();
  final remoteService = PlateRemoteService();
  final repository = PlateRepository(
    localDb: database,
    remoteService: remoteService,
  );

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final PlateRepository repository;

  const MyApp({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plate App Firebase',
      home: PlatesPage(repository: repository),
    );
  }
}