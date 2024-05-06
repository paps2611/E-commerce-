import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../data/repo/categories_repository.dart';
import '../models/category_model.dart';

class BannerController extends GetxController {
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;


  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;


    //fetch banners
    Future<void> fetchBanners() async {
      try {
        //show loader while laoding categories
        isLoading.value = true;


        //fetch categories from data sourcce
        final categories = await _categoryRepository.getAllCategories();

        //update categorie list
        allCategories.assignAll(categories);

        //filter featured categorry
        featuredCategories.assignAll(
            allCategories.where((category) => category.isFeatured &&
                category.parentId.isNotEmpty).take(8).toList());
      } catch (e) {
        const SnackBar(content: Text('Oh snap'),);
      } finally {
        //remove loader
        isLoading.value = false;
      }
    }
  }
}
