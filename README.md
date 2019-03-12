# curved_navigation_bar
[pub package](https://pub.dartlang.org/packages/curved_navigation_bar)

A Flutter package for easy implementation of curved navigation bar. 

![Gif](https://github.com/rafalbednarczuk/curved_navigation_bar/blob/master/example.gif "Fancy Gif")

### Add dependency

```yaml
dependencies:
  curved_navigation_bar: ^0.1.23 #latest version
```

### Easy to use

```dart
Scaffold(
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
  body: Container(color: Colors.blueAccent),
)
```

### Attributes

items: List of Widgets  
initialIndex: Initial index of Curve
color: Color of NavigationBar, default Colors.white  
backgroundColor: Color of NavigationBar's background, default Colors.blueAccent  
onTap: Function handling taps on items  
curve: Curves interpolating button change animation, default Curves.easeOutCubic  
duration: Duration of button change animation, default Duration(milliseconds: 600)
