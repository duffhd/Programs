import 'package:flutter/material.dart';
import 'package:flutter_weather/view/home/home_controller.dart';
import 'package:get/get.dart';

import '../../data/repository/weather_repository.dart';
import '../../widgets/input_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(weatherRepository: Get.put(WeatherRepository())),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog<String>(
                      context: context,
                      builder: (context) => const InputDialog())
                      .then((value) => controller.addCity(value));
                },
                child: const Icon(Icons.add)),
            appBar: AppBar(title: const Text("Flutter Weather")),
            body: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Obx(() =>
                  Column(
                      children: controller.cityCards
                  )
              ),
            ),
          );
        });
  }
}
