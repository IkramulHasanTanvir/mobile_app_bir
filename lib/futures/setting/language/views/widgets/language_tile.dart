import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.logo,
    required this.label,
    required this.checked,
    this.onChanged,
  });

  final String label;
  final IconData logo;
  final bool checked;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return ListTile(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!checked);
        }
      },
      leading: Icon(
        logo,
        color: Colors.black,
      ),
      title: Text(label,
          style: GoogleFonts.poppins(
            textStyle:  const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )),
      trailing: Checkbox(
        value: checked,
        onChanged: onChanged,
        activeColor: Colors.black,
        shape: const CircleBorder(),
      ),
    );
  }
}
