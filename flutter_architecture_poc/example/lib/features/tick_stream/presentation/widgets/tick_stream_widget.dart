import 'package:example/core/helpers/helpers.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:example/features/tick_stream/presentation/enums/tick_state.dart';
import 'package:example/features/tick_stream/presentation/helpers/helpers.dart';
import 'package:example/features/tick_stream/presentation/widgets/tick_stream_row.dart';
import 'package:flutter/material.dart';

class TickStreamWidget extends StatefulWidget {
  const TickStreamWidget({required this.entity, super.key});

  final TickStreamEntity entity;

  @override
  State<TickStreamWidget> createState() => _TickStreamWidgetState();
}

class _TickStreamWidgetState extends State<TickStreamWidget> {
  TickState _status = TickState.none;

  @override
  void didUpdateWidget(TickStreamWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    _handlePriceColor(oldWidget);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          TickStreamRow(title: 'Symbol: ', content: widget.entity.symbol),
          const SizedBox(height: 4),
          _buildPrice(),
          const SizedBox(height: 4),
          TickStreamRow(
            title: 'Bid: ',
            content: '${getFormattedDateTime(widget.entity.epoch)}',
          ),
        ],
      );

  Widget _buildPrice() => Row(
        children: <Widget>[
          const Text('Quote: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              Text(
                widget.entity.quote.toStringAsFixed(widget.entity.pipSize),
                style: TextStyle(color: getColor(_status)),
              ),
              _getIcon(),
            ],
          )
        ],
      );

  void _handlePriceColor(TickStreamWidget oldWidget) {
    if (oldWidget.entity == widget.entity) {
      return;
    }

    widget.entity.quote == oldWidget.entity.quote
        ? _status = TickState.none
        : widget.entity.quote > oldWidget.entity.quote
            ? _status = TickState.up
            : _status = TickState.down;
  }

  Icon _getIcon() => Icon(
        _status == TickState.up
            ? Icons.arrow_drop_up_rounded
            : _status == TickState.down
                ? Icons.arrow_drop_down_rounded
                : Icons.commit_rounded,
        color: getColor(_status),
      );
}
