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

- Loading a local JSON asset in Flutter is rather painful. I'm not sure I've
  done it the best way. A `FutureBuilder` seems way overkill to load a local
  file. `WidgetsFlutterBinding.ensureInitialized();` isn't exactly obvious.

## Other notes

- The SwiftUI preview is rather nice, and has improved since I looked at it a
  year or two ago. It's useful to be able to see just a part of an app. I found
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
```dart

- I can never remember whether `super.key` comes first or last. We should have a default lint for that, I think. Even if it doesn't matter, it's reassuring.
