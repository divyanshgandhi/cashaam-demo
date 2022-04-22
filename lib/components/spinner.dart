import 'package:cashaam/imports.dart';

class Spinner extends StatelessWidget {
  final bool primary;
  const Spinner({Key? key, required this.primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = this.primary ? colorPrimary : white;
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
