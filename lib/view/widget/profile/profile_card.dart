import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/constant/app_int.dart';

class StudentCard extends StatelessWidget {
  final String? title;
  final String? description;

  const StudentCard({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppInt.horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(159, 199, 199, 199).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          color: const Color.fromARGB(0, 121, 102, 102),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(25),
            splashColor: AppColor.secondaryColor.withOpacity(0.3),
            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description ?? "",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[400],
                      child: const Icon(
                        Icons.person,
                        color: AppColor.primaryColor,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
