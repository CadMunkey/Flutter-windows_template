import 'package:desktop_window/desktop_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    DesktopWindow.setMinWindowSize(Size(400, 400));
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _windowSize = 'Unknown';
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  Future _getWindowSize() async {
    var size = await DesktopWindow.getWindowSize();
    await DesktopWindow.setMinWindowSize(const Size(400, 400));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FluentApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            accentColor: Colors.blue,
            iconTheme: const IconThemeData(size: 24)),
        darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            accentColor: Colors.blue,
            iconTheme: const IconThemeData(size: 24)),
        home: NavigationView(
          appBar: NavigationAppBar(title: const Text("Fluent Design App Bar")),
          pane: NavigationPane(
              selected: index,
              onChanged: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
              displayMode: PaneDisplayMode.auto,
              items: [
                PaneItem(
                    icon: Icon(FluentIcons.code), title: Text("Sample Page 1")),
                PaneItem(
                    icon: Icon(FluentIcons.developer_tools),
                    title: Text("Sample Page 2"))
              ]),
        ));
  }
}
