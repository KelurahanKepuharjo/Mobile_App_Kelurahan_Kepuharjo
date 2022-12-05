part of 'pages.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loading();
  }

  loading() {
    Timer(
        const Duration(seconds: 2),
        (() => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AppeareaceLogin()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0XFF00ECBC),
            Color(0xFF007ADF),
            Color(0xFF2A2A72),
          ],
        )),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 200,
                  height: 200,
                  alignment: Alignment.topCenter,
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
