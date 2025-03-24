import 'dart:io';
import 'package:dart_console/dart_console.dart';

final console = Console();

class Menu {
  List<dynamic> menuItems;

  Menu(this.menuItems);

  /// Display menu items
  void displayMenu() {
    int selectedIndex = 0;

    while (true) {
      console.clearScreen();
      console.resetCursorPosition();
      console.writeLine("Use arrow keys to navigate. Press Enter to select.\n");

      // Display menu items
      for (int i = 0; i < menuItems.length; i++) {
        if (i == selectedIndex) {
          console.setForegroundColor(ConsoleColor.green);
          console.writeLine("> ${menuItems[i]}");
          console.resetColorAttributes();
        } else {
          console.writeLine("  ${menuItems[i]}");
        }
      }

      // Capture user input
      var key = console.readKey();

      if (key.controlChar == ControlCharacter.arrowUp) {
        if (selectedIndex != 0) {
          selectedIndex -= 1;
        }
      } else if (key.controlChar == ControlCharacter.arrowDown) {
        if (selectedIndex != menuItems.length - 1) {
          selectedIndex += 1;
        }
      } else if (key.controlChar == ControlCharacter.enter) {
        console.clearScreen();
        console.writeLine("You have selected ${menuItems[selectedIndex]}");
        if (menuItems[selectedIndex] == "Exit") {
          exit(0);
        }
        sleep(Duration(seconds: 1));
      }
    }
  }
}
