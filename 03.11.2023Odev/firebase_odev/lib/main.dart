import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_odev/screens/firestore_yonetim_ekrani.dart';
// FlutterFire CLI kullandıysanız aşağıdaki satırı açabilirsiniz:
// import 'firebase_options.dart';

void main() async {
  // Flutter widget motorunun hazır olduğundan emin oluyoruz
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase başlatma işlemi
  await Firebase.initializeApp(
    // FlutterFire CLI ile konfigürasyon dosyası oluşturulduysa:
    // options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Öğrenci Yönetimi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber,
      ),
      home: FirestoreYonetimEkrani(),
    );
  }
}