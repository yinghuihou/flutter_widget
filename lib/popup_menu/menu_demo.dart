import 'package:flutter/material.dart';

class MenuDemo extends StatefulWidget {
  const MenuDemo({Key key}) : super(key: key);

  static const String routeName = '/material/menu';

  @override
  MenuDemoState createState() => MenuDemoState();
}

class MenuDemoState extends State<MenuDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue;

  final String _checkedValue1 = 'One';
  final String _checkedValue2 = 'Two';
  final String _checkedValue3 = 'Free';
  final String _checkedValue4 = 'Four';
  List<String> _checkedValues;

  String menu1String = "menu1";

  @override
  void initState() {
    super.initState();
    _simpleValue = _simpleValue2;
    _checkedValues = <String>[_checkedValue3];
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  void showMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
    showInSnackBar('You selected: $value');
  }

  void showCheckedMenuSelections(String value) {
    if (_checkedValues.contains(value))
      _checkedValues.remove(value);
    else
      _checkedValues.add(value);

    showInSnackBar('Checked $_checkedValues');
  }

  bool isChecked(String value) => _checkedValues.contains(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Menus'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                  value: 'Toolbar menu',
                  child: Text('Toolbar menu'),
                ),
                const PopupMenuItem<String>(
                  value: 'Right here',
                  child: Text('Right here'),
                ),
                const PopupMenuItem<String>(
                  value: 'Hooray!',
                  child: Text('Hooray!'),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              PopupMenuButton<String>(
                offset: Offset(100, 50),
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    menu1String,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onSelected: (value){
                  setState(() {
                    menu1String = value;
                  });
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: "one",
                    child: Container(
                      width: 500,
                      child: Text('one'),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "two",
                    child: Text('two'),
                  ),
                  PopupMenuItem<String>(
                    value: "three",
                    child: const Text('three'),
                  ),
                ],
              ),
              ListTile(
                title: const Text('An item with a sectioned menu'),
                trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: showMenuSelection,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Preview',
                      child: ListTile(
                        leading: Icon(Icons.visibility),
                        title: Text('Preview'),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Share',
                      child: ListTile(
                        leading: Icon(Icons.person_add),
                        title: Text('Share'),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Get Link',
                      child: ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Get link'),
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'Remove',
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Remove'),
                      ),
                    ),
                  ],
                ),
              ),
              // This entire list item is a PopupMenuButton. Tapping anywhere shows
              // a menu whose current value is highlighted and aligned over the
              // list item's center line.
              PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                initialValue: _simpleValue,
                onSelected: showMenuSelection,
                child: ListTile(
                  title: const Text('An item with a simple menu'),
                  subtitle: Text(_simpleValue),
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: _simpleValue1,
                    child: Text(_simpleValue1),
                  ),
                  PopupMenuItem<String>(
                    value: _simpleValue2,
                    child: Text(_simpleValue2),
                  ),
                  PopupMenuItem<String>(
                    value: _simpleValue3,
                    child: Text(_simpleValue3),
                  ),
                ],
              ),
              // Pressing the PopupMenuButton on the right of this item shows a menu
              // whose items have checked icons that reflect this app's state.
              ListTile(
                title: const Text('An item with a checklist menu'),
                trailing: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: showCheckedMenuSelections,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue1,
                      checked: isChecked(_checkedValue1),
                      child: Text(_checkedValue1),
                    ),
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue2,
                      enabled: false,
                      checked: isChecked(_checkedValue2),
                      child: Text(_checkedValue2),
                    ),
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue3,
                      checked: isChecked(_checkedValue3),
                      child: Text(_checkedValue3),
                    ),
                    CheckedPopupMenuItem<String>(
                      value: _checkedValue4,
                      checked: isChecked(_checkedValue4),
                      child: Text(_checkedValue4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
