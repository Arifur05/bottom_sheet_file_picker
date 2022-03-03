library bottom_sheet_file_picker;

import 'package:bottom_sheet_file_picker/src/image_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheetFilePicker extends StatelessWidget {
  const BottomSheetFilePicker({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ImageBottomSheet();
  }
}
