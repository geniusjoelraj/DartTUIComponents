import 'dart:io';
import 'package:dart_console/dart_console.dart';

final console = Console();

class Menu {
  List<dynamic> menuItems;

  Menu(this.menuItems);
  Map<String, bool> checked = <String, bool>{};

  /// Display menu items
  void displayMenu() {
    for (var item in menuItems) {
      checked[item] = false;
    }

    int selectedIndex = 0;
    console.hideCursor();
    while (true) {
      console.clearScreen();
      console.resetCursorPosition();
      console.writeLine(
        "Use arrow keys to navigate. Press SpaceBar to check or uncheck.\n",
      );

      // Display menu items
      for (int i = 0; i < menuItems.length; i++) {
        if (i == selectedIndex) {
          console.setForegroundColor(ConsoleColor.green);
          if (checked[menuItems[i]] == true) {
            console.writeLine("> [x] ${menuItems[i]}");
          } else {
            console.writeLine("> [ ] ${menuItems[i]}");
          }
          console.resetColorAttributes();
        } else {
          if (checked[menuItems[i]] == true) {
            console.writeLine("  [x] ${menuItems[i]}");
          } else {
            console.writeLine("  [ ] ${menuItems[i]}");
          }
        }
      }

      // Reading input
      var key = console.readKey();

      if (key.controlChar == ControlCharacter.arrowUp) {
        if (selectedIndex != 0) {
          selectedIndex -= 1;
        }
      } else if (key.controlChar == ControlCharacter.arrowDown) {
        if (selectedIndex != menuItems.length - 1) {
          selectedIndex += 1;
        }
      } else if (key.char == ' ') {
        checked[menuItems[selectedIndex]] = !checked[menuItems[selectedIndex]]!;
      } else if (key.char == 'q') {
        console.clearScreen();
        exit(0);
      }
    }
  }
}
