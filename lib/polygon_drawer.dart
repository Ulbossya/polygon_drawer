import 'package:flutter/material.dart';
import 'background_painter.dart';
import 'polygon_painter.dart';
import 'clear_button.dart';

class PolygonDrawer extends StatefulWidget {
  @override
  _PolygonDrawerState createState() => _PolygonDrawerState();
}

class _PolygonDrawerState extends State<PolygonDrawer> {
  List<List<Offset>> _undoHistory = [];
  List<List<Offset>> _redoHistory = [];
  List<Offset> _points = [];

  void _clear() {
    setState(() {
      _points.clear();
      _undoHistory.clear();
      _redoHistory.clear();
    });
  }

  void _undo() {
    setState(() {
      if (_undoHistory.isNotEmpty) {
        _redoHistory.add(List.from(_points));
        _points = List.from(_undoHistory.last);
        _undoHistory.removeLast();
      }
    });
  }

  void _redo() {
    setState(() {
      if (_redoHistory.isNotEmpty) {
        _undoHistory.add(List.from(_points));
        _points = List.from(_redoHistory.last);
        _redoHistory.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(227, 227, 227, 1),
        child: Stack(
          children: [
            BackgroundPainter(),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _points.add(details.localPosition);
                });
              },
              onPanEnd: (details) {
                _points.add(_points.first); 
                _undoHistory.add(List.from(_points));
                _redoHistory.clear();
              },
              child: CustomPaint(
                painter: PolygonPainter(points: _points),
                size: Size.infinite,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClearButton(
                onPressed: _clear,
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    icon: Image.asset('img/back.png'),
                    onPressed: _undo,
                  ),
                  IconButton(
                    icon: Image.asset('img/next.png'), 
                    onPressed: _redo,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

