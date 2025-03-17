import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Routes/app_routes.dart';

import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/bloc/fatch_data_bloc/fatch_data_bloc.dart';
import 'package:ecommerce_app/logic/cubit/fav_cubit.dart';
import 'package:ecommerce_app/model/fav_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gridview extends StatelessWidget {
  const Gridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FatchDataBloc, FatchDataState>(
      builder: (context, state) {
        if (state is LoidingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.prudictList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              FavModel item = FavModel(
                id: index,
                name: state.prudictList[index].title,
                img: state.prudictList[index].img,
              );
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.prudicDetils,
                    arguments: state.prudictList[index],
                  );
                },
                child: Card(
                  color: Colors.white,

                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                // FavModel item = FavModel(
                                //   id: index,
                                //   name: state.prudictList[index].title,
                                //   img: state.prudictList[index].img,
                                // );
                                context.read<FavCubit>().addFav(item, context);
                                // context.read<FavCubit>().favbox.clear();
                              },
                              child: BlocBuilder<FavCubit, List<FavModel>>(
                                builder: (context, state) {
                                  final isfavorit = state.contains(item);
                                  return Icon(
                                    isfavorit
                                        ? Icons.favorite
                                        : Icons.favorite_border_rounded,

                                    color: Colors.red,
                                    size: 27,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: CachedNetworkImage(
                            height: 80,
                            imageUrl: state.prudictList[index].img,
                            placeholder:
                                (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                            errorWidget:
                                (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${state.prudictList[index].title.substring(0, 15)}...",
                          style: TextStyle(color: Colors.black),
                        ),
                        Row(
                          children: [
                            Text(
                              "${S.of(context).price} : ${state.prudictList[index].price} ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "EGP",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 232, 138, 24),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color.fromARGB(255, 55, 160, 247),
                              ),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is ErrorState) {
          return Text(state.messige);
        }
        return Container(decoration: BoxDecoration(), child: Text(""));
      },
    );
  }
}
