// 00:87:0D:AE:02:7E:8A:B8:C7:77:29:2F:35:33:5E:0B:80:BE:9E:D8

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initalizeApp() async{

    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();

    print(token);

  }
}