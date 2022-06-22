import 'package:ecomappv2/domain/domain_shelf.dart';
import 'package:ecomappv2/presentation/view/onboarding/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecomappv2/presentation/management/management_shelf.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  OnBoardingViewModel _viewModel = OnBoardingViewModel();
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
    return _getContent();
  }

  Widget _getContent() {
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
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        itemBuilder: (context, index) {
          return OnBoardView(sliderObject: _list[index]);
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
              pageController: _pageController,
              currentIndex: _currentIndex,
              list: _list,
            )
          ],
        ),
      ),
    );
  }
}

class GetIndexDots extends StatelessWidget {
  final PageController pageController;
  int currentIndex;
  final List<SliderObject> list;
  GetIndexDots({
    Key? key,
    required this.pageController,
    required this.currentIndex,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                _getPreviousIndex(),
                duration: const Duration(milliseconds: DurationConstants.d300),
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
                _getNextIndex(),
                duration: const Duration(milliseconds: DurationConstants.d300),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
      ],
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
