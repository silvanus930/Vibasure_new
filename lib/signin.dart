import 'package:flutter/material.dart';
import 'package:main/style/app_theme.dart';
import 'package:main/utils/size_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppTheme.bgColor,
            body: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppTheme.mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: Stack(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Icon(Icons.arrow_back,
                                color: AppTheme.darkText),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "SignIn",
                              textAlign: TextAlign.center,
                              style: AppTheme.title,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
