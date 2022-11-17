import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Comm/getTextField.dart';
import 'package:kepuharjo_app/Pages/fpass/newpass.dart';
import 'package:kepuharjo_app/Screen/Login/appearance_login.dart';
import 'package:kepuharjo_app/Shared/shared.dart';
import 'package:pinput/pinput.dart';

class FPassword extends StatefulWidget {
  FPassword({key});

  @override
  State<FPassword> createState() => _FPasswordState();
}

class _FPasswordState extends State<FPassword> {
  final rphpController = TextEditingController();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AppeareaceLogin()));
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          '  Forgot Password',
          style: whiteTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lightGreen,
                    midGreen,
                  ],
                ))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/lock.png",
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Silahkan Masukan No.Handphone Anda",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Center(
                child: Text(
                  "Untuk Mendapatkan Kode Verifikasi",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              getTextField(
                controller: rphpController,
                hintName: " No.Telepon",
                keyboardType: TextInputType.number,
                inputFormatters: FilteringTextInputFormatter.digitsOnly,
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2BAE82),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Wrap(
                                    children: [
                                      Container(
                                          color: Colors.transparent,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(30),
                                                    topLeft:
                                                        Radius.circular(30))),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 40, vertical: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  SingleChildScrollView(
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Verify Your Number",
                                                              style: whiteTextStyle.copyWith(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      blackColor),
                                                            )
                                                          ],
                                                        ),
                                                        // const Spacer(),
                                                        // Center(
                                                        //   child: InkWell(
                                                        //     onTap: () {
                                                        //       Navigator.pop(
                                                        //           context);
                                                        //     },
                                                        //     child: Image.asset(
                                                        //       "images/close.png",
                                                        //       height: 20,
                                                        //       width: 20,
                                                        //     ),
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 50,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "Please Enter The 4 Digit Code Sent To Your Number",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color:
                                                                  blackColor),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 40,
                                                  ),
                                                  Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Directionality(
                                                          // Specify direction if desired
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          child: Pinput(
                                                            controller:
                                                                pinController,
                                                            focusNode:
                                                                focusNode,
                                                            androidSmsAutofillMethod:
                                                                AndroidSmsAutofillMethod
                                                                    .smsUserConsentApi,
                                                            listenForMultipleSmsOnAndroid:
                                                                true,
                                                            defaultPinTheme:
                                                                defaultPinTheme,
                                                            validator: (value) {
                                                              return value ==
                                                                      '2222'
                                                                  ? null
                                                                  : 'Pin is incorrect';
                                                            },
                                                            // onClipboardFound: (value) {
                                                            //   debugPrint('onClipboardFound: $value');
                                                            //   pinController.setText(value);
                                                            // },
                                                            hapticFeedbackType:
                                                                HapticFeedbackType
                                                                    .lightImpact,
                                                            onCompleted: (pin) {
                                                              debugPrint(
                                                                  'onCompleted: $pin');
                                                            },
                                                            onChanged: (value) {
                                                              debugPrint(
                                                                  'onChanged: $value');
                                                            },
                                                            cursor: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          9),
                                                                  width: 22,
                                                                  height: 1,
                                                                  color:
                                                                      focusedBorderColor,
                                                                ),
                                                              ],
                                                            ),
                                                            focusedPinTheme:
                                                                defaultPinTheme
                                                                    .copyWith(
                                                              decoration:
                                                                  defaultPinTheme
                                                                      .decoration
                                                                      .copyWith(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                border: Border.all(
                                                                    color:
                                                                        focusedBorderColor),
                                                              ),
                                                            ),
                                                            submittedPinTheme:
                                                                defaultPinTheme
                                                                    .copyWith(
                                                              decoration:
                                                                  defaultPinTheme
                                                                      .decoration
                                                                      .copyWith(
                                                                color:
                                                                    fillColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            19),
                                                                border: Border.all(
                                                                    color:
                                                                        focusedBorderColor),
                                                              ),
                                                            ),
                                                            errorPinTheme:
                                                                defaultPinTheme
                                                                    .copyBorderWith(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .redAccent),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 50,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        height: 45,
                                                        width: 120,
                                                        child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFF2BAE82),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    )),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CreateNewPw()));
                                                            },
                                                            child: Text(
                                                              'Verifikasi',
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 100,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  );
                                });
                              });
                        },
                        child: Text(
                          'Kirim',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
