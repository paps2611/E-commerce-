import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repo/categories_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/fullscreen_loader.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories =  <CategoryModel>[].obs;



  @override
  void onInit(){
    fetchCategories();
    super.onInit();
  }

  //load Category data
  Future<void> fetchCategories() async {
    try{
      //show loader while laoding categories
      isLoading.value = true;


      //fetch categories from data sourcce
      final categories = await _categoryRepository.getAllCategories();

      //update categorie list
      allCategories.assignAll(categories);

      //filter featured categorry
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isNotEmpty).take(8).toList());

    }catch(e){
      const SnackBar(content: Text('Oh snap'),);
    }finally{
      //remove loader
      isLoading.value = false;
    }
  }

  //load selected category data

  //Get category and subCategory
}