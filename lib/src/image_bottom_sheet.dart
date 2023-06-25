import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageBottomSheet extends StatelessWidget {


  File? file;

  ImageBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(
      //     context)
      //     .size
      //     .height /
      //     3,
      child: Column(
        children: [
          Container(
            child: const Text(
              'SOURCE',
              //style: bb_text_style_24_bold_black,
            ),
            padding: const EdgeInsets.only(top: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _bottomSheetOptions(
                    context: context,
                    label: 'CAMERA',
                    icon: 'assets/images/camera_colored.png',
                    onClicked: () => _selectedItem(context, 0)),
                _bottomSheetOptions(
                    context: context,
                    label: 'Gallery',
                    icon: 'assets/images/gallery.png',
                    onClicked: () => _selectedItem(context, 1)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectedItem(BuildContext context, int index) async {
    switch (index) {
      case 0:
        await _openCamera(context);
        Navigator.pop(context, file);
        break;
      case 1:
        await _openGallery(context);
        Navigator.pop(context, file);
        break;
    }
  }

  _openGallery(BuildContext context) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile != null) {
      file = File(pickedFile.path);
      return file;
      } else {
      return null;
      }
    // file = File(pickedFile!.path);
    // imageFileupload= pickedFile;
    //String filepath = pickedFile!.path;
    //_cropImage(filepath);


    // setState(() {
    //   if (type == 'chalan') {
    //     imageFile = file;
    //   } else {
    //     imageInvoiceFile = file;
    //   }
    // });
  }

  _openCamera(BuildContext context) async {
    final _picker = ImagePicker();
    // final _cropper = ImageCropper();
    final pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
     if (pickedFile != null) {
      file = File(pickedFile.path);
      return file;
      } else {
      return null;
      }

    // setState(() {
    //   if (type == 'chalan') {
    //    return imageFile = file;
    //   } else {
    //     imageInvoiceFile = file;
    //   }
    // });
    // Navigator.of(context).pop();
  }


}

Widget _bottomSheetOptions({
  required BuildContext context,
  required String? label,
  required String icon,
  VoidCallback? onClicked,
}) {
  return SizedBox(
    width: 120,
    height: 120,
    child: GestureDetector(
      onTap: onClicked,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
          ),
          Text(
            label!,
            // style: TextThemeStyles.generalTextStyle(
            //     context: context,
            //     color: ThemeStyle.blackColor,
            //     fontSize: 14.0,
            //     fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
