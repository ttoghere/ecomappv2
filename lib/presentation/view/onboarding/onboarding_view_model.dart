import 'dart:async';
import 'package:ecomappv2/domain/domain_shelf.dart';
import 'package:ecomappv2/presentation/base/base_view_model.dart';
import 'package:ecomappv2/presentation/management/management_shelf.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SlideViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int previousIndex = _currentIndex++;
    if (previousIndex >= _list.length - 1) {
      _currentIndex = 0;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == 0) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged({required int index}) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObjects
  Sink get inputSliderViewObjects => _streamController.sink;

//Outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);
//Private Functions
  List<SliderObject> _getSliderData() => [
        SliderObject(
          title: StringManager.onBoardTitle1,
          subtitle: StringManager.onBoardSubtitle1,
          image: ImageManagement.appLogo,
        ),
        SliderObject(
          title: StringManager.onBoardTitle2,
          subtitle: StringManager.onBoardSubtitle2,
          image: ImageManagement.appLogo,
        ),
        SliderObject(
          title: StringManager.onBoardTitle3,
          subtitle: StringManager.onBoardSubtitle3,
          image: ImageManagement.appLogo,
        ),
        SliderObject(
          title: StringManager.onBoardTitle4,
          subtitle: StringManager.onBoardSubtitle4,
          image: ImageManagement.appLogo,
        ),
      ];

  void _postDataToView() {
    inputSliderViewObjects.add(SlideViewObject(
      sliderObject: _list[_currentIndex],
      numOfSlides: _list.length,
      currentIndex: _currentIndex,
    ));
  }
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged({required int index});
  Sink get inputSliderViewObjects;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SlideViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}
