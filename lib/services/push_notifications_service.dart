// 00:87:0D:AE:02:7E:8A:B8:C7:77:29:2F:35:33:5E:0B:80:BE:9E:D8

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast(); 
  static Stream<String> get messageStream => _messageStream.stream;


  static Future _backgroundHandler(RemoteMessage message) async{
    // print('1');
    // _messageStream.add(message.notification?.title ?? 'No title');
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async{
    // print(message.data);
    // _messageStream.add(message.notification?.title ?? 'No title');
    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future _onOpenMessage(RemoteMessage message) async{

    _messageStream.add(message.data['product'] ?? 'No data');
  }

  static Future initalizeApp() async{

    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessage);
    print(token);

  }

  static closeStreams(){
    _messageStream.close();
  }
}