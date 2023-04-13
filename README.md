# Calculator

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.
This is a simple calculator app built using the Flutter framework. The app has a basic UI with a black background and white text. It consists of a text field where users can input mathematical expressions and get the result of the calculation in real-time.

The main() function runs the app by calling runApp(), which takes an instance of the Calculator widget.

The Calculator widget is a stateful widget, which has two string variables userInput and answer initialized to empty strings. The build() method of the widget creates the UI of the calculator.

The UI is composed of a Scaffold widget with a black background and a Center widget containing a Column widget. The Column widget contains multiple Row widgets, each with four MyButton widgets that represent the different buttons of the calculator.

The MyButton widget is a custom widget that represents a button on the calculator. It takes four arguments: the button text, the button background color, the button text color, and an onPress function that is called when the button is pressed.

The equalPress() function evaluates the userInput string and returns the result. It uses the math_expressions library to evaluate the expression and stores the result in the answer variable.

The setState() method is used to update the UI of the calculator whenever the userInput or answer variables change.
