import 'package:heal_talk_doctor/index.dart';

class Label1 extends StatelessWidget {
  final text;
  final fontsize;
  final fontweight;
  final fontstyle;
  final color;
  final overflow;
  final alignment;
  Label1(
      {this.text,
      this.fontsize,
      this.fontweight,
      this.fontstyle,
      this.color,
      this.overflow,
      this.alignment});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontweight,
        fontSize: fontsize,
        fontStyle: fontstyle,
        color: color,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
