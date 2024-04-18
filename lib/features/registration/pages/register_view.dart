import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app_c10_mon/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_mon/domain/entities/register_request_data.dart';
import 'package:e_commerce_app_c10_mon/features/registration/manager/cubit.dart';
import 'package:e_commerce_app_c10_mon/features/registration/manager/state.dart';
import 'package:e_commerce_app_c10_mon/main.dart';
import '../../../core/config/constants.dart';
import '../../../core/extensions/padding_ext.dart';
import '../../../core/widgets/border_rounded_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../features/login/manager/cubit.dart';
import '../../../features/login/manager/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();

  var userController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var registerCubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      bloc: registerCubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Constants.theme.primaryColor,
          appBar: AppBar(
            toolbarHeight: 30,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FadeInUp(
                      delay: const Duration(milliseconds: 100),
                      child: Image.asset("assets/images/route_icn.png"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 200),
                      child: Text(
                        "Full Name",
                        style: Constants.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 300),
                      child: CustomTextField(
                        controller: userController,
                        hint: "Enter your full name",
                        keyboardType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 400),
                      child: Text(
                        "Mobile number",
                        style: Constants.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      child: CustomTextField(
                        controller: phoneController,
                        hint: "Enter your mobile number",
                        keyboardType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please enter your phone";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 600),
                      child: Text(
                        "E-mail",
                        style: Constants.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 700),
                      child: CustomTextField(
                        controller: emailController,
                        hint: "Enter your email address",
                        keyboardType: TextInputType.emailAddress,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please enter your email";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 800),
                      child: Text(
                        "Password",
                        style: Constants.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 900),
                      child: CustomTextField(
                        controller: passwordController,
                        hint: "Enter your password",
                        isPassword: true,
                        maxLines: 1,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please enter your password";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 1100),
                      child: BorderRoundedButton(
                        title: "Sing Up",
                        fontSize: 18,
                        color: Constants.theme.primaryColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var data = RegisterRequestData(
                              name: userController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            registerCubit.register(data).then((value) {
                              if (value) {
                                if (kDebugMode) {
                                  print("well done");
                                }
                                navigatorKey.currentState!
                                    .pushNamedAndRemoveUntil(
                                        PageRoutesName.login, (route) => false);
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ).setHorizontalPadding(context, 0.05, enableMediaQuery: true),
              ),
            ),
          ),
        );
      },
    );
  }
}
