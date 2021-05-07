import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/config/size_config.dart';
import 'package:flutter_ecommerce_app/style.dart';

class ProductDetail extends StatelessWidget {
  final String image;
  ProductDetail(this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: PrimaryText(text: "Buy Now", color: AppColors.white, size: 18),
        style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Hero(
              tag: image,
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 50),
                height: SizeConfig.screenHeight / 1.7,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
                child: Padding(
                  padding: standardPaddingX,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: RawMaterialButton(
                          
                          elevation: 2,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          constraints: BoxConstraints(
                            minWidth: 10,
                            maxWidth: 50
                          ),
                          child: Icon(Icons.chevron_left,
                              color: AppColors.black, size: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: AppColors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: PrimaryText(
                      //     text: 'Detail',
                      //     fontWeight: FontWeight.w700,
                      //     size: 22,
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      Flexible(
                        flex: 3,
                        fit: FlexFit.loose,
                        child: RawMaterialButton(
                          elevation: 2,
                          onPressed: () {},
                          constraints: BoxConstraints(
                            minWidth: 10,
                          ),
                          child: Icon(Icons.favorite_border,
                              color: AppColors.black, size: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: AppColors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                transform: Matrix4.translationValues(0, -30, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: AppColors.white,
                ),
                width: SizeConfig.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50.0,
                        height: 6.0,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 3.5,
                    ),
                    PrimaryText(
                        text: "Monay Chair",
                        size: 26,
                        fontWeight: FontWeight.w700),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryText(
                          text: "\$80.00",
                          size: 32,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              RawMaterialButton(
                                constraints: BoxConstraints(minWidth: 0),
                                onPressed: () {},
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.textGray,
                                  size: 20,
                                ),
                                fillColor: Colors.grey[200],
                                padding: EdgeInsets.all(5.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              PrimaryText(
                                text: "01",
                                size: 18,
                                color: AppColors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RawMaterialButton(
                                constraints: BoxConstraints(minWidth: 0),
                                elevation: 0,
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.textGray,
                                  size: 20,
                                ),
                                fillColor: Colors.grey[200],
                                padding: EdgeInsets.all(5.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    PrimaryText(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      size: 17,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
