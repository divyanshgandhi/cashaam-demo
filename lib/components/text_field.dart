import 'package:cashaam/imports.dart';

class CTextField extends StatelessWidget {
  CTextField({
    Key? key,
    this.obscure,
    required this.label,
  }) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final bool? obscure;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
      child: TextFormField(
        controller: _controller,
        cursorColor: colorPrimary,
        obscureText: obscure ?? false,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelStyle: TextStyle(color: colorPrimary),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorPrimary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.black26,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  String getInputText() {
    return _controller.text;
  }
}
