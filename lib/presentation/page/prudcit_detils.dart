import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/theme/app_thems.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/logic/cubit/cart_cubit/cart_cubit.dart';

import 'package:ecommerce_app/logic/cubit/themecubit.dart';
import 'package:ecommerce_app/model/cart_item.dart';

import 'package:ecommerce_app/model/get_all_prudict.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class PrudcitDetils extends StatelessWidget {
  PrudctModel data;
  PrudcitDetils({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final CartItem cartModel = CartItem(
            img: data.img,
            name: data.title,
            price: double.parse(data.price),
            quantity: 1,
          );
          context.read<CartCubit>().addToCart(cartModel);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("sucsess add")));
        },

        label: Text(S.of(context).add_to_cart),
        icon: const Icon(Icons.shopping_cart),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    S.of(context).Product_details,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        child: CachedNetworkImage(
                          height: 200,
                          imageUrl: data.img,
                          placeholder:
                              (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            itemBuilder:
                                (context, _) =>
                                    const Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) {
                              //  print(rating);
                            },
                          ),
                          Divider(),
                          Wrap(
                            children: [
                              Text(
                                " ${S.of(context).name} :  ",
                                style: GoogleFonts.abel(
                                  textStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Text(
                                " ${data.title}",
                                style: GoogleFonts.abel(
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text(
                                " ${S.of(context).price} :  ",
                                style: GoogleFonts.abel(
                                  textStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Text(
                                " ${data.price}",
                                style: GoogleFonts.abel(
                                  textStyle:
                                      Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                          Divider(),

                          Text(
                            " ${S.of(context).description} :  ",
                            style: GoogleFonts.abel(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          BlocBuilder<ThemeCubit, ThemeData>(
                            builder: (context, themedata) {
                              return ReadMoreText(
                                " ${data.dec}",
                                style:
                                    themedata == themeLigh()
                                        ? TextStyle(color: Colors.black)
                                        : TextStyle(color: Colors.white),
                                trimMode: TrimMode.Line,
                                trimLines: 2,
                                colorClickableText: Colors.pink,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
