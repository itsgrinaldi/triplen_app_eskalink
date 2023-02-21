import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triplen_app/di.dart';
import 'package:triplen_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:triplen_app/presentation/bloc/board/board_cubit.dart';
import 'package:triplen_app/presentation/components/loading_dialog.dart';
import 'package:triplen_app/presentation/layout/login_layout.dart';
import 'package:triplen_app/util/global_helper.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AuthCubit authCubit;
  late BoardCubit boardCubit;

  @override
  void initState() {
    authCubit = sl<AuthCubit>();
    boardCubit = sl<BoardCubit>();
    boardCubit.loadBoards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: authCubit,
            listener: (context, state) {
              if (state is AuthLoggedOut) {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginLayout()), (Route<dynamic> route) => false);
              }
            },
          ),
          BlocListener(
            bloc: boardCubit,
            listener: (context, state) {
              if (state is BoardLoading) {
                LoadingDialog(
                    title: "Mengambil data",
                    description: "Waiting for the response from server")
                    .show(context);
              }
            },
          ),
        ],
        child: BlocBuilder(
          bloc: authCubit,
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 25.w, top: 15.h),
                          child: Text(
                            "Rencana-Ku",
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            authCubit.logout();
                          },
                          child: Container(
                            width: 100.w,
                            margin: EdgeInsets.only(top: 15.h),
                            padding:
                            EdgeInsets.only(right: 25.w, top: 10.h, bottom: 10.h),
                            decoration: const BoxDecoration(
                                color: Color(0xff40BEF9),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50))),
                            child: const Text(
                              "Logout",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder(
                      bloc: boardCubit,
                      builder: (context, state) {
                        return boardCubit.boards.isNotEmpty ? ListView.builder(
                          padding: EdgeInsets.only(
                              top: 15.h, bottom: 8.h, left: 25.w, right: 25.w),
                          itemCount: boardCubit.boards.length,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 5.h),
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        boardCubit.boards[index].board!,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: const Color(0xff009BE7),
                                        ),
                                      ),
                                      const Text(
                                        "Liburan mulai tanggal 30 Januari",
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text(
                                      GlobalHelper.formatDateToString(boardCubit.boards[index].date!),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ) : Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Masih belum ada rencana."
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
