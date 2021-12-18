import 'package:flutter/material.dart';
import 'package:flutter_redsocial_final/domain/controllers/authentications.dart';
import 'package:flutter_redsocial_final/domain/controllers/connectivity.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailuser = TextEditingController();
  TextEditingController passwuser = TextEditingController();

  Controllerauth controluser = Get.find();

  late ConnectivityController connectivityController;

  @override
  void initState() {
    super.initState();
    autoLogIn();
    connectivityController = Get.find<ConnectivityController>();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? passw = prefs.getString('pass');

    if (email != null) {
      setState(() {
        emailuser.text = email;
        passwuser.text = passw!;
        //if (controluser.emailf != 'Sin Registro')
        //_inicio(emailuser.text, passwuser.text);
      });
      return;
    }
  }

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.registrarEmail(theEmail, thePassword);

      print(controluser.emailf);
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Por Favor Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      }
      //  Get.to(() => ListaMensajes());
      // Get.to(() => ListaMensajeros2(title: 'Titulo'));

    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  _inicio(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.ingresarEmail(theEmail, thePassword);

      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Por Favor Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.TOP,
        );
      }
      //  Get.to(() => ListaMensajes());
      //Get.to(() => ListaMensajeros2(title: 'Titulo'));
      //Get.offNamed('/content');
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _google() async {
    try {
      await controluser.ingresarGoogle();
      //Get.to(() => ListaMensajeros2(title: 'Titulo'));
      // Get.to(() => ListaMensajes());
      Get.offNamed('/content');
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          "Crytop compact",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*   CircleAvatar(
                radius: 50.0,
                child: ClipRRect(
                  child: Image.asset('assets/login.png'),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),*/

              CircleAvatar(
                  radius: 80.0,
                  backgroundImage: (connectivityController.connected)
                      ? NetworkImage(
                          'https://s2.coinmarketcap.com/static/img/coins/200x200/10263.png')
                      : null),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailuser,
                decoration: InputDecoration(
                    hintText: 'Ingrese el Email',
                    prefixIcon: Icon(Icons.person, color: Colors.red)),
              ),
              TextField(
                controller: passwuser,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.red)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        if (connectivityController.connected) {
                          _inicio(emailuser.text, passwuser.text);
                        } else {
                          Get.snackbar(
                            "Red",
                            'No hay Conexion de Red',
                            icon: Icon(Icons.wifi_off, color: Colors.blue),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      icon: Icon(Icons.login)),
                  IconButton(
                      onPressed: () {
                        if (connectivityController.connected) {
                          _login(emailuser.text, passwuser.text);
                        } else {
                          Get.snackbar(
                            "Red",
                            'No hay Conexion de Red',
                            icon: Icon(Icons.wifi_off, color: Colors.blue),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      icon: Icon(Icons.app_registration))
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (connectivityController.connected) {
            _google();
          } else {
            Get.snackbar(
              "Red",
              'No hay Conexion de Red',
              icon: Icon(Icons.wifi_off, color: Colors.blue),
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        child: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.white,
        ),
      ),
    );
  }
}
