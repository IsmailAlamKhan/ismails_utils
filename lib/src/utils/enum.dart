import '../src.dart';

/// ScreenSize enum that is used on [ScreenUtil]
enum ScreenSize {
  SmallPhone,
  MediumPhone,
  LargePhone,
  XLargePhone,
  SmallTab,
  MediumTab,
  LargeTab,
  XLargeTab,
  NONE
}

enum MouseClick { rightButton, leftButton, middleButton, unk }
enum ControlAffinity { trailing, leading }

typedef ValueTransformer<T> = dynamic Function(T value);
