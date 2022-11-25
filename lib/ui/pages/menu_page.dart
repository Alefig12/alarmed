import 'package:alarmed/ui/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:alarmed/ui/assets/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:alarmed/ui/widgets/roundedbox_widget.dart';
import 'package:alarmed/ui/pages/help_page.dart';
import 'package:alarmed/ui/pages/change_foto_page.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  AuthenticationController authenticationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        child: Icon(Icons.close),
        backgroundColor: Constant.thirdRed,
      ),
      key: Key('HelpScaffold'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(' Menu',
                      style: TextStyle(
                          fontSize: 40,
                          color: Constant.title,
                          fontWeight: FontWeight.w600))),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                overflowButtonSpacing: 50,
                children: [
                  ElevatedButton(
                    child: Text("Mi perfil",
                        style: TextStyle(
                            fontSize: 40,
                            color: Constant.title,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      Get.to(ChangeFotoPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.mainCont,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Ayuda",
                        style: TextStyle(
                            fontSize: 40,
                            color: Constant.title,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      Get.to(HelpPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.mainCont,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Logout",
                        style: TextStyle(
                            fontSize: 40,
                            color: Constant.title,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      authenticationController.logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.mainCont,
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
