import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:rick_and_morty/common/common.dart';

import 'generic_dialog.dart';

class ValueListDialog<T> extends StatefulWidget {
  static const contentFraction = 0.7;

  final String? title;
  final List<T> values;
  final T? initialValue;
  final AlignmentGeometry alignment;
  final String? deleteButton;
  final String Function(T) textBuilder;
  final Widget Function(T)? iconBuilder;
  final void Function(T?)? onSelected;

  const ValueListDialog({
    this.title,
    required this.values,
    this.initialValue,
    this.alignment = Alignment.centerLeft,
    this.deleteButton,
    required this.textBuilder,
    this.iconBuilder,
    this.onSelected,
    super.key,
  });

  @override
  State<ValueListDialog<T>> createState() => _ValueListDialogState<T>();
}

class _ValueListDialogState<T> extends State<ValueListDialog<T>> {
  final scrollController = ScrollController();
  final Map<T, GlobalKey> itemKeys = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollToValue(widget.initialValue),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GenericDialog(
      title: widget.title,
      contentPadding: DialogPaddings.valueContent,
      contentBuilder: _buildContent,
      actions: [
        if (widget.deleteButton != null)
          DialogActionButton(
            title: widget.deleteButton!,
            onPressed: () {
              context.maybePop();
              widget.onSelected?.call(null);
            },
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return LimitedBox(
      maxHeight: MediaQuery.of(context).size.height * ValueListDialog.contentFraction,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(children: _buildItemList()),
      ),
    );
  }

  List<Widget> _buildItemList() {
    return widget.values
        .map(
          (value) => ListTile(
            key: itemKeys[value] = GlobalKey(),
            contentPadding: DialogPaddings.valueTile,
            title: Align(
              alignment: widget.alignment,
              child: Text(
                widget.textBuilder(value),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            leading: widget.alignment == Alignment.center
                ? widget.iconBuilder?.call(value) ?? const Icon(null)
                : widget.iconBuilder?.call(value),
            trailing: Icon(value == widget.initialValue ? Icons.check : null),
            onTap: () {
              context.maybePop(value);
              widget.onSelected?.call(value);
            },
          ),
        )
        .toList();
  }

  void _scrollToValue(T? value) {
    if (value == null) return;
    final context = itemKeys[value]?.currentContext;
    if (context != null) Scrollable.ensureVisible(context);
  }
}
