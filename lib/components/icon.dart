import 'package:cashaam/imports.dart';

class Icon extends StatelessWidget {
  const Icon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 42.w,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.4),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "cashaam",
          style: GoogleFonts.josefinSans(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
