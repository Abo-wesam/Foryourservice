import 'package:flutter/material.dart';


class SliderModel{

  String? imageAssetPath;
  String? title;
  String? desc;

  SliderModel({  this.imageAssetPath,  this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String? getImageAssetPath(){
    return imageAssetPath;
  }

  String? getTitle(){
    return title;
  }

  String? getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel();

  //0
  sliderModel.setDesc("");
  sliderModel.setTitle("Welcome To RAFIQI");
  sliderModel.setImageAssetPath("assets/images/loog.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  //1
  sliderModel.setDesc("Transportation services for users who require assistance getting to appointments or other locations.");
  sliderModel.setTitle("Transportation");
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //2//delete
  // sliderModel.setDesc("Request delivery services for essential items such as food, groceries, and medication.");
  // sliderModel.setTitle("Delivery");
  // sliderModel.setImageAssetPath("assets/images/illustration2.png");
  // slides.add(sliderModel);
  //
  // sliderModel = SliderModel();

  //2
  sliderModel.setDesc("Request delivery services for essential items such as food, groceries, and medication.");
  sliderModel.setTitle("Delivery");
  sliderModel.setImageAssetPath("assets/images/illustration3.png");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}