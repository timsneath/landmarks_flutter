## The good

- So far (step 2), it's proven relatively easy to recreate the SwiftUI design
  accurately.

- Parsing JSON is easier in Dart than Swift.

## The bad and the ugly

- Default [type ramp defined for
  iOS](https://developer.apple.com/design/human-interface-guidelines/foundations/typography/)
  isn't available by default. I had to simulate this with rather unwieldy code.

- `CircleAvatar` and `Divider` widgets have no Cupertino equivalent. I had to
  use the Material ones :(

- The [Cupertino widget
  catalog](https://docs.flutter.dev/development/ui/widgets/cupertino) is
  disappointingly out of date and missing most of the good work the team has
  done over the last couple of years. It's missing most of the widgets we've
  implemented. Frustratingly, [the Cupertino library
  page](https://api.flutter.dev/flutter/cupertino/cupertino-library.html)
  includes endless numbers of widgets that aren't anything to do with Cupertino,
  such as `AndroidView` (!)

- I have a general sense that some of these widgets aren't tested in real-world
  integrated scenarios. This might be completely unfair, but for example, I
  tried to reproduce this sample. I wanted to use
  CupertinoFormSection.insetGrouped to match the iOS 14 view, but it didn't
  appear to support slivers or scrolling for the title. (At least, I wasn't able
  to figure this out.) If this is supported, a small sample would be much
  appreciated.
  
  I wound up with [a batteries-not-included approach that I stole from a
  codelab](https://github.com/flutter/codelabs/blob/master/cupertino_store/step_06/lib/product_list_tab.dart),
  which isn't very readable and certainly far more complex than the version in
  the SwiftUI codelab.

- Loading a local JSON asset in Flutter is rather painful. I'm not sure I've
  done it the best way. A `FutureBuilder` seems way overkill to load a local
  file. `WidgetsFlutterBinding.ensureInitialized();` isn't exactly obvious.

## Other notes

- The SwiftUI preview is rather nice, and has improved since I looked at it a
  year or two ago.
  
  1. It's useful to be able to see just a part of an app. I found
  myself having to make temporary changes to my code to be able to see a Flutter
  widget while in construction. I wound up creating a PreviewProvider of my own
  for test purposes:

```dart
class PreviewProvider extends StatelessWidget {
  const PreviewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: LandmarkRow(landmark: landmarks.first),
      ),
    );
  }
}
```

  1. It's particularly good that it offers light / dark mode, accessibility
     settings, etc. I don't think we lead people in the right direction for
     Flutter here.

- I can never remember whether `super.key` comes first or last. We should have a
  default lint for that, I think. Even if it doesn't matter, it's reassuring.
