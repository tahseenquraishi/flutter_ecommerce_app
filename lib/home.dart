import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/config/size_config.dart';
import 'package:flutter_ecommerce_app/constant.dart';
import 'package:flutter_ecommerce_app/productDetail.dart';
import 'package:flutter_ecommerce_app/style.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedCategory = 0;
  List selectedCategoryList = chairs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RawMaterialButton(
            elevation: 2,
            onPressed: () {},
            constraints: BoxConstraints(
              minWidth: 10,
            ),
            child: SvgPicture.asset('assets/menu.svg',
                width: 20, color: AppColors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: AppColors.white,
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical * 4),
          Padding(
            padding: standardPaddingX,
            child: PrimaryText(
                text: 'Discover your best furniture',
                fontWeight: FontWeight.w700,
                size: 36),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          Padding(
            padding: standardPaddingX,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  contentPadding: EdgeInsets.all(15),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGray,
                      fontSize: 18),
                  prefixIcon:
                      Icon(Icons.search, size: 30, color: AppColors.black)),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical * 3),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(
                  left: index == 0 ? 25 : 0,
                  right: 20,
                ),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCategory = index;
                      selectedCategoryList =
                          categories[index]['arrayMappedname'];
                    });
                  },
                  child: PrimaryText(
                    text: categories[index]['label'],
                    color: selectedCategory == index
                        ? AppColors.white
                        : AppColors.textGray,
                    fontWeight: FontWeight.w500,
                    size: 18,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: selectedCategory == index
                        ? AppColors.primary
                        : Colors.grey[200],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Padding(
            padding: standardPaddingX,
            child: Row(
              children: [
                PrimaryText(
                    text: 'Popular', fontWeight: FontWeight.w800, size: 28),
                Spacer(),
                PrimaryText(
                    text: 'View all',
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                    size: 20)
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
          Expanded(
            child: Padding(
              padding: standardPaddingX,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      selectedCategoryList.length,
                      (index) => productCard(
                          context,
                          selectedCategoryList[index]["image"],
                          selectedCategoryList[index]["label"],
                          selectedCategoryList[index]["price"]))),
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard(
      BuildContext context, String image, String label, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail(image)));
      },
      child: Hero(
        tag: image,
              child: Container(
          padding: EdgeInsets.all(10),
          width: (SizeConfig.screenWidth - 80) / 2,
          height: SizeConfig.blockSizeVertical * 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                            text: label, color: AppColors.textGray, size: 16),
                        SizedBox(height: 5),
                        PrimaryText(
                            text: price, size: 18, fontWeight: FontWeight.w700),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 0,
                    child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 0,
                        constraints: BoxConstraints(
                          minWidth: 0,
                        ),
                        shape: CircleBorder(),
                        fillColor: AppColors.primary,
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.add, size: 16, color: AppColors.white)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
