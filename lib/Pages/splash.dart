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
            MaterialPageRoute(builder: (context) => AppeareaceLogin()))));
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/splashlogo.png',
                  width: 300,
                  height: 200,
                ),
                const SizedBox(
                  height: 200,
                ),
                // const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
