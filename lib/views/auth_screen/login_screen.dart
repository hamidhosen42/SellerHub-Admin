// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';
import 'package:e_mart_seller/controllers/auth_controller.dart';
import 'package:e_mart_seller/views/home.dart';
import 'package:e_mart_seller/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              50.heightBox,
              normalText(text: welcome, size: 18),
              20.heightBox,
              Column(
                children: [
                  Image.asset(
                    icLogo,
                    height: 70,
                    width: 70,
                  ).box.rounded.border(color: white).p8.make(),
                  20.widthBox,
                  normalText(text: appname, size: 20)
                ],
              ),
              50.heightBox,
              normalText(text: loginTo, size: 18),
              20.heightBox,
              Obx(() {
                return Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: blackColor,
                        ),
                        hintText: emailHint,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    10.heightBox,
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: blackColor,
                        ),
                        hintText: passwordHint,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    5.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: null,
                        child: normalText(
                            text: forgotPassword, color: purpleColor),
                      ),
                    ),
                    5.heightBox,
                    SizedBox(
                      width: context.screenWidth - 100,
                      height: 50,
                      child: customButton(
                        isLoading: controller.isLoading.value,
                        title: login,
                        onPressed: () async {
                          controller.isLoading(true);
                          await controller.loginMethod().then(
                            (value) {
                              if (value != null) {
                                Get.snackbar("Successful", "Logged in successfully");
                                Get.offAll(() => Home());
                                controller.isLoading(false);
                              } else {
                                controller.isLoading(false);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .margin(EdgeInsets.symmetric(horizontal: size.width * 0.3))
                    .padding(EdgeInsets.symmetric(horizontal: 30, vertical: 30))
                    .shadowSm
                    .width(context.screenWidth - 50)
                    .make();
              }),
              10.heightBox,
              Center(child: normalText(text: anyProblem, color: lightGrey)),
              Spacer(),
              Center(child: boldText(text: credit)),
            ],
          ),
        ),
      ),
    );
  }
}