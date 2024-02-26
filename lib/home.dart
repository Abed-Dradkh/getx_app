import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app/services/moive_api.dart';
import 'package:getx_app/services/size_config.dart';

class Home extends GetView<MovieApi> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Gap(
            getProportionateScreenHeight(50),
          ),
          const Text(
            'Ratalen',
            style: TextStyle(),
          ),
          controller.obx(
            (state) {
              return SizedBox(
                height: getProportionateScreenHeight(400),
                child: ListView.separated(
                  itemCount: state!.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  itemBuilder: (_, index) {
                    var movie = state[index];
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 10,
                      margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(15),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.network(
                        MovieApi.to.handleImage(
                          movie.posterPath ?? '',
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Gap(
                      getProportionateScreenWidth(15),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
