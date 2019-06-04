import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'src/nav_button.dart';
import 'src/nav_custom_painter.dart';

const double defaultHeight = 75.0;

class CurvedNavigationBar<T> extends StatefulWidget {
  final List<T> items;
  final int index;
  final Color color;
  final Color buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final double shadow;

  CurvedNavigationBar({
    Key key,
    @required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.height = defaultHeight,
    this.shadow,
  })
      : assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(items is List<CurvedNavigationItem> || items is List<Icon>),
        assert(0 <= height && height <= defaultHeight),
        super(key: key);

  @override
  _CurvedNavigationBarState createState() => _CurvedNavigationBarState();
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  double _startingPos;
  int _endingIndex = 0;
  double _pos;
  double _buttonHide = 0;
  Widget _icon;
  AnimationController _animationController;
  int _length;

  @override
  void initState() {
    super.initState();
    _icon = _buildIcon(widget.items[widget.index]);
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = _buildIcon(widget.items[_endingIndex]);
        }
        _buttonHide =
            (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _update(widget.index);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildIcon<T>(item) {
    return (item is CurvedNavigationItem ? item.icon : item);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: -40 - (defaultHeight - widget.height),
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  0,
                  -(1 - _buttonHide) * 80,
                ),
                child: Material(
                  color: widget.buttonBackgroundColor ?? widget.color,
                  type: MaterialType.circle,
                  elevation: widget.shadow,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _icon,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (defaultHeight - widget.height),
            child: CustomPaint(
              painter: NavCustomPainter(
                  _pos, _length, widget.color, Directionality.of(context),
                  widget.shadow),

              child: Container(
                height: defaultHeight,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (defaultHeight - widget.height),
            child: SizedBox(
//                height: 100.0,
                child: Row(
                    children: widget.items.map((item) {
                      return NavButton(
                        onTap: _buttonTap,
                        position: _pos,
                        length: _length,
                        index: widget.items.indexOf(item),
                        icon: _buildIcon(item),
                        text: item is CurvedNavigationItem ? item.text : null,
                      );
                    }).toList())),
          ),
        ],
      ),
    );
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      widget.onTap(index);
    }
    _update(index);
  }

  void _update(int index) {
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}

class CurvedNavigationItem {
  final Widget icon, text;

  CurvedNavigationItem({@required this.icon, this.text}) : assert(icon != null);
}