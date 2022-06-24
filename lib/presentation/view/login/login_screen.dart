import 'package:ecomappv2/presentation/management/management_shelf.dart';
import 'package:ecomappv2/presentation/view/login/login_shelf.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = LoginViewModel(); // Login Usecase işlenecek
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bind() {
    viewModel.start();
    userNameController
        .addListener(() => viewModel.setUserName(userNameController.text));
    passwordController
        .addListener(() => viewModel.setUserName(passwordController.text));
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  ImageManagement.appLogo,
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: viewModel.outputIsUserNameValid,
                    builder: (context, index) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: userNameController,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
