import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ready_pet_go/pages/FoodScreen/feeding_screen.dart';
import 'package:ready_pet_go/pages/HomeScreen/home_screen.dart';
import 'package:ready_pet_go/pages/PettingScreen/petting_screen.dart';
import 'package:ready_pet_go/pages/WaterScreen/water_screen.dart';
import 'package:ready_pet_go/pages/WalkScreens/walking_tracker_screen.dart';
import 'package:ready_pet_go/pages/pet_or_play_screen.dart';
import 'package:ready_pet_go/pages/PlayingScreen/playing_screen.dart';
import 'package:ready_pet_go/pages/completed_task_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', //id
  'High Importance notifications', //title
  //'This channel is used for important descriptions', //description
  importance: Importance.high,
  playSound: true
);

final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyHomePageState();

  // This widget is the root of your application.
}

class _MyHomePageState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null){
        localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              //channel.description,
              color:Colors.blue,
              playSound: true,
              icon: '@mipmap/launcher_icon'
            ),
          )
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null){
        showDialog(
          context: context,
          builder: (_){
            return AlertDialog(
              title: Text('Main'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Wassup')
                  ],
                )
              )
            );
          }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/HomeScreen',
      routes:{
        '/HomeScreen': (context)=> HomePage(),
        '/WaterScreen': (context)=> WaterScreen(),
        '/FeedingScreen': (context)=> FeedingScreen(),
        '/PettingScreen': (context)=> PettingScreen(),
        '/TrackingScreen': (context)=> TrackerScreen(),
        '/OptionScreen': (context)=> OptionPage(),
        '/PlayingScreen': (context)=> PlayingScreen(),
        '/CompletedScreen': (context)=> CompletedScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
