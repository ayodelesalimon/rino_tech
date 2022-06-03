import 'package:flutter/material.dart';
import 'package:rino_tech/model/login_model.dart';
import 'package:rino_tech/screens/home/home_screen.dart';
import 'package:rino_tech/util/string_util.dart';
import 'package:rino_tech/widgets/custom_button.dart';
import 'package:rino_tech/widgets/input.dart';
import 'package:rino_tech/widgets/spacer.dart';

import '../../services/auth.dart';
import '../../widgets/loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  LoginModel loginModel = LoginModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.spacerH60,
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        )),
                  ],
                ),
                Text(StringUtils.enterPhone, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),
                Text(StringUtils.loginDescription, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),),
                Space.spacerH30,
                Input(
                  labelText: "Phone Number",
                  onSaved: (String? value) {
                    loginModel.username = value;
                  },
                  onChanged: (String? value) {},
                  onTap: () {},
                ),
                Space.spacerH20,
                Input(
                  labelText: "Password",
                  onSaved: (String? value) {
                    loginModel.password = value;
                    loginModel.deviceIdentification =
                        "w0pSP0GcwC55vRFZuLZkKmCEk1cH02SylzWFZNsX";
                    loginModel.firebaseMessagingToken =
                        "ujxPOCCBPk80wgTtafHjyGCbpqmG7uXkYEmynsWjsDL2lJEX6JGX9hR6UaykiNzsHZVIn32vQn3FEx8pDrSLhwz53zoOlgd8lbRZfuKKxwiBw13RBNcSzwYa9C4BusUddPfIO0sUgnSktW59yyidl3MOO4J344Pq";
                  },
                  onChanged: (String? value) {},
                  onTap: () {},
                  isPassword: true,
                ),
                Space.spacerH60,
                CustomButton(
                  text: StringUtils.login,
                  onTap: () async {
                    showLoader(context);
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final res = await Auth.userLogin(loginModel);
                      print(res.toString());
                      hideLoader();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                  },
                ),
                Space.spacerH70,
                Center(child: Text(StringUtils.forgotPwd))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
