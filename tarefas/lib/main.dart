import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarefas/firebase_options.dart';
import 'package:tarefas/screens/cadastro.dart';
import 'package:tarefas/screens/login.dart';
import 'package:tarefas/screens/splash.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized; // fala para os componentes esperarem o firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform // na plataforma atual o firebase adapta para prover dados
  );
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context) => SplashScreen(),
        "/login":(context) => Login(),
        "/cadastro":(context) => Cadastro()
      },
    );
  }
}