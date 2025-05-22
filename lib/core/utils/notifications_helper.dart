import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../di/di.dart';
import '../utils/app_extensions.dart';
import 'app_enums.dart';
import 'app_functions.dart';

@pragma('vm:entry-point')
class NotificationsHelper {
  NotificationsHelper._();

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static const String _channelId = "DeliverNotificationChannelId";
  static const String _channelName = "DeliverNotificationChannelName";
  static const AndroidNotificationChannel _deliverChannel =
      AndroidNotificationChannel(
        _channelId,
        _channelName,
        importance: Importance.high,
        enableLights: true,
      );
  static final FirebaseMessaging _firebaseMessaging =
      getIt<FirebaseMessaging>();

  static Future<void> init() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      final String? apnsToken = await _firebaseMessaging.getAPNSToken();
      dPrint('APNS Token: $apnsToken');
    }
    if (Platform.isAndroid) {}
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      await androidImplementation?.requestNotificationsPermission();
    }
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    handleForegroundNotifications();
    handleBackgroundNotifications();
  }

  static void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final String? payload = notificationResponse.payload;
    if (!payload.nullOrEmpty()) {
      final data = json.decode(payload!);
      dPrint('Notification payload: $payload');
      handleNotification(data);
    }
  }

  static void handleBackgroundNotifications() {
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      dPrint("*** onMessageOpenedApp ***");
      dPrint("Notification Title: ${remoteMessage.notification!.title}");
      dPrint("Notification Body: ${remoteMessage.notification!.body}");
      dPrint("Remote Message Data: ${remoteMessage.data}");
      handleNotification(remoteMessage.data);
    });
  }

  static void handleForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      final RemoteNotification? notification = remoteMessage.notification;
      final Map<String, dynamic> notificationDataMap = remoteMessage.data;

      if (notification != null) {
        dPrint('*** onMessage ***');
        dPrint('Notification Title: ${notification.title}');
        dPrint('Notification body: ${notification.body}');
        dPrint('Notification data: $notificationDataMap');

        final int localNotificationId =
            DateTime.now().millisecondsSinceEpoch ~/ 1000;
        final AndroidNotificationDetails androidNotificationDetails =
            AndroidNotificationDetails(
              _deliverChannel.id,
              _deliverChannel.name,
              icon: '@mipmap/ic_launcher',
              importance: Importance.max,
              priority: Priority.high,
              enableLights: true,
            );

        _flutterLocalNotificationsPlugin.show(
          localNotificationId,
          notification.title,
          notification.body,
          payload: json.encode(notificationDataMap),
          NotificationDetails(
            android: androidNotificationDetails,
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
        );
      }
    });
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    dPrint("*** onBackgroundMessage ***");
    if (message.notification != null) {
      dPrint('Notification Title: ${message.notification!.title}');
      dPrint('Notification body: ${message.notification!.body}');
      dPrint('Notification data: ${message.data.toString()}');
    }
  }

  static void handleNotification(notificationData) {
    dPrint('*** handleNotification ***');
    dPrint(
      'Notification Data: $notificationData',
      stringColor: StringColor.yellow,
    );
  }
}
