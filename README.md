# curved_navigation_bar
[pub package](https://pub.dartlang.org/packages/curved_navigation_bar)

A Flutter package for easy implementation of curved navigation bar. 

![Gif](https://github.com/rafalbednarczuk/curved_navigation_bar/blob/master/example.gif "Fancy Gif")

### Add dependency

```yaml
dependencies:
  curved_navigation_bar: ^2.0.0 #latest version
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
index: index of NavigationBar, can be used to change current index or to set initial index  
color: Color of NavigationBar, default Colors.white  
buttonBackgroundColor: background color of floating button, default same as color attribute  
backgroundColor: Color of NavigationBar's background, default Colors.blueAccent  
onTap: Function handling taps on items  
animationCurve: Curves interpolating button change animation, default Curves.easeOutCubic  
animationDuration: Duration of button change animation, default Duration(milliseconds: 600)  
height: Height of NavigationBar, min 0.0, max 75.0  
