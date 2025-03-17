import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/app_lotti.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/fav_cubit.dart';
import 'package:ecommerce_app/model/fav_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).favorit.toString(),
                  style: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            BlocBuilder<FavCubit, List<FavModel>>(
              builder: (context, state) {
                if (state.isEmpty) {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AppLotti.fav),
                        SizedBox(height: 1),
                        Text(
                          S.of(context).favorite_is_empty.toString(),
                          style: GoogleFonts.aBeeZee(
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CachedNetworkImage(
                            height: 50,
                            imageUrl: state[index].img,
                            placeholder:
                                (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                          title: Text(
                            state[index].name.toString().substring(0, 20),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<FavCubit>().removeItme(index);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
