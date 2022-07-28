import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';

class ReportRadioBtn extends StatefulWidget {
  String? label;
  Color? color;
  VoidCallback? onPressed;
  int index;
  int value;

  ReportRadioBtn(
      {Key? key,
      this.label,
      this.color,
      this.onPressed,
      required this.index,
      required this.value})
      : super(key: key);

  @override
  State<ReportRadioBtn> createState() => _ReportRadioBtnState();
}

class _ReportRadioBtnState extends State<ReportRadioBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.black87,
        primary: Colors.white,
        // minimumSize: const Size.fromHeight(40),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
              width: 1.0,
              color: (widget.value == widget.index)
                  ? widget.color ?? AppColor.primaryColor
                  : Colors.grey.shade300),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(widget.label ?? "Default text"),
    );
  }
}
