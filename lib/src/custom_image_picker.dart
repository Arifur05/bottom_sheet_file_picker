import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garibook/app/utilities/theme_styles.dart';
import 'package:garibook/app/widgets/file_picker_bottom_sheet.dart';

import '../provider/authenticaiton/authentication_provider.dart';

class CustomImagePicker extends ConsumerStatefulWidget {
  CustomImagePicker(
      {required this.imageType,
        required this.onTap,
        required this.ImageFile,
        required this.onDelete,
      super.key,
      this.height,
      this.width,
      this.color,
      this.borderColor});

  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final imageType;
  final Function() onTap;
  final Function() onDelete;
  var  ImageFile;

  @override
  ConsumerState<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends ConsumerState<CustomImagePicker> {

  var authenticationProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authenticationProvider = ref.watch(signInSignUpController);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.imageType);
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color ?? ThemeStyles.whiteColor,
          border:
              Border.all(color: widget.borderColor ?? ThemeStyles.whiteColor)),
      child: InkWell(
          onTap: widget.onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: ThemeStyles.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: widget.ImageFile == null
                  ? Image.asset('assets/images/splash_screen/Vector.png')
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          widget.ImageFile,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          right: -8,
                          top: -10,
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.red,
                            ),
                            onPressed: widget.onDelete,
                          ),
                        )
                      ],
                    ))),
    );
  }
}
