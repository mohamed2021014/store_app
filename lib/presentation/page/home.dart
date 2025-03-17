import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/bloc/fatch_data_bloc/fatch_data_bloc.dart';
import 'package:ecommerce_app/logic/cubit/cart_cubit/cart_cubit.dart';

import 'package:ecommerce_app/logic/cubit/navigatecubit.dart';
import 'package:ecommerce_app/presentation/page/cart_screen.dart';
import 'package:ecommerce_app/presentation/page/favorit_screen.dart';
import 'package:ecommerce_app/presentation/page/home_screen.dart';
import 'package:ecommerce_app/presentation/page/profil_Screen.dart';
import 'package:ecommerce_app/presentation/widget/appbar.dart';
import 'package:ecommerce_app/services/all_prudict.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // const Home({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) =>
                      FatchDataBloc(Servises())..add(FatchDataEveent()),
            ),
          ],

          child: Scaffold(
            appBar: state == 0 ? newMethod() : null,
            body: PageView(
              controller: controller,
              onPageChanged: (value) {
                context.read<NavigationCubit>().setPage(value);
              },
              children: [
                HomeScreen(),
                FavoritScreen(),
                CardScreen(),
                ProfilScreen(),
              ],
            ),

            bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
              builder: (context, state) {
                return Container(
                  height: 50,
                  //  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: NavigationBar(
                    backgroundColor: Colors.transparent,
                    animationDuration: Duration(seconds: 1),

                    selectedIndex: state,

                    onDestinationSelected: (value) {
                      context.read<NavigationCubit>().setPage(value);
                      controller.jumpToPage(value);
                    },
                    height: 70,
                    elevation: 0,
                    indicatorColor: const Color.fromARGB(255, 120, 187, 243),
                    labelPadding: EdgeInsets.all(2),
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysShow,
                    // ignore: deprecated_member_use
                    labelTextStyle:
                        MaterialStateProperty.resolveWith<TextStyle?>((
                          // ignore: deprecated_member_use
                          Set<MaterialState> states,
                        ) {
                          // ignore: deprecated_member_use
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context).textTheme.titleSmall;
                          } else {
                            return Theme.of(context).textTheme.headlineSmall;
                          }
                        }),
                    destinations: [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        label: S.of(context).home,
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.favorite_border_outlined),
                        label: S.of(context).favorit,
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: S.of(context).card,
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.person_outline_sharp),
                        label: S.of(context).profil,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
