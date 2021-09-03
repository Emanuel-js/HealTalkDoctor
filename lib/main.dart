import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HealTalk());
}

final auth = FirebaseAuth.instance;
final userCur = auth.currentUser;

class HealTalk extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<PageInfo>(
          create: (_) => PageDataApi().pageInfo,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            //body: admin_home(),
            //body: mainpage(),
            body: PageControll()
            //body: doctorchatmenu_Page(),
            //body: admin_send_message(),
            ),
      ),
    );
  }
}

class PageControll extends StatelessWidget {
  const PageControll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: pageControll(context),
    );
  }

  Widget pageControll(BuildContext context) {
    final isacitve = Provider.of<PageInfo>(context);
    if (userCur?.emailVerified == true && userCur != null && isacitve != null) {
      userCur.reload();
      return isacitve.isaccepted ? DoctorHomePage() : Welcomepage();
    } else {
      return mainpage();
    }
  }
}
