import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String parentId;
  String image;
  String name;
  bool isFeatured;

  CategoryModel({
    required this.image,
    required this.name,
    required this.id,
    this.parentId = '',
    required this.isFeatured,
});
  ///empty helper functions
  static CategoryModel empty() => CategoryModel(image: '', name: '', id: '', isFeatured: false);

  //convert model to json structure oso that you can store data in firestore
  Map<String,dynamic> toJson(){
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  //map from firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data()!= null){
      final data = document.data()!;

      //return JSon record to model
      return CategoryModel(
          image: data['Image'] ?? '',
          name: data['Name'] ?? '',
          parentId: data['ParentId'] ?? '',
          id: document.id,
          isFeatured: data['isFeatured'] ?? false);
    }else
      {
        return CategoryModel.empty();
      }
  }


}