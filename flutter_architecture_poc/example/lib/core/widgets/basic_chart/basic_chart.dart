import 'dart:math';

import 'package:flutter/material.dart';

import 'package:example/core/helpers/helpers.dart';

part 'basic_chart_model.dart';

const int yAxisCount = 5;
const int xAxisCount = 5;

class BasicChart extends StatelessWidget {
  const BasicChart({
    required this.data,
    Key? key,
    this.chartColor = Colors.orange,
    this.size = const Size(300, 300),
  }) : super(key: key);

  final List<BasicChartModel> data;
  final Color chartColor;
  final Size size;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: _BasicChartPainter(data, chartColor),
        ),
      );
}

class _BasicChartPainter extends CustomPainter {
  _BasicChartPainter(this.data, this.chartColor);

  final List<BasicChartModel> data;
  final Color chartColor;

  @override
  void paint(Canvas canvas, Size size) {
    final double minX = data
        .reduce((BasicChartModel value, BasicChartModel element) =>
            value.epoch < element.epoch ? value : element)
        .epoch
        .toDouble();
    final double maxX = data
        .reduce((BasicChartModel value, BasicChartModel element) =>
            value.epoch > element.epoch ? value : element)
        .epoch
        .toDouble();
    final double minY = data
        .reduce((BasicChartModel value, BasicChartModel element) =>
            value.quote < element.quote ? value : element)
        .quote;
    final double maxY = data
        .reduce((BasicChartModel value, BasicChartModel element) =>
            value.quote > element.quote ? value : element)
        .quote;

    _drawAxes(canvas, size);
    _drawGrids(canvas, size);

    _drawChart(canvas, size, minX, maxX, minY, maxY);

    _drawLabels(canvas, size, minX, maxX, minY, maxY);
    _drawCurrentValue(canvas, size, minX, maxX, minY, maxY);
    _drawCurrentPoint(canvas, size, minX, maxX, minY, maxY);
  }

  void _drawAxes(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint axisPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    canvas
      ..drawLine(Offset(width, height), Offset(0, height), axisPaint)
      ..drawLine(Offset(width, 0), Offset(width, height), axisPaint);
  }

  void _drawGrids(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Paint gridsPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 1.0;

    final double xGridInterval = width / (xAxisCount - 1);
    final double yGridInterval = height / yAxisCount;

    for (int i = 0; i < xAxisCount; i++) {
      final double x = i * xGridInterval;

      canvas.drawLine(Offset(x, 0), Offset(x, height), gridsPaint);
    }

    for (int i = 0; i <= yAxisCount; i++) {
      final double y = height - i * yGridInterval;

      canvas.drawLine(Offset(0, y), Offset(width, y), gridsPaint);
    }
  }

  void _drawChart(
    Canvas canvas,
    Size size,
    double minX,
    double maxX,
    double minY,
    double maxY,
  ) {
    final double width = size.width;
    final double height = size.height;

    final Paint pathPaint = Paint()
      ..color = chartColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Paint areaPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          chartColor.withOpacity(0.3),
          chartColor.withOpacity(0.2),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTRB(0, 0, width, height));

    final Path path = Path();

    for (int i = 0; i < data.length; i++) {
      final BasicChartModel entity = data[i];

      final double denominatorX = maxX - minX;
      final double x = denominatorX == 0
          ? width
          : width * ((entity.epoch.toDouble() - minX) / denominatorX);

      final double denominatorY = maxY - minY;
      final double y = denominatorY == 0
          ? height
          : height * (1 - ((entity.quote - minY) / denominatorY));

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, pathPaint);

    final Path areaPath = Path.from(path)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(areaPath, areaPaint);
  }

  void _drawLabels(
    Canvas canvas,
    Size size,
    double minX,
    double maxX,
    double minY,
    double maxY,
  ) {
    final double width = size.width;
    final double height = size.height;

    const TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 10);

    final double yAxisX = width - 1;

    final double yLabelInterval = (maxY - minY) / yAxisCount;

    for (int i = 0; i <= yAxisCount; i++) {
      final double labelValue = minY + (yLabelInterval * i);
      final String labelText = labelValue.toStringAsFixed(data.first.pipSize);

      final TextSpan labelSpan = TextSpan(
        text: labelText,
        style: labelStyle,
      );

      final TextPainter labelPainter = TextPainter(
        text: labelSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      final double labelX = yAxisX + labelPainter.width / 4;
      final double labelY =
          height - (i * (height / yAxisCount)) - (labelPainter.height / 2);

      labelPainter.paint(canvas, Offset(labelX, labelY));
    }

    final List<double> xLabels = <double>[];
    final double xLabelInterval = (maxX - minX) / (xAxisCount - 1);

    for (int i = 0; i < xAxisCount; i++) {
      final double labelValue = minX + (xLabelInterval * i);
      xLabels.add(labelValue);
    }

    const TextStyle xLabelStyle = TextStyle(
      color: Colors.white,
      fontSize: 10,
    );

    final double xGridInterval = width / (xAxisCount - 1);

    for (int i = 0; i < xLabels.length; i++) {
      final double labelValue = xLabels[i];
      final String labelText = getFormattedTime(labelValue.toInt());

      final TextSpan labelSpan = TextSpan(
        text: labelText,
        style: xLabelStyle,
      );

      final TextPainter labelPainter = TextPainter(
        text: labelSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      final double labelX = i * xGridInterval - labelPainter.width / 2;
      final double labelY = height + 4;

      canvas
        ..save()
        ..translate(labelX, labelY)
        ..rotate(pi / 8);

      labelPainter.paint(canvas, Offset.zero);

      canvas.restore();
    }
  }

  void _drawCurrentValue(
    Canvas canvas,
    Size size,
    double minX,
    double maxX,
    double minY,
    double maxY,
  ) {
    final double width = size.width;
    final double height = size.height;

    const TextStyle valueStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    final TextSpan currentSpan = TextSpan(
      text: data.last.quote.toStringAsFixed(data.first.pipSize),
      style: valueStyle,
    );

    final TextPainter currentPainter = TextPainter(
      text: currentSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    const double valuePadding = 4;

    final double denominator = maxY - minY;
    final double currentValueY = denominator == 0
        ? height
        : height * (1 - ((data.last.quote - minY) / denominator));
    final double currentValueX = width - currentPainter.width - valuePadding;

    currentPainter.paint(
      canvas,
      Offset(currentValueX, currentValueY - currentPainter.height),
    );
  }

  void _drawCurrentPoint(
    Canvas canvas,
    Size size,
    double minX,
    double maxX,
    double minY,
    double maxY,
  ) {
    final double width = size.width;
    final double height = size.height;

    final Paint currentPointPaint = Paint()
      ..color = chartColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    final double denominatorX = maxX - minX;
    final double currentPointX = denominatorX == 0
        ? width
        : width * ((data.last.epoch.toDouble() - minX) / denominatorX);

    final double denominatorY = maxY - minY;
    final double currentPointY = denominatorY == 0
        ? height
        : height * (1 - ((data.last.quote - minY) / denominatorY));

    canvas.drawCircle(
      Offset(currentPointX, currentPointY),
      4,
      currentPointPaint,
    );
  }

  @override
  bool shouldRepaint(_BasicChartPainter oldDelegate) =>
      oldDelegate.data != data;
}
