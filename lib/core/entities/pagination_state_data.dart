import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/rendering.dart';

part 'pagination_state_data.g.dart';

abstract class PaginationStateData<T>
    implements Built<PaginationStateData<T>, PaginationStateDataBuilder<T>> {
  BuiltList<T> get items;

  bool get isLoading;

  bool get isFinished;

  int get currentPage;

  PaginationStateData._();

  factory PaginationStateData(
          [Function(PaginationStateDataBuilder<T> b) updates]) =
      _$PaginationStateData<T>;

  factory PaginationStateData.initial() => PaginationStateData<T>(
        (b) => b
          ..items.replace([])
          ..isLoading = false
          ..isFinished = false
          ..currentPage = 1,
      );

  bool canGetMoreData() {
    return (!isFinished && !isLoading && items.isNotEmpty) ? true : false;
  }

  bool shouldGetMoreData(
    material.ScrollController scrollController,
  ) {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.offset;
    bool isScrollingDown = scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;
    return (canGetMoreData() &&
            currentScroll > (maxScroll * 0.99) &&
            isScrollingDown)
        ? true
        : false;
  }
}
