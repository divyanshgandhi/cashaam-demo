import 'package:cashaam/imports.dart';

class Button extends StatelessWidget {
  final bool isPrimary;
  final String text;
  final Function() onTap;

  const Button({
    Key? key,
    required this.isPrimary,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 48,
        decoration: BoxDecoration(
          color: isPrimary ? primary : white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primary,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              color: isPrimary ? white : primary,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
