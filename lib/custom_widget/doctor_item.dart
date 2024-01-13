import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class DoctorItem extends StatelessWidget {
  final String? name, imageUrl, address, specialize;

  const DoctorItem(
      {super.key, this.name, this.imageUrl, this.address, this.specialize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0 , right: 10.0 , top: 20.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xFFE8F3F1)),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: whiteColor,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          width: 160,
                          child: Text(
                            specialize!,
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 12,
                              color: Get.isDarkMode ? grayColor : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 15,
                          color: mainColor,
                        ),
                        Container(
                          width: 140,
                          child: Text(
                            address!,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              color: Get.isDarkMode ? grayColor : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
