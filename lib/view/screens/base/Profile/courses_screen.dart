import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/course%20blocs/get%20course%20bloc/get_course_bloc.dart';
import 'package:qimah_admin/core/shared/custom_floating_action_button.dart';
import 'package:qimah_admin/core/shared/handle_Floating_ActionButtonPress.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/course/course_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetCourseBloc getCourseBloc = context.read<GetCourseBloc>();
    getCourseBloc.add(GetCoursePressedEvent());
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          handleFloatingActionButtonPress(context);
        },
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 100),
                const SearchTextField(),
                BlocBuilder<GetCourseBloc, GetCourseState>(
                  builder: (context, state) {
                    if (state is GetCourseSuccess) {
                      if (state.courses.isEmpty) {
                        return const Text(
                            "لا يوجد أي حلقات بعد\n قم بإنشاء واحدة");
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.courses.length,
                          itemBuilder: (context, index) {
                            return CourseCard(
                              courseModel: state.courses[index],
                            );
                          },
                        ),
                      );
                    } else if (state is GetCourseLoading) {
                      return Column(
                        children: [
                          SizedBox(height: Get.height / 3),
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
          const TopBar(
            text: "الدورات",
          ),
        ],
      ),
    );
  }
}
