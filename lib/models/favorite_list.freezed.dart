// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteList {

 List<Character> get items;
/// Create a copy of FavoriteList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteListCopyWith<FavoriteList> get copyWith => _$FavoriteListCopyWithImpl<FavoriteList>(this as FavoriteList, _$identity);

  /// Serializes this FavoriteList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteList&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'FavoriteList(items: $items)';
}


}

/// @nodoc
abstract mixin class $FavoriteListCopyWith<$Res>  {
  factory $FavoriteListCopyWith(FavoriteList value, $Res Function(FavoriteList) _then) = _$FavoriteListCopyWithImpl;
@useResult
$Res call({
 List<Character> items
});




}
/// @nodoc
class _$FavoriteListCopyWithImpl<$Res>
    implements $FavoriteListCopyWith<$Res> {
  _$FavoriteListCopyWithImpl(this._self, this._then);

  final FavoriteList _self;
  final $Res Function(FavoriteList) _then;

/// Create a copy of FavoriteList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FavoriteList extends FavoriteList {
  const _FavoriteList({required final  List<Character> items}): _items = items,super._();
  factory _FavoriteList.fromJson(Map<String, dynamic> json) => _$FavoriteListFromJson(json);

 final  List<Character> _items;
@override List<Character> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of FavoriteList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteListCopyWith<_FavoriteList> get copyWith => __$FavoriteListCopyWithImpl<_FavoriteList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteList&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'FavoriteList(items: $items)';
}


}

/// @nodoc
abstract mixin class _$FavoriteListCopyWith<$Res> implements $FavoriteListCopyWith<$Res> {
  factory _$FavoriteListCopyWith(_FavoriteList value, $Res Function(_FavoriteList) _then) = __$FavoriteListCopyWithImpl;
@override @useResult
$Res call({
 List<Character> items
});




}
/// @nodoc
class __$FavoriteListCopyWithImpl<$Res>
    implements _$FavoriteListCopyWith<$Res> {
  __$FavoriteListCopyWithImpl(this._self, this._then);

  final _FavoriteList _self;
  final $Res Function(_FavoriteList) _then;

/// Create a copy of FavoriteList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_FavoriteList(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,
  ));
}


}

// dart format on
