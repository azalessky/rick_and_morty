// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterList {

 String get prev; String get next; List<Character> get items;
/// Create a copy of CharacterList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterListCopyWith<CharacterList> get copyWith => _$CharacterListCopyWithImpl<CharacterList>(this as CharacterList, _$identity);

  /// Serializes this CharacterList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterList&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prev,next,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CharacterList(prev: $prev, next: $next, items: $items)';
}


}

/// @nodoc
abstract mixin class $CharacterListCopyWith<$Res>  {
  factory $CharacterListCopyWith(CharacterList value, $Res Function(CharacterList) _then) = _$CharacterListCopyWithImpl;
@useResult
$Res call({
 String prev, String next, List<Character> items
});




}
/// @nodoc
class _$CharacterListCopyWithImpl<$Res>
    implements $CharacterListCopyWith<$Res> {
  _$CharacterListCopyWithImpl(this._self, this._then);

  final CharacterList _self;
  final $Res Function(CharacterList) _then;

/// Create a copy of CharacterList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prev = null,Object? next = null,Object? items = null,}) {
  return _then(_self.copyWith(
prev: null == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CharacterList extends CharacterList {
  const _CharacterList({required this.prev, required this.next, required final  List<Character> items}): _items = items,super._();
  factory _CharacterList.fromJson(Map<String, dynamic> json) => _$CharacterListFromJson(json);

@override final  String prev;
@override final  String next;
 final  List<Character> _items;
@override List<Character> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CharacterList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterListCopyWith<_CharacterList> get copyWith => __$CharacterListCopyWithImpl<_CharacterList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterList&&(identical(other.prev, prev) || other.prev == prev)&&(identical(other.next, next) || other.next == next)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prev,next,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CharacterList(prev: $prev, next: $next, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CharacterListCopyWith<$Res> implements $CharacterListCopyWith<$Res> {
  factory _$CharacterListCopyWith(_CharacterList value, $Res Function(_CharacterList) _then) = __$CharacterListCopyWithImpl;
@override @useResult
$Res call({
 String prev, String next, List<Character> items
});




}
/// @nodoc
class __$CharacterListCopyWithImpl<$Res>
    implements _$CharacterListCopyWith<$Res> {
  __$CharacterListCopyWithImpl(this._self, this._then);

  final _CharacterList _self;
  final $Res Function(_CharacterList) _then;

/// Create a copy of CharacterList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prev = null,Object? next = null,Object? items = null,}) {
  return _then(_CharacterList(
prev: null == prev ? _self.prev : prev // ignore: cast_nullable_to_non_nullable
as String,next: null == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Character>,
  ));
}


}

// dart format on
