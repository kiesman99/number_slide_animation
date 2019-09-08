# Example

A simple example

```dart
class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Example"),
      ),
      body: Container(
        child: Center(
          child: NumberSlideAnimation(
            number: "12345678987654321",
            duration: const Duration(seconds: 2),
            curve: Curves.bounceIn,
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
```

![Samlpe](../pub_assets/sample.gif)