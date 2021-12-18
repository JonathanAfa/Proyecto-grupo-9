import 'package:flutter/material.dart';
import 'package:flutter_redsocial_final/domain/controllers/authentications.dart';
import 'package:flutter_redsocial_final/domain/controllers/connectivity.dart';
import 'package:flutter_redsocial_final/domain/controllers/themecontroller.dart';
import 'package:flutter_redsocial_final/ui/pages/content/chat/chat_screen.dart';
import 'package:flutter_redsocial_final/ui/pages/content/locations/locations_screen.dart';
import 'package:flutter_redsocial_final/ui/pages/content/public_offers/public_offers_screen.dart';
import 'package:flutter_redsocial_final/ui/pages/content/states/states_screen.dart';
import 'package:get/get.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controllerauth controluser = Get.find();
    ThemeController controltema = Get.find();
    late ConnectivityController connectivityController;
    connectivityController = Get.find<ConnectivityController>();

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // Icons.light_mode_rounded
            // Icons.dark_mode_rounded,
            IconButton(
              onPressed: () {
                controltema.selecciontema();
              },
              icon: Obx(
                () => Icon(
                  (controltema.themedark)
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  controluser.logOut();
                  Get.offAllNamed('/auth');
                },
                icon: Icon(Icons.exit_to_app_rounded))
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.access_time)),
              Tab(icon: Icon(Icons.work)),
              Tab(icon: Icon(Icons.gps_fixed)),
              Tab(icon: Icon(Icons.chat_bubble)),
            ],
          ),
          title: Text('Crytop Compact'),
        ),
        body: TabBarView(
          children: [
            Obx(() => (connectivityController.connected)
                ? ListaEstados()
                : Center(
                    child: Icon(Icons.wifi_off),
                  )),
            Container(),
            Obx(() => (connectivityController.connected)
                ? PublicOffersScreen()
                : Center(
                    child: Icon(Icons.wifi_off),
                  )),
            Obx(() => (connectivityController.connected)
                ? Locations()
                : Center(
                    child: Icon(Icons.wifi_off),
                  )),
            Obx(() => (connectivityController.connected)
                ? ListaMensajes()
                : Center(
                    child: Icon(Icons.wifi_off),
                  )),
          ],
        ),
      ),
    );
  }
}
