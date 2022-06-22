import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pixel_project/core/base/view/base_view.dart';
import 'package:flutter_pixel_project/core/extension/context_extension.dart';
import 'package:flutter_pixel_project/core/extension/spacer_extension.dart';
import 'package:flutter_pixel_project/core/extension/theme_extension.dart';
import 'package:flutter_pixel_project/view/home/nutritionist_detail/components/text_with_number_detail_card.dart';
import 'package:flutter_pixel_project/view/home/nutritionist_detail/view_model/home_view_model.dart';

part '../components/home_view_sheet_contents.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.green,
        floatingActionButton: buildFABContainer,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_active))
          ],
        ),
        bottomSheet: buildBottomSheet,
        body: buildPageContent,
      ),
      onDispose: () {},
    );
  }

  Container get buildFABContainer {
    return Container(
        height: context.normalHeight,
        width: context.highWidth,
        margin: EdgeInsets.only(bottom: context.lowHeight),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.orangeAccent, width: 2),
            image: const DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"))));
  }

  Widget get buildPageContent => Container(
        width: double.infinity,
        height: context.calculateDynamicHeight(40),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")),
        ),
      );
}
