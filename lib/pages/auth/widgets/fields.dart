import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildUsername(controller) {
  return Expanded(
    flex: 0,
    child: Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 30.w, right: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // NORMALTEXT(text: 'Username', color: Colors.white70, size: 12.sp),
          TextFormField(
            autofillHints: [AutofillHints.username],
            controller: controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 15.sp, color: Colors.white70),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),

              filled: true,
              fillColor: Colors.transparent, // Colors.grey[50],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.white60, width: 0.5)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white60, width: 0.5),
              ),
              errorStyle: TextStyle(fontSize: 0),
              hintText: 'Username',
              alignLabelWithHint: true,
              hintStyle: GoogleFonts.poppins(color: Colors.white60, fontSize: 12.sp, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    ),
  );
}
