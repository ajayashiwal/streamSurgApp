import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  String? selectedLocation;
  double rating = 4;
  List<String> locations = ['A', 'B', 'C', 'D'];
  ScrollController scrollController=ScrollController();


}
