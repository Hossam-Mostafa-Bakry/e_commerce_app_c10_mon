import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app_c10_mon/core/config/constants.dart';
import 'package:e_commerce_app_c10_mon/core/config/page_routes_name.dart';
import 'package:e_commerce_app_c10_mon/core/extensions/padding_ext.dart';
import 'package:e_commerce_app_c10_mon/core/widgets/border_rounded_button.dart';
import 'package:e_commerce_app_c10_mon/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app_c10_mon/features/login/manager/cubit.dart';
import 'package:e_commerce_app_c10_mon/features/login/manager/states.dart';
import 'package:e_commerce_app_c10_mon/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var loginCubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      bloc: loginCubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Constants.theme.primaryColor,
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
                      height: 60,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 100),
                      child: Text(
                        "Welcome Back To Route",
                        style: Constants.theme.textTheme.titleLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 200),
                      child: Text(
                        "Please sign in with your mail",
                        style: Constants.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 300),
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
                      delay: const Duration(milliseconds: 400),
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
                      delay: const Duration(milliseconds: 500),
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
                      delay: const Duration(milliseconds: 600),
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
                      height: 20,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 700),
                      child: Text(
                        "Forget passeord ?",
                        textAlign: TextAlign.end,
                        style: Constants.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 800),
                      child: BorderRoundedButton(
                        title: "Login",
                        fontSize: 18,
                        color: Constants.theme.primaryColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginCubit
                                .login(emailController.text,
                                    passwordController.text)
                                .then((value) {
                              if (value) {
                                navigatorKey.currentState!
                                    .pushNamedAndRemoveUntil(
                                  PageRoutesName.layout,
                                  (route) => false,
                                );
                                if (kDebugMode) {
                                  print("well done");
                                }
                              }
                            });
                          }
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () => navigatorKey.currentState!.pushNamed(
                              PageRoutesName.registration,
                            ),
                        child: Text(
                          "Don’t have an account? Create Account",
                          style: Constants.theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.underline),
                        )),
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
