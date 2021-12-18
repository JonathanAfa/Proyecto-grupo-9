import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redsocial_final/domain/controllers/authentications.dart';
import 'package:flutter_redsocial_final/domain/controllers/chatrealtime.dart';
import 'package:flutter_redsocial_final/domain/controllers/connectivity.dart';
import 'package:flutter_redsocial_final/domain/controllers/firestore.dart';
import 'package:flutter_redsocial_final/domain/controllers/locations.dart';
import 'package:flutter_redsocial_final/domain/controllers/themecontroller.dart';
import 'package:flutter_redsocial_final/ui/app.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controlchat());
  Get.put(ControllerFirestore());
  Get.put(Controllerauth());
  Get.put(ThemeController());
  // Connectivity Controller
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  // Connectivity stream
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });

  //Controlador para la ubicacion

  Get.put(Controllerlocations());

  runApp(MyApp());
}
