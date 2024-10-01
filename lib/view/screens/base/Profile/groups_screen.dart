import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qimah_admin/bloc/group%20blocs/get%20group%20bloc/get_group_bloc.dart';
import 'package:qimah_admin/core/shared/custom_floating_action_button.dart';
import 'package:qimah_admin/core/shared/handle_Floating_ActionButtonPress.dart';
import 'package:qimah_admin/core/shared/search_text_field.dart';
import 'package:qimah_admin/core/shared/top_bar.dart';
import 'package:qimah_admin/view/widget/groups/group_card.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    GetGroupBloc getGroupBloc = context.read<GetGroupBloc>();
    getGroupBloc.add(GetGroupPressedEvent());

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
                BlocBuilder<GetGroupBloc, GetGroupState>(
                  builder: (context, state) {
                    if (state is GetGroupSuccess) {
                      if (state.groups.isEmpty) {
                        return const Text(
                            "لا يوجد أي حلقات بعد\n قم بإنشاء واحدة");
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.groups.length,
                          itemBuilder: (context, index) {
                            return GroupCard(
                              groupModel: state.groups[index],
                            );
                          },
                        ),
                      );
                    } else if (state is GetGroupLoading) {
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
            text: "الحلقات",
          ),
        ],
      ),
    );
  }
}
