import 'package:flutter/material.dart';
import 'package:flutter_redsocial_final/ui/pages/authentication/login/login_screen.dart';
import 'package:flutter_redsocial_final/ui/pages/content/content_page.dart';
import 'package:flutter_redsocial_final/ui/theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Autenticacion Firebase',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      routes: {
        '/auth': (context) => Login(),
        '/content': (context) => Principal(),
      },
      home: Login(),
    );
  }
}
