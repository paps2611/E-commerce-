import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  //variable
  final _db =  FirebaseFirestore.instance;

  //get all order related to current user


  //upload banners to cloud Firestore

}