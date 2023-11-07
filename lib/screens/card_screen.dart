import 'dart:math';

import 'package:car_app_ui/share/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class CardPage extends StatefulWidget {
  String? carImage;
  String? carClass;
  String? carName;
  int? carPower;
  String? people;
  String? bags;
  int? carPrice;
  String? carRating;
  bool? isRotated;

  CardPage(
      {this.carImage,
      this.carClass,
      this.carName,
      this.carPower,
      this.people,
      this.bags,
      this.carPrice,
      this.carRating,
      this.isRotated});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff3b22a1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: size.width * 0.15,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                  Get.back(); //go back to home page
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF020060),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    UniconsLine.multiply,
                    color: themeData.secondaryHeaderColor,
                    size: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: Color(0xff3b22a1),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Stack(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      widget.isRotated!
                          ? Image.asset(
                              widget.carImage!,
                              height: size.width * 0.5,
                              width: size.width * 0.8,
                              fit: BoxFit.contain,
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(pi),
                              child: Image.asset(
                                widget.carImage!,
                                height: size.width * 0.5,
                                width: size.width * 0.8,
                                fit: BoxFit.contain,
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.carClass!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: size.width * 0.05,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget.carRating!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.yellow[800],
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.carName!,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${widget.carPrice}\Rp',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildStat(
                              UniconsLine.dashboard,
                              '${widget.carPower} KM',
                              'Power',
                              size,
                              themeData,
                            ),
                            buildStat(
                              UniconsLine.users_alt,
                              'People',
                              '( ${widget.people} )',
                              size,
                              themeData,
                            ),
                            buildStat(
                              UniconsLine.briefcase,
                              'Bags',
                              '( ${widget.bags} )',
                              size,
                              themeData,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
