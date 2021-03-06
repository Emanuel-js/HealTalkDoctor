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
        ),
        StreamProvider<Patient>(
          create: (_) => PatientApi().patient,
          initialData: null,
        ),
        StreamProvider<List<Patient>>(
          create: (_) => PatientApi().getallPatinet,
          initialData: null,
        ),
        StreamProvider<List<Doctor>>(
          create: (_) => FirebaseApi().getdoctor,
          initialData: null,
        ),
        StreamProvider<Doctor>(
          create: (_) => FirebaseApi().doctor,
          initialData: null,
        ),
        StreamProvider<List<Report>>(
          create: (_) => PatientApi().getreport,
          initialData: null,
        ),
        StreamProvider<Other>(
          create: (_) => RequestApi().getOters,
          initialData: null,
        ),
        StreamProvider<List<Schedule>>(
          create: (_) => RequestApi().schedule,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: PageControll())),
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
    final isacitve = Provider.of<Doctor>(context);
    if (userCur?.emailVerified == true && userCur != null && isacitve != null) {
      userCur.reload();
      return isacitve.isactive ? DoctorHomePage() : Welcomepage();
    } else {
      return mainpage();
    }
  }
}
