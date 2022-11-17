part of 'pages.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        (() => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AppeareaceLogin()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lightGreen, midGreen, darkgreenColor],
        )),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/splashlogo.png',
                  width: 300,
                  height: 200,
                ),
                const Spacer(),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
