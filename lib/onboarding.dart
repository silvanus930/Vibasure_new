import 'package:flutter/material.dart';
import 'package:main/style/app_theme.dart';
import 'package:main/signin.dart';
import 'package:main/utils/size_utils.dart';
import 'package:main/widgets/common_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController?.animateTo(0.2);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
      _signUpClick();
    }
  }

  void _signUpClick() {
    _animationController?.animateTo(0.2);
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => SignInScreen(),
      ),
    );
  }

  Widget _pageView() {
    int _selectedIndex = 0;

    if (_animationController!.value >= 0.7) {
      _selectedIndex = 3;
    } else if (_animationController!.value >= 0.5) {
      _selectedIndex = 2;
    } else if (_animationController!.value >= 0.3) {
      _selectedIndex = 1;
    } else if (_animationController!.value >= 0.1) {
      _selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Color(0xFFFFFFFF),
                ),
                width: _selectedIndex == i ? 30 : 10,
                height: 10,
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppTheme.bgColor,
            body: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: AppTheme.mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                  ),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 60,
                          child: Center(
                              child: AnimatedBuilder(
                            animation: _animationController!,
                            builder: (context, child) => AnimatedOpacity(
                              opacity: _animationController!.value >= 0.2 &&
                                      _animationController!.value <= 0.6
                                  ? 1
                                  : 0,
                              duration: Duration(milliseconds: 480),
                              child: _pageView(),
                            ),
                          )),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 0,
                          left: 0,
                          child: Center(
                              child: CommonWidgets.getAppButton("Get Started!",
                                  () {
                            _onNextClick();
                          })),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRect(
                child: Stack(
                  children: [
                    SecondView1(
                      animationController: _animationController!,
                    ),
                    SecondView2(
                      animationController: _animationController!,
                    ),
                  ],
                ),
              ),
            ])));
  }
}

class SecondView1 extends StatelessWidget {
  final AnimationController animationController;

  const SecondView1({Key? key, required this.animationController})
      : super(key: key);

  _next() {
    animationController.animateTo(0.4);
  }

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _firstHalfAnimation,
        child: Container(
          child: Stack(
            children: [
              SlideTransition(
                position: _imageAnimation,
                child: Container(
                  margin: getMargin(all: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset('assets/images/slide_1.png'),
                ),
              ),
              SlideTransition(
                position: _imageAnimation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5 + 20,
                        ),
                        Center(
                          child: Text(
                            'One Stop Solution',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Fall all your insurance needs',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              letterSpacing: 0.0,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondView2 extends StatelessWidget {
  final AnimationController animationController;

  const SecondView2({Key? key, required this.animationController})
      : super(key: key);

  _next() {
    animationController.animateTo(0.6);
  }

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(3, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.4,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -2)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.4,
          0.6,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Container(
          margin: getMargin(all: 20.0),
          child: Stack(
            children: [
              SlideTransition(
                position: _imageAnimation,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset('assets/images/slide_2.png'),
                ),
              ),
              SlideTransition(
                position: _imageAnimation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5 + 20,
                        ),
                        Center(
                          child: Text(
                            'One Stop Solution1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Fall all your insurance needs1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              letterSpacing: 0.0,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
