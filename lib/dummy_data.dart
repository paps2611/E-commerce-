import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class TDummyData{
  static final List <CategoryModel> categories = [
    CategoryModel(image: TImages.sportIcon, name: 'Sports', id: '1', isFeatured: true),
    CategoryModel(image: TImages.furnitureIcon, name: 'Furniture', id: '2', isFeatured: true),
    CategoryModel(image: TImages.clothIcon, name: 'Clothing', id: '3', isFeatured: true),
    CategoryModel(image: TImages.animalIcon, name: 'Animals', id: '4', isFeatured: true),
    CategoryModel(image: TImages.shoeIcon, name: 'Shoes', id: '5', isFeatured: true),
    CategoryModel(image: TImages.electronicsIcon, name: 'Electronics', id: '6', isFeatured: true),
    CategoryModel(image: TImages.jeweleryIcon, name: 'JewelryIcon', id: '14', isFeatured: true),
  ];
}