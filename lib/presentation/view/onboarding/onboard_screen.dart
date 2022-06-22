import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecomappv2/domain/domain_shelf.dart';
import 'package:ecomappv2/presentation/management/management_shelf.dart';
import 'package:ecomappv2/presentation/view/onboarding/onboarding_view_model.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final PageController _pageController = PageController(initialPage: 0);
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContent(slideViewObject: snapshot.data);
        });
  }

  Widget _getContent({SlideViewObject? slideViewObject}) {
    if (slideViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: slideViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index: index);
          },
          itemBuilder: (context, index) {
            return OnBoardView(sliderObject: slideViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s18,
              ),
              GetIndexDots(
                onBoardingViewModel: _viewModel,
                pageController: _pageController,
                slideViewObject: slideViewObject,
              ),
            ],
          ),
        ),
      );
    }
  }
}

class GetIndexDots extends StatelessWidget {
  final OnBoardingViewModel onBoardingViewModel;
  final PageController pageController;
  final SlideViewObject slideViewObject;
  const GetIndexDots({
    Key? key,
    required this.onBoardingViewModel,
    required this.pageController,
    required this.slideViewObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              AppPadding.p14,
            ),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(
                  Icons.arrow_left_outlined,
                  color: ColorManager.primary,
                ),
              ),
              onTap: () {
                pageController.animateToPage(
                  onBoardingViewModel.goPrevious(),
                  duration:
                      const Duration(milliseconds: DurationConstants.d300),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              StringManager.skip,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              AppPadding.p14,
            ),
            child: GestureDetector(
              child: const SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: Icon(
                  Icons.arrow_right_outlined,
                  color: ColorManager.primary,
                ),
              ),
              onTap: () {
                pageController.animateToPage(
                  onBoardingViewModel.goNext(),
                  duration:
                      const Duration(milliseconds: DurationConstants.d300),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardView extends StatelessWidget {
  SliderObject sliderObject;
  OnBoardView({
    Key? key,
    required this.sliderObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        Image.asset(sliderObject.image),
      ],
    );
  }
}
