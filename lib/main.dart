import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HealTalk());
}

class HealTalk extends StatelessWidget {
  // This widget is the root of your application.
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //body: admin_home(),
        //body: mainpage(),
        body: mainpage(),
        //body: doctorchatmenu_Page(),
        //body: admin_send_message(),
      ),
    );
  }
}
