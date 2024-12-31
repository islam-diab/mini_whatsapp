import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/widget/app_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ChatsShimmerLoading extends StatelessWidget {
  const ChatsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, indx) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: const CircleAvatar(),
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppShimmer(height: 20, width: 150),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const AppShimmer(
                          height: 15,
                          width: 80,
                        ),
                        horizontalSpace(150),
                        const AppShimmer(height: 15, width: 80),
                      ],
                    ),
                  ],
                )
                // ListTile(
                //     title: Shimmer.fromColors(
                //   baseColor: Colors.grey,
                //   highlightColor: Colors.white,
                //   child: Container(
                //     height: 20,
                //     width: 100,
                //     color: Colors.grey,
                //   ),
                // ))
              ],
            ),
          );
        });
  }
}
