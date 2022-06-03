
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Function()? onTap;
  Widget? data;
  String? text;
  Color? color;
  double? textSize;
  Color borderColor;
  Color? textColor;
  double? height;
  double? width;
  double? borderRadius;
  bool? enable;
  bool isLoading;
  CustomButton(
      {Key? key,
      this.onTap,
      this.data,
      @required this.text,
      this.color,
      this.borderColor = Colors.blue,
      this.textColor = Colors.white,
      this.height,
      this.textSize,
      this.width = double.infinity,
      this.enable = true,
       this.isLoading = false,
      this.borderRadius = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enable!,
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: color ?? Colors.blue,
                borderRadius: BorderRadius.circular(borderRadius!),
                border: Border.all(
                    color: enable! ? borderColor : Color(0xFFD9D9D9))),
            width: width,
            height: height != null ? height : 53,
            child: Stack(
              children: [
                isLoading ? Positioned(
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: height ?? 48,
                        width: 50,
                        child: Text(""),
                      ),
                    )
                  : SizedBox(),
                   InkWell(
                  onTap: onTap,
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                        child: data ??
                            Text(
                              '${isLoading ? 'Loading ...' : text ?? ''}',
                              style: TextStyle(
                                  color: enable! ? textColor : Colors.white,
                                  fontSize: textSize ?? 13.5,
                                  fontWeight: FontWeight.w500),
                            )),
                  )),
              ],
            ),
          )),
    );
  }
}
