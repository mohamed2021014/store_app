import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommerce_app/core/constant/images_.dart';
import 'package:ecommerce_app/generated/l10n.dart';

import 'package:ecommerce_app/logic/cubit/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/logic/cubit/langcubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:google_fonts/google_fonts.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is SucessCartState) {
            //   if(state.cartitem.isEmpty)
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).card,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Divider(),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is SucessCartState) {
                        if (state.cartitem.isEmpty) {
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImges.carcare),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              //  physics: NeverScrollableScrollPhysics(),
                              itemCount: state.cartitem.length,
                              itemBuilder: (context, index) {
                                final item = state.cartitem[index];
                                return Card(
                                  elevation: 2,
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        leading: CachedNetworkImage(
                                          height: 50,
                                          imageUrl: state.cartitem[index].img,
                                          placeholder:
                                              (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                          errorWidget:
                                              (context, url, error) =>
                                                  Icon(Icons.error),
                                        ),

                                        title: Text(
                                          "${item.name.substring(0, 10)}...",
                                        ),
                                        subtitle: Text(
                                          "Price: \$${item.price}",
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                context
                                                    .read<CartCubit>()
                                                    .decrementQuantity(index);
                                              },
                                            ),
                                            Text(item.quantity.toString()),
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                context
                                                    .read<CartCubit>()
                                                    .incrementQuantity(index);
                                              },
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        ),
                                      ),
                                      BlocBuilder<LanguageCubit, Locale>(
                                        builder: (context, local) {
                                          return Positioned(
                                            left:
                                                local == Locale("en") ? 300 : 1,
                                            bottom: 14,
                                            child: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<CartCubit>()
                                                    .removeFromCart(index);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }
                      return Center(
                        child: Container(
                          height: 500,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImges.empityCart),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  state.total != 0.0
                      ? Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${state.total.toString()}: ${S.of(context).pound}",
                              style: GoogleFonts.aBeeZee(
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 9, 90, 231),
                                    Colors.lightBlueAccent,
                                  ],
                                ),
                              ),
                              child: Text(
                                S.of(context).pay_now,
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      : Container(),
                ],
              ),
            );
          }
          return Center(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImges.empityCart)),
              ),
            ),
          );
        },
      ),
    );
  }
}
 




















  //  Container(
  //             margin: EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               border: Border.symmetric(
  //                 horizontal: BorderSide(color: Colors.black, width: 1),
  //               ),
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 Text(
  //                   context.read<CartCubit>().total.toString(),
  //                   style: TextStyle(color: Colors.black),
  //                 ),

  //                 Container(
  //                   padding: EdgeInsets.all(8),
  //                   margin: EdgeInsets.all(6),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     gradient: LinearGradient(
  //                       colors: [Colors.blueAccent, Colors.lightBlueAccent],
  //                     ),
  //                   ),
  //                   child: Text("checout"),
  //                 ),
  //               ],
  //             ),
  //           ),