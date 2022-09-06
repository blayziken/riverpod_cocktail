import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BOLDTEXT extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  const BOLDTEXT({Key? key, this.text = '', this.size, this.color, this.weight, this.align, this.fontStyle, this.maxLines, this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? null,
      overflow: overflow ?? null,
      style: GoogleFonts.poppins(
        fontSize: size ?? 15.sp,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
        fontWeight: weight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}

class NORMALTEXT extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  const NORMALTEXT({Key? key, this.text = '', this.size, this.color, this.weight, this.align, this.fontStyle, this.maxLines, this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? null,
      overflow: overflow ?? null,
      style: GoogleFonts.poppins(
        fontSize: size ?? 15.sp,
        color: color ?? Theme.of(context).textTheme.bodyText1!.color,
        fontWeight: weight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
