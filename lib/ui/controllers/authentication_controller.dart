import 'package:alarmed/ui/controllers/alarm_controller.dart';
import 'package:alarmed/ui/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  UserController userController = Get.find();
  AlarmController alarmController = Get.find();

  Future<void> login(email, password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    // Identificando usuario, id unico en loggedUserID.
    userController.loggedUserId = userCredential.user!.uid;
    await userController.getLoggedUserAlarms();
    await alarmController.setUserAlarms();

    return Future.value();
  }

  Future<void> signup(email, password) async {
    try {
      //Creo usuario en autenticacion y hago logout enseguida (parece que no hay otra manera, gracias google.)
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await logout();

      // Creo usuario en la base de datos a tiempo real
      await userController.createUser(email, userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error("The password is too weak");
      } else if (e.code == 'email-already-in-use') {
        return Future.error("The email is taken");
      }
    }
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Seteando loggedUserId a vacio porque no hay nadie logeado
      userController.loggedUserId = "";
      alarmController.deleteAllAlarms();
    } catch (e) {
      return Future.error("Logout error");
    }
  }
}
