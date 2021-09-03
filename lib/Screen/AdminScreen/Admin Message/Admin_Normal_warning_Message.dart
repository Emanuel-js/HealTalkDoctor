import 'package:heal_talk_doctor/index.dart';

class admin_normal_message extends StatefulWidget {
  @override
  _admin_normal_messageState createState() => _admin_normal_messageState();
}

class _admin_normal_messageState extends State<admin_normal_message> {
  @override
  Widget build(BuildContext context) {
    return admin_send_message(
      floating_action_button: floating_action_button(
        color: colors.primarygreenColor,
        onpress: () {
          showInputMessage(context);
        },
      ),
    );
  }
}

class admin_warning_message extends StatefulWidget {
  @override
  _admin_warning_messageState createState() => _admin_warning_messageState();
}

class _admin_warning_messageState extends State<admin_warning_message> {
  @override
  Widget build(BuildContext context) {
    return admin_send_message(
      floating_action_button: floating_action_button(
        color: colors.k_orange,
        onpress: () {
          showInputMessage(context);
        },
      ),
    );
  }
}
