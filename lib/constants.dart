import 'package:cashaam/imports.dart';
import 'package:hexcolor/hexcolor.dart';

HexColor primary = HexColor("7455C1");
HexColor white = HexColor("FAFAFA");
HexColor black = HexColor("222222");

Map<int, Color> colorPrimaryMap = {
  50: Color.fromRGBO(116, 85, 193, .1),
  100: Color.fromRGBO(116, 85, 193, .2),
  200: Color.fromRGBO(116, 85, 193, .3),
  300: Color.fromRGBO(116, 85, 193, .4),
  400: Color.fromRGBO(116, 85, 193, .5),
  500: Color.fromRGBO(116, 85, 193, .6),
  600: Color.fromRGBO(116, 85, 193, .7),
  700: Color.fromRGBO(116, 85, 193, .8),
  800: Color.fromRGBO(116, 85, 193, .9),
  900: Color.fromRGBO(116, 85, 193, 1),
};
final MaterialColor colorPrimary =
    new MaterialColor(0xFF8F00FF, colorPrimaryMap);
