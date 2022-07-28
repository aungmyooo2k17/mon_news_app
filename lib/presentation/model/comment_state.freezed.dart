// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentStateTearOff {
  const _$CommentStateTearOff();

  InitialState initial() {
    return const InitialState();
  }

  LoadingState loading() {
    return const LoadingState();
  }

  DataState data(List<CommentEntity> entities) {
    return DataState(
      entities,
    );
  }

  CommentedDataState commentedData(int response) {
    return CommentedDataState(
      response,
    );
  }

  ReportCommentState reportComment(int response) {
    return ReportCommentState(
      response,
    );
  }

  ErrorState error(String? message) {
    return ErrorState(
      message,
    );
  }
}

/// @nodoc
const $CommentState = _$CommentStateTearOff();

/// @nodoc
mixin _$CommentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res> implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  final CommentState _value;
  // ignore: unused_field
  final $Res Function(CommentState) _then;
}

/// @nodoc
abstract class $InitialStateCopyWith<$Res> {
  factory $InitialStateCopyWith(
          InitialState value, $Res Function(InitialState) then) =
      _$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialStateCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(
      InitialState _value, $Res Function(InitialState) _then)
      : super(_value, (v) => _then(v as InitialState));

  @override
  InitialState get _value => super._value as InitialState;
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'CommentState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState implements CommentState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(
      LoadingState _value, $Res Function(LoadingState) _then)
      : super(_value, (v) => _then(v as LoadingState));

  @override
  LoadingState get _value => super._value as LoadingState;
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'CommentState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements CommentState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class $DataStateCopyWith<$Res> {
  factory $DataStateCopyWith(DataState value, $Res Function(DataState) then) =
      _$DataStateCopyWithImpl<$Res>;
  $Res call({List<CommentEntity> entities});
}

/// @nodoc
class _$DataStateCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
    implements $DataStateCopyWith<$Res> {
  _$DataStateCopyWithImpl(DataState _value, $Res Function(DataState) _then)
      : super(_value, (v) => _then(v as DataState));

  @override
  DataState get _value => super._value as DataState;

  @override
  $Res call({
    Object? entities = freezed,
  }) {
    return _then(DataState(
      entities == freezed
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
    ));
  }
}

/// @nodoc

class _$DataState implements DataState {
  const _$DataState(this.entities);

  @override
  final List<CommentEntity> entities;

  @override
  String toString() {
    return 'CommentState.data(entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataState &&
            const DeepCollectionEquality().equals(other.entities, entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entities));

  @JsonKey(ignore: true)
  @override
  $DataStateCopyWith<DataState> get copyWith =>
      _$DataStateCopyWithImpl<DataState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) {
    return data(entities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) {
    return data?.call(entities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(entities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DataState implements CommentState {
  const factory DataState(List<CommentEntity> entities) = _$DataState;

  List<CommentEntity> get entities;
  @JsonKey(ignore: true)
  $DataStateCopyWith<DataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentedDataStateCopyWith<$Res> {
  factory $CommentedDataStateCopyWith(
          CommentedDataState value, $Res Function(CommentedDataState) then) =
      _$CommentedDataStateCopyWithImpl<$Res>;
  $Res call({int response});
}

/// @nodoc
class _$CommentedDataStateCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res>
    implements $CommentedDataStateCopyWith<$Res> {
  _$CommentedDataStateCopyWithImpl(
      CommentedDataState _value, $Res Function(CommentedDataState) _then)
      : super(_value, (v) => _then(v as CommentedDataState));

  @override
  CommentedDataState get _value => super._value as CommentedDataState;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(CommentedDataState(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CommentedDataState implements CommentedDataState {
  const _$CommentedDataState(this.response);

  @override
  final int response;

  @override
  String toString() {
    return 'CommentState.commentedData(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentedDataState &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  $CommentedDataStateCopyWith<CommentedDataState> get copyWith =>
      _$CommentedDataStateCopyWithImpl<CommentedDataState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) {
    return commentedData(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) {
    return commentedData?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (commentedData != null) {
      return commentedData(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) {
    return commentedData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) {
    return commentedData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (commentedData != null) {
      return commentedData(this);
    }
    return orElse();
  }
}

abstract class CommentedDataState implements CommentState {
  const factory CommentedDataState(int response) = _$CommentedDataState;

  int get response;
  @JsonKey(ignore: true)
  $CommentedDataStateCopyWith<CommentedDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCommentStateCopyWith<$Res> {
  factory $ReportCommentStateCopyWith(
          ReportCommentState value, $Res Function(ReportCommentState) then) =
      _$ReportCommentStateCopyWithImpl<$Res>;
  $Res call({int response});
}

/// @nodoc
class _$ReportCommentStateCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res>
    implements $ReportCommentStateCopyWith<$Res> {
  _$ReportCommentStateCopyWithImpl(
      ReportCommentState _value, $Res Function(ReportCommentState) _then)
      : super(_value, (v) => _then(v as ReportCommentState));

  @override
  ReportCommentState get _value => super._value as ReportCommentState;

  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(ReportCommentState(
      response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReportCommentState implements ReportCommentState {
  const _$ReportCommentState(this.response);

  @override
  final int response;

  @override
  String toString() {
    return 'CommentState.reportComment(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportCommentState &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  $ReportCommentStateCopyWith<ReportCommentState> get copyWith =>
      _$ReportCommentStateCopyWithImpl<ReportCommentState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) {
    return reportComment(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) {
    return reportComment?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (reportComment != null) {
      return reportComment(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) {
    return reportComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) {
    return reportComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (reportComment != null) {
      return reportComment(this);
    }
    return orElse();
  }
}

abstract class ReportCommentState implements CommentState {
  const factory ReportCommentState(int response) = _$ReportCommentState;

  int get response;
  @JsonKey(ignore: true)
  $ReportCommentStateCopyWith<ReportCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(ErrorState _value, $Res Function(ErrorState) _then)
      : super(_value, (v) => _then(v as ErrorState));

  @override
  ErrorState get _value => super._value as ErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorState implements ErrorState {
  const _$ErrorState(this.message);

  @override
  final String? message;

  @override
  String toString() {
    return 'CommentState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CommentEntity> entities) data,
    required TResult Function(int response) commentedData,
    required TResult Function(int response) reportComment,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CommentEntity> entities)? data,
    TResult Function(int response)? commentedData,
    TResult Function(int response)? reportComment,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initial,
    required TResult Function(LoadingState value) loading,
    required TResult Function(DataState value) data,
    required TResult Function(CommentedDataState value) commentedData,
    required TResult Function(ReportCommentState value) reportComment,
    required TResult Function(ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initial,
    TResult Function(LoadingState value)? loading,
    TResult Function(DataState value)? data,
    TResult Function(CommentedDataState value)? commentedData,
    TResult Function(ReportCommentState value)? reportComment,
    TResult Function(ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState implements CommentState {
  const factory ErrorState(String? message) = _$ErrorState;

  String? get message;
  @JsonKey(ignore: true)
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
