import 'package:flutter/material.dart';
import 'package:rino_tech/widgets/custom_button.dart';

import '../../util/string_util.dart';
import '../../widgets/spacer.dart';
import '../auth/login.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Space.spacerH60,
            Text(StringUtils.appName, style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w700),),
            Image.asset(
              StringUtils.onBoardImage + "gift.png",
              height: 400,
              width: MediaQuery.of(context).size.width,
            ),
            Text(StringUtils.driverApp),
            Space.spacerH70,
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: CustomButton(
                text: StringUtils.newDriver,
                borderRadius: 12,
              ),
            ),
            Space.spacerH20,
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: CustomButton(
                text: StringUtils.login,
                textColor: Colors.black,
                borderRadius: 12,
                color: Colors.white,
                borderColor: Colors.blue,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
