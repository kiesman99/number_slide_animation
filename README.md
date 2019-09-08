# number_slide_animation

With this package you can display a number using a neat sliding animation.

![Sample](./pub_assets/sample.gif)

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

I wanted this kind of Animation in my application and thought some of you may want to use it too.
It is very easy to set up and can be used for example as a neat intro animation.

# Todo

- [ ] Add functionality to set a custom delay for each number
- [ ] Add functionality to set a delayed start

# License

```
MIT License

Copyright (c) 2019 Justin Vietz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```