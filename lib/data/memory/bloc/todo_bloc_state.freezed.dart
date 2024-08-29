// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoBlocState {
  dynamic get initial => throw _privateConstructorUsedError;
  List<Todo> get todoList => throw _privateConstructorUsedError;
  BlocStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoBlocStateCopyWith<TodoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoBlocStateCopyWith<$Res> {
  factory $TodoBlocStateCopyWith(
          TodoBlocState value, $Res Function(TodoBlocState) then) =
      _$TodoBlocStateCopyWithImpl<$Res, TodoBlocState>;
  @useResult
  $Res call({dynamic initial, List<Todo> todoList, BlocStatus status});
}

/// @nodoc
class _$TodoBlocStateCopyWithImpl<$Res, $Val extends TodoBlocState>
    implements $TodoBlocStateCopyWith<$Res> {
  _$TodoBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = freezed,
    Object? todoList = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      initial: freezed == initial
          ? _value.initial
          : initial // ignore: cast_nullable_to_non_nullable
              as dynamic,
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoBlocStateCopyWith<$Res>
    implements $TodoBlocStateCopyWith<$Res> {
  factory _$$_TodoBlocStateCopyWith(
          _$_TodoBlocState value, $Res Function(_$_TodoBlocState) then) =
      __$$_TodoBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic initial, List<Todo> todoList, BlocStatus status});
}

/// @nodoc
class __$$_TodoBlocStateCopyWithImpl<$Res>
    extends _$TodoBlocStateCopyWithImpl<$Res, _$_TodoBlocState>
    implements _$$_TodoBlocStateCopyWith<$Res> {
  __$$_TodoBlocStateCopyWithImpl(
      _$_TodoBlocState _value, $Res Function(_$_TodoBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = freezed,
    Object? todoList = null,
    Object? status = null,
  }) {
    return _then(_$_TodoBlocState(
      freezed == initial ? _value.initial! : initial,
      todoList: null == todoList
          ? _value._todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
    ));
  }
}

/// @nodoc

class _$_TodoBlocState implements _TodoBlocState {
  const _$_TodoBlocState(this.initial,
      {final List<Todo> todoList = const [], this.status = BlocStatus.initial})
      : _todoList = todoList;

  @override
  final dynamic initial;
  final List<Todo> _todoList;
  @override
  @JsonKey()
  List<Todo> get todoList {
    if (_todoList is EqualUnmodifiableListView) return _todoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoList);
  }

  @override
  @JsonKey()
  final BlocStatus status;

  @override
  String toString() {
    return 'TodoBlocState(initial: $initial, todoList: $todoList, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoBlocState &&
            const DeepCollectionEquality().equals(other.initial, initial) &&
            const DeepCollectionEquality().equals(other._todoList, _todoList) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initial),
      const DeepCollectionEquality().hash(_todoList),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoBlocStateCopyWith<_$_TodoBlocState> get copyWith =>
      __$$_TodoBlocStateCopyWithImpl<_$_TodoBlocState>(this, _$identity);
}

abstract class _TodoBlocState implements TodoBlocState {
  const factory _TodoBlocState(final dynamic initial,
      {final List<Todo> todoList, final BlocStatus status}) = _$_TodoBlocState;

  @override
  dynamic get initial;
  @override
  List<Todo> get todoList;
  @override
  BlocStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_TodoBlocStateCopyWith<_$_TodoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
