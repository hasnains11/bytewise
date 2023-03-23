import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Color signupBackground = Color.fromRGBO(53, 68, 65, 1);
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/welcome.svg',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Keep Track',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text('Your Semester',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "Track your semester activity,record course attendance,"
              "quizzes dates,assigment deadlines, topics you have covered in lectures",
              textAlign: TextAlign.center,
              maxLines: 4,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: size.height * 0.08),
            SizedBox(
              width: size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.08,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(7))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.08,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: signupBackground,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(7))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
