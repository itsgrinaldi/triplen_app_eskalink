import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triplen_app/di.dart';
import 'package:triplen_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:triplen_app/presentation/components/alert_dialog.dart';
import 'package:triplen_app/presentation/components/base_button.dart';
import 'package:triplen_app/presentation/components/loading_dialog.dart';
import 'package:triplen_app/presentation/layout/main_layout.dart';

class LoginLayout extends StatefulWidget {
  LoginLayout({Key? key}) : super(key: key);

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  TextEditingController emailController = TextEditingController();
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = sl<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authCubit,
      listener: (context, state) {
        if (state is AuthLoading) {
          LoadingDialog(
                  title: "Login",
                  description: "Waiting for the response from server")
              .show(context);
        } else if (state is AuthSuccess) {
          Navigator.of(context).pop();

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainLayout()));
        } else if (state is AuthFailed) {
          AppAlertDialog(
            title: "Login Failed",
            description: "Login failed, please check your email",
          );
        }
      },
      child: BlocBuilder(
        bloc: authCubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffF5F5F5),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 100.h, right: 15.w, left: 15.w, bottom: 25.h),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Image.asset(
                          "assets/logo.png",
                          scale: 1,
                        ),
                      ),
                      Text(
                        "selamat datang di triplen!",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff009CE3),
                        ),
                      ),
                      Text(
                        "Triplen app membuat pengalaman liburanmu menjadi lebih seru dan menakjubkan.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff393939),
                        ),
                        textScaleFactor: 1.0,
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Your email',
                            labelText: 'Email *',
                          ),
                          controller: emailController,
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      //   child: TextFormField(
                      //     decoration: const InputDecoration(
                      //       hintText: 'Your password',
                      //       labelText: 'Password *',
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: BaseButton(
                          namaButton: "Sign In",
                          onTap: () async {
                            authCubit.doAuth(emailController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* 
Flutter APP
  - MaterialApp
    - Scaffold
      - Widget

*/