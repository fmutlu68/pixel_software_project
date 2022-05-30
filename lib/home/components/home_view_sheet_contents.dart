part of '../view/home_view.dart';

extension HomeViewSheetContentsExtension on _HomeViewState {
  BottomSheet get buildBottomSheet => BottomSheet(
        constraints: BoxConstraints.tightFor(
            height: context.veryHighHeight, width: double.infinity),
        enableDrag: false,
        elevation: 0,
        clipBehavior: Clip.none,
        builder: (context) => buildBottomSheetContent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            side: BorderSide.none),
        onClosing: () {},
      );

  Widget get buildBottomSheetContent => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: EdgeInsets.only(top: context.lowHeight),
        child: Column(
          children: [
            buildTitleText,
            context.veryLowHeightSpacer,
            buildLocationText,
            buildStatisticsTextList,
            buildActionsButtonList,
            buildChoicesList,
          ],
        ),
      );
  Widget get buildTitleText => Text("Dyt. Arzu Çetiner",
      style:
          context.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold));

  Widget get buildLocationText => Wrap(
        alignment: WrapAlignment.center,
        children: [
          const Icon(Icons.location_pin),
          context.veryLowWidthSpacer,
          const Text("Selçuklu / KONYA")
        ],
      );

  Widget get buildStatisticsTextList => Wrap(
        spacing: context.lowWidth,
        alignment: WrapAlignment.spaceBetween,
        children: const [
          TextWithNumberDetailCard(text: "Takipçi", numberText: "14K"),
          TextWithNumberDetailCard(text: "Danışan", numberText: "120"),
          TextWithNumberDetailCard(text: "İçerik", numberText: "200"),
        ],
      );

  Widget get buildActionsButtonList => ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Colors.orange)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.orange, shape: const StadiumBorder()),
            child: const Text("Randevu Al"),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message, color: Colors.orange)),
        ],
      );

  Widget get buildChoicesList => SizedBox(
        width: double.infinity,
        height: context.lowHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.models.length,
          itemBuilder: (context, index) {
            return Observer(builder: (_) {
              return ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: context.veryLowWidth),
                label: Text(viewModel.models[index].text),
                selected:
                    viewModel.selectedChoice == viewModel.models[index].id,
                onSelected: (_) {
                  viewModel.changeChoice(viewModel.models[index].id);
                },
                backgroundColor: Colors.transparent,
                selectedColor: Colors.transparent,
                labelStyle: context.textTheme.subtitle2?.copyWith(
                  color: viewModel.selectedChoice == viewModel.models[index].id
                      ? Colors.orange
                      : Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                elevation: 0,
                pressElevation: 0,
                selectedShadowColor: Colors.transparent,
              );
            });
          },
        ),
      );
}
