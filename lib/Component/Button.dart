import 'package:heal_talk_doctor/index.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

final colors = Appcolor();

class btnRegisterLogin extends StatelessWidget {
  final color;
  final text;
  final onpress;
  btnRegisterLogin({this.color, this.text, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: FlatButton(
        onPressed: (onpress),
        child: Text(
          text,
          style: TextStyle(color: colors.white),
        ),
      ),
    );
  }
}

class btnBack extends StatelessWidget {
  final onpressed;
  final color;
  final width, height;
  btnBack({this.onpressed, this.color, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 25,
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.green,
      ),
      onPressed: (onpressed),
    );
  }
}

class btnCustom extends StatelessWidget {
  final width;
  final textcolor;
  final height;
  final text;
  final color;
  final onpress;
  btnCustom(
      {this.height,
      this.width,
      this.color,
      this.onpress,
      this.text,
      this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: FlatButton(
        onPressed: (onpress),
        child: Text(
          text,
          style: TextStyle(color: textcolor),
        ),
      ),
    );
  }
}

class CheckBox1 extends StatelessWidget {
  final colors = Appcolor();
  CheckBox1({this.isChecked, this.title, this.onChange});
  final isChecked;
  final title;
  final onChange;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: isChecked,
      checkColor: colors.white,
      onChanged: (value) {
        onChange(value);
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

////////Floating action button for admin to send message
class floating_action_button extends StatelessWidget {
  final color;
  final onpress;
  floating_action_button({this.color, this.onpress});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpress,
      backgroundColor: color,
      child: Icon(Icons.add),
    );
  }
}
