import 'package:flutter/material.dart';
import '../models/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? Color(0xFF40A578)
            : Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9DDE8B), // Background color changed to gray
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop_page');
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Color(0xFF40A578)),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  _buildOnboardingCard(
                    imagePath: 'lib/images/haloo.jpg',
                    title: '𝒘𝒆𝒍𝒄𝒐𝒎𝒆 𝒕𝒐 𝒑𝒐𝒏𝒛 𝒈𝒂𝒓𝒂𝒈𝒆',
                    description: 'This is a description for the first page.',
                  ),
                  _buildOnboardingCard(
                    imagePath: 'lib/images/pee.jpg',
                    title: 'Nyari saprepart, Tune Up, atau Bore up?',
                    description: 'This is a description for the second page.',
                  ),
                  _buildOnboardingCard(
                    imagePath: 'lib/images/pe.jpg',
                    title: 'Ke ponz garage aja',
                    description: 'This is a description for the third page.',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            _currentPage != 2
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Next",
                              style: TextStyle(
                                color: Color(0xFF40A578),
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF40A578),
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/shop_page');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Get Started",
                              style: TextStyle(
                                color: Color(0xFF40A578),
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.check,
                              color: Color(0xFF40A578),
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingCard(
      {required String imagePath,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: OnboardingPage(
            imagePath: imagePath,
            title: title,
            description: description,
          ),
        ),
      ),
    );
  }
}
