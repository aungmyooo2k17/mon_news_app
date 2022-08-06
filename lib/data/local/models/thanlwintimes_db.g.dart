// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thanlwintimes_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TopicDtoData extends DataClass implements Insertable<TopicDtoData> {
  final int id;
  final String name;
  final int priority;
  TopicDtoData({required this.id, required this.name, required this.priority});
  factory TopicDtoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TopicDtoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      priority: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}priority'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['priority'] = Variable<int>(priority);
    return map;
  }

  TopicDtoCompanion toCompanion(bool nullToAbsent) {
    return TopicDtoCompanion(
      id: Value(id),
      name: Value(name),
      priority: Value(priority),
    );
  }

  factory TopicDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicDtoData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      priority: serializer.fromJson<int>(json['priority']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'priority': serializer.toJson<int>(priority),
    };
  }

  TopicDtoData copyWith({int? id, String? name, int? priority}) => TopicDtoData(
        id: id ?? this.id,
        name: name ?? this.name,
        priority: priority ?? this.priority,
      );
  @override
  String toString() {
    return (StringBuffer('TopicDtoData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, priority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicDtoData &&
          other.id == this.id &&
          other.name == this.name &&
          other.priority == this.priority);
}

class TopicDtoCompanion extends UpdateCompanion<TopicDtoData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> priority;
  const TopicDtoCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.priority = const Value.absent(),
  });
  TopicDtoCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int priority,
  })  : name = Value(name),
        priority = Value(priority);
  static Insertable<TopicDtoData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? priority,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
    });
  }

  TopicDtoCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? priority}) {
    return TopicDtoCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      priority: priority ?? this.priority,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicDtoCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }
}

class $TopicDtoTable extends TopicDto
    with TableInfo<$TopicDtoTable, TopicDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicDtoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int?> priority = GeneratedColumn<int?>(
      'priority', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, priority];
  @override
  String get aliasedName => _alias ?? 'topic_dto';
  @override
  String get actualTableName => 'topic_dto';
  @override
  VerificationContext validateIntegrity(Insertable<TopicDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TopicDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TopicDtoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TopicDtoTable createAlias(String alias) {
    return $TopicDtoTable(attachedDatabase, alias);
  }
}

class CategoryDtoData extends DataClass implements Insertable<CategoryDtoData> {
  final int id;
  final String name;
  final int priority;
  final String topic;
  CategoryDtoData(
      {required this.id,
      required this.name,
      required this.priority,
      required this.topic});
  factory CategoryDtoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryDtoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      priority: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}priority'])!,
      topic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}topic'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['priority'] = Variable<int>(priority);
    map['topic'] = Variable<String>(topic);
    return map;
  }

  CategoryDtoCompanion toCompanion(bool nullToAbsent) {
    return CategoryDtoCompanion(
      id: Value(id),
      name: Value(name),
      priority: Value(priority),
      topic: Value(topic),
    );
  }

  factory CategoryDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryDtoData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      priority: serializer.fromJson<int>(json['priority']),
      topic: serializer.fromJson<String>(json['topic']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'priority': serializer.toJson<int>(priority),
      'topic': serializer.toJson<String>(topic),
    };
  }

  CategoryDtoData copyWith(
          {int? id, String? name, int? priority, String? topic}) =>
      CategoryDtoData(
        id: id ?? this.id,
        name: name ?? this.name,
        priority: priority ?? this.priority,
        topic: topic ?? this.topic,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryDtoData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority, ')
          ..write('topic: $topic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, priority, topic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryDtoData &&
          other.id == this.id &&
          other.name == this.name &&
          other.priority == this.priority &&
          other.topic == this.topic);
}

class CategoryDtoCompanion extends UpdateCompanion<CategoryDtoData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> priority;
  final Value<String> topic;
  const CategoryDtoCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.priority = const Value.absent(),
    this.topic = const Value.absent(),
  });
  CategoryDtoCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int priority,
    required String topic,
  })  : name = Value(name),
        priority = Value(priority),
        topic = Value(topic);
  static Insertable<CategoryDtoData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? priority,
    Expression<String>? topic,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (topic != null) 'topic': topic,
    });
  }

  CategoryDtoCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? priority,
      Value<String>? topic}) {
    return CategoryDtoCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      priority: priority ?? this.priority,
      topic: topic ?? this.topic,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryDtoCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority, ')
          ..write('topic: $topic')
          ..write(')'))
        .toString();
  }
}

class $CategoryDtoTable extends CategoryDto
    with TableInfo<$CategoryDtoTable, CategoryDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryDtoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _priorityMeta = const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int?> priority = GeneratedColumn<int?>(
      'priority', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String?> topic = GeneratedColumn<String?>(
      'topic', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, priority, topic];
  @override
  String get aliasedName => _alias ?? 'category_dto';
  @override
  String get actualTableName => 'category_dto';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryDtoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryDtoTable createAlias(String alias) {
    return $CategoryDtoTable(attachedDatabase, alias);
  }
}

class PostDtoData extends DataClass implements Insertable<PostDtoData> {
  final int id;
  final String title;
  final String banner;
  final String videoUrl;
  final String audioUrl;
  final String content;
  final int topicId;
  final int? views;
  final int? comments;
  final int? likes;
  final String topic;
  final String category;
  final String shareLink;
  PostDtoData(
      {required this.id,
      required this.title,
      required this.banner,
      required this.videoUrl,
      required this.audioUrl,
      required this.content,
      required this.topicId,
      this.views,
      this.comments,
      this.likes,
      required this.topic,
      required this.category,
      required this.shareLink});
  factory PostDtoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PostDtoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      banner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}banner'])!,
      videoUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video_url'])!,
      audioUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audio_url'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      topicId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}topic_id'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views']),
      comments: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comments']),
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes']),
      topic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}topic'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      shareLink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}share_link'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['banner'] = Variable<String>(banner);
    map['video_url'] = Variable<String>(videoUrl);
    map['audio_url'] = Variable<String>(audioUrl);
    map['content'] = Variable<String>(content);
    map['topic_id'] = Variable<int>(topicId);
    if (!nullToAbsent || views != null) {
      map['views'] = Variable<int?>(views);
    }
    if (!nullToAbsent || comments != null) {
      map['comments'] = Variable<int?>(comments);
    }
    if (!nullToAbsent || likes != null) {
      map['likes'] = Variable<int?>(likes);
    }
    map['topic'] = Variable<String>(topic);
    map['category'] = Variable<String>(category);
    map['share_link'] = Variable<String>(shareLink);
    return map;
  }

  PostDtoCompanion toCompanion(bool nullToAbsent) {
    return PostDtoCompanion(
      id: Value(id),
      title: Value(title),
      banner: Value(banner),
      videoUrl: Value(videoUrl),
      audioUrl: Value(audioUrl),
      content: Value(content),
      topicId: Value(topicId),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      comments: comments == null && nullToAbsent
          ? const Value.absent()
          : Value(comments),
      likes:
          likes == null && nullToAbsent ? const Value.absent() : Value(likes),
      topic: Value(topic),
      category: Value(category),
      shareLink: Value(shareLink),
    );
  }

  factory PostDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostDtoData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      banner: serializer.fromJson<String>(json['banner']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      content: serializer.fromJson<String>(json['content']),
      topicId: serializer.fromJson<int>(json['topicId']),
      views: serializer.fromJson<int?>(json['views']),
      comments: serializer.fromJson<int?>(json['comments']),
      likes: serializer.fromJson<int?>(json['likes']),
      topic: serializer.fromJson<String>(json['topic']),
      category: serializer.fromJson<String>(json['category']),
      shareLink: serializer.fromJson<String>(json['shareLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'banner': serializer.toJson<String>(banner),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'content': serializer.toJson<String>(content),
      'topicId': serializer.toJson<int>(topicId),
      'views': serializer.toJson<int?>(views),
      'comments': serializer.toJson<int?>(comments),
      'likes': serializer.toJson<int?>(likes),
      'topic': serializer.toJson<String>(topic),
      'category': serializer.toJson<String>(category),
      'shareLink': serializer.toJson<String>(shareLink),
    };
  }

  PostDtoData copyWith(
          {int? id,
          String? title,
          String? banner,
          String? videoUrl,
          String? audioUrl,
          String? content,
          int? topicId,
          int? views,
          int? comments,
          int? likes,
          String? topic,
          String? category,
          String? shareLink}) =>
      PostDtoData(
        id: id ?? this.id,
        title: title ?? this.title,
        banner: banner ?? this.banner,
        videoUrl: videoUrl ?? this.videoUrl,
        audioUrl: audioUrl ?? this.audioUrl,
        content: content ?? this.content,
        topicId: topicId ?? this.topicId,
        views: views ?? this.views,
        comments: comments ?? this.comments,
        likes: likes ?? this.likes,
        topic: topic ?? this.topic,
        category: category ?? this.category,
        shareLink: shareLink ?? this.shareLink,
      );
  @override
  String toString() {
    return (StringBuffer('PostDtoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('banner: $banner, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('content: $content, ')
          ..write('topicId: $topicId, ')
          ..write('views: $views, ')
          ..write('comments: $comments, ')
          ..write('likes: $likes, ')
          ..write('topic: $topic, ')
          ..write('category: $category, ')
          ..write('shareLink: $shareLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, banner, videoUrl, audioUrl,
      content, topicId, views, comments, likes, topic, category, shareLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostDtoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.banner == this.banner &&
          other.videoUrl == this.videoUrl &&
          other.audioUrl == this.audioUrl &&
          other.content == this.content &&
          other.topicId == this.topicId &&
          other.views == this.views &&
          other.comments == this.comments &&
          other.likes == this.likes &&
          other.topic == this.topic &&
          other.category == this.category &&
          other.shareLink == this.shareLink);
}

class PostDtoCompanion extends UpdateCompanion<PostDtoData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> banner;
  final Value<String> videoUrl;
  final Value<String> audioUrl;
  final Value<String> content;
  final Value<int> topicId;
  final Value<int?> views;
  final Value<int?> comments;
  final Value<int?> likes;
  final Value<String> topic;
  final Value<String> category;
  final Value<String> shareLink;
  const PostDtoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.banner = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.content = const Value.absent(),
    this.topicId = const Value.absent(),
    this.views = const Value.absent(),
    this.comments = const Value.absent(),
    this.likes = const Value.absent(),
    this.topic = const Value.absent(),
    this.category = const Value.absent(),
    this.shareLink = const Value.absent(),
  });
  PostDtoCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String banner,
    required String videoUrl,
    required String audioUrl,
    required String content,
    required int topicId,
    this.views = const Value.absent(),
    this.comments = const Value.absent(),
    this.likes = const Value.absent(),
    required String topic,
    required String category,
    required String shareLink,
  })  : title = Value(title),
        banner = Value(banner),
        videoUrl = Value(videoUrl),
        audioUrl = Value(audioUrl),
        content = Value(content),
        topicId = Value(topicId),
        topic = Value(topic),
        category = Value(category),
        shareLink = Value(shareLink);
  static Insertable<PostDtoData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? banner,
    Expression<String>? videoUrl,
    Expression<String>? audioUrl,
    Expression<String>? content,
    Expression<int>? topicId,
    Expression<int?>? views,
    Expression<int?>? comments,
    Expression<int?>? likes,
    Expression<String>? topic,
    Expression<String>? category,
    Expression<String>? shareLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (banner != null) 'banner': banner,
      if (videoUrl != null) 'video_url': videoUrl,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (content != null) 'content': content,
      if (topicId != null) 'topic_id': topicId,
      if (views != null) 'views': views,
      if (comments != null) 'comments': comments,
      if (likes != null) 'likes': likes,
      if (topic != null) 'topic': topic,
      if (category != null) 'category': category,
      if (shareLink != null) 'share_link': shareLink,
    });
  }

  PostDtoCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? banner,
      Value<String>? videoUrl,
      Value<String>? audioUrl,
      Value<String>? content,
      Value<int>? topicId,
      Value<int?>? views,
      Value<int?>? comments,
      Value<int?>? likes,
      Value<String>? topic,
      Value<String>? category,
      Value<String>? shareLink}) {
    return PostDtoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      banner: banner ?? this.banner,
      videoUrl: videoUrl ?? this.videoUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      content: content ?? this.content,
      topicId: topicId ?? this.topicId,
      views: views ?? this.views,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      topic: topic ?? this.topic,
      category: category ?? this.category,
      shareLink: shareLink ?? this.shareLink,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (banner.present) {
      map['banner'] = Variable<String>(banner.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<int>(topicId.value);
    }
    if (views.present) {
      map['views'] = Variable<int?>(views.value);
    }
    if (comments.present) {
      map['comments'] = Variable<int?>(comments.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int?>(likes.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (shareLink.present) {
      map['share_link'] = Variable<String>(shareLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostDtoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('banner: $banner, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('content: $content, ')
          ..write('topicId: $topicId, ')
          ..write('views: $views, ')
          ..write('comments: $comments, ')
          ..write('likes: $likes, ')
          ..write('topic: $topic, ')
          ..write('category: $category, ')
          ..write('shareLink: $shareLink')
          ..write(')'))
        .toString();
  }
}

class $PostDtoTable extends PostDto with TableInfo<$PostDtoTable, PostDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostDtoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bannerMeta = const VerificationMeta('banner');
  @override
  late final GeneratedColumn<String?> banner = GeneratedColumn<String?>(
      'banner', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _videoUrlMeta = const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String?> videoUrl = GeneratedColumn<String?>(
      'video_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _audioUrlMeta = const VerificationMeta('audioUrl');
  @override
  late final GeneratedColumn<String?> audioUrl = GeneratedColumn<String?>(
      'audio_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _topicIdMeta = const VerificationMeta('topicId');
  @override
  late final GeneratedColumn<int?> topicId = GeneratedColumn<int?>(
      'topic_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _commentsMeta = const VerificationMeta('comments');
  @override
  late final GeneratedColumn<int?> comments = GeneratedColumn<int?>(
      'comments', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int?> likes = GeneratedColumn<int?>(
      'likes', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String?> topic = GeneratedColumn<String?>(
      'topic', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _shareLinkMeta = const VerificationMeta('shareLink');
  @override
  late final GeneratedColumn<String?> shareLink = GeneratedColumn<String?>(
      'share_link', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        banner,
        videoUrl,
        audioUrl,
        content,
        topicId,
        views,
        comments,
        likes,
        topic,
        category,
        shareLink
      ];
  @override
  String get aliasedName => _alias ?? 'post_dto';
  @override
  String get actualTableName => 'post_dto';
  @override
  VerificationContext validateIntegrity(Insertable<PostDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner']!, _bannerMeta));
    } else if (isInserting) {
      context.missing(_bannerMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(_audioUrlMeta,
          audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta));
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(_topicIdMeta,
          topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta));
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('comments')) {
      context.handle(_commentsMeta,
          comments.isAcceptableOrUnknown(data['comments']!, _commentsMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('share_link')) {
      context.handle(_shareLinkMeta,
          shareLink.isAcceptableOrUnknown(data['share_link']!, _shareLinkMeta));
    } else if (isInserting) {
      context.missing(_shareLinkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PostDtoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PostDtoTable createAlias(String alias) {
    return $PostDtoTable(attachedDatabase, alias);
  }
}

class BookmarkDtoData extends DataClass implements Insertable<BookmarkDtoData> {
  final int id;
  final int bookmarkId;
  final int postId;
  final String uuid;
  final String title;
  final String banner;
  final String videoUrl;
  final String audioUrl;
  final String content;
  final int topicId;
  final String topic;
  final String category;
  BookmarkDtoData(
      {required this.id,
      required this.bookmarkId,
      required this.postId,
      required this.uuid,
      required this.title,
      required this.banner,
      required this.videoUrl,
      required this.audioUrl,
      required this.content,
      required this.topicId,
      required this.topic,
      required this.category});
  factory BookmarkDtoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BookmarkDtoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      bookmarkId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bookmark_id'])!,
      postId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      banner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}banner'])!,
      videoUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}video_url'])!,
      audioUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}audio_url'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      topicId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}topic_id'])!,
      topic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}topic'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bookmark_id'] = Variable<int>(bookmarkId);
    map['post_id'] = Variable<int>(postId);
    map['uuid'] = Variable<String>(uuid);
    map['title'] = Variable<String>(title);
    map['banner'] = Variable<String>(banner);
    map['video_url'] = Variable<String>(videoUrl);
    map['audio_url'] = Variable<String>(audioUrl);
    map['content'] = Variable<String>(content);
    map['topic_id'] = Variable<int>(topicId);
    map['topic'] = Variable<String>(topic);
    map['category'] = Variable<String>(category);
    return map;
  }

  BookmarkDtoCompanion toCompanion(bool nullToAbsent) {
    return BookmarkDtoCompanion(
      id: Value(id),
      bookmarkId: Value(bookmarkId),
      postId: Value(postId),
      uuid: Value(uuid),
      title: Value(title),
      banner: Value(banner),
      videoUrl: Value(videoUrl),
      audioUrl: Value(audioUrl),
      content: Value(content),
      topicId: Value(topicId),
      topic: Value(topic),
      category: Value(category),
    );
  }

  factory BookmarkDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkDtoData(
      id: serializer.fromJson<int>(json['id']),
      bookmarkId: serializer.fromJson<int>(json['bookmarkId']),
      postId: serializer.fromJson<int>(json['postId']),
      uuid: serializer.fromJson<String>(json['uuid']),
      title: serializer.fromJson<String>(json['title']),
      banner: serializer.fromJson<String>(json['banner']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      content: serializer.fromJson<String>(json['content']),
      topicId: serializer.fromJson<int>(json['topicId']),
      topic: serializer.fromJson<String>(json['topic']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookmarkId': serializer.toJson<int>(bookmarkId),
      'postId': serializer.toJson<int>(postId),
      'uuid': serializer.toJson<String>(uuid),
      'title': serializer.toJson<String>(title),
      'banner': serializer.toJson<String>(banner),
      'videoUrl': serializer.toJson<String>(videoUrl),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'content': serializer.toJson<String>(content),
      'topicId': serializer.toJson<int>(topicId),
      'topic': serializer.toJson<String>(topic),
      'category': serializer.toJson<String>(category),
    };
  }

  BookmarkDtoData copyWith(
          {int? id,
          int? bookmarkId,
          int? postId,
          String? uuid,
          String? title,
          String? banner,
          String? videoUrl,
          String? audioUrl,
          String? content,
          int? topicId,
          String? topic,
          String? category}) =>
      BookmarkDtoData(
        id: id ?? this.id,
        bookmarkId: bookmarkId ?? this.bookmarkId,
        postId: postId ?? this.postId,
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        banner: banner ?? this.banner,
        videoUrl: videoUrl ?? this.videoUrl,
        audioUrl: audioUrl ?? this.audioUrl,
        content: content ?? this.content,
        topicId: topicId ?? this.topicId,
        topic: topic ?? this.topic,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('BookmarkDtoData(')
          ..write('id: $id, ')
          ..write('bookmarkId: $bookmarkId, ')
          ..write('postId: $postId, ')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('banner: $banner, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('content: $content, ')
          ..write('topicId: $topicId, ')
          ..write('topic: $topic, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, bookmarkId, postId, uuid, title, banner,
      videoUrl, audioUrl, content, topicId, topic, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkDtoData &&
          other.id == this.id &&
          other.bookmarkId == this.bookmarkId &&
          other.postId == this.postId &&
          other.uuid == this.uuid &&
          other.title == this.title &&
          other.banner == this.banner &&
          other.videoUrl == this.videoUrl &&
          other.audioUrl == this.audioUrl &&
          other.content == this.content &&
          other.topicId == this.topicId &&
          other.topic == this.topic &&
          other.category == this.category);
}

class BookmarkDtoCompanion extends UpdateCompanion<BookmarkDtoData> {
  final Value<int> id;
  final Value<int> bookmarkId;
  final Value<int> postId;
  final Value<String> uuid;
  final Value<String> title;
  final Value<String> banner;
  final Value<String> videoUrl;
  final Value<String> audioUrl;
  final Value<String> content;
  final Value<int> topicId;
  final Value<String> topic;
  final Value<String> category;
  const BookmarkDtoCompanion({
    this.id = const Value.absent(),
    this.bookmarkId = const Value.absent(),
    this.postId = const Value.absent(),
    this.uuid = const Value.absent(),
    this.title = const Value.absent(),
    this.banner = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.content = const Value.absent(),
    this.topicId = const Value.absent(),
    this.topic = const Value.absent(),
    this.category = const Value.absent(),
  });
  BookmarkDtoCompanion.insert({
    this.id = const Value.absent(),
    required int bookmarkId,
    required int postId,
    required String uuid,
    required String title,
    required String banner,
    required String videoUrl,
    required String audioUrl,
    required String content,
    required int topicId,
    required String topic,
    required String category,
  })  : bookmarkId = Value(bookmarkId),
        postId = Value(postId),
        uuid = Value(uuid),
        title = Value(title),
        banner = Value(banner),
        videoUrl = Value(videoUrl),
        audioUrl = Value(audioUrl),
        content = Value(content),
        topicId = Value(topicId),
        topic = Value(topic),
        category = Value(category);
  static Insertable<BookmarkDtoData> custom({
    Expression<int>? id,
    Expression<int>? bookmarkId,
    Expression<int>? postId,
    Expression<String>? uuid,
    Expression<String>? title,
    Expression<String>? banner,
    Expression<String>? videoUrl,
    Expression<String>? audioUrl,
    Expression<String>? content,
    Expression<int>? topicId,
    Expression<String>? topic,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookmarkId != null) 'bookmark_id': bookmarkId,
      if (postId != null) 'post_id': postId,
      if (uuid != null) 'uuid': uuid,
      if (title != null) 'title': title,
      if (banner != null) 'banner': banner,
      if (videoUrl != null) 'video_url': videoUrl,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (content != null) 'content': content,
      if (topicId != null) 'topic_id': topicId,
      if (topic != null) 'topic': topic,
      if (category != null) 'category': category,
    });
  }

  BookmarkDtoCompanion copyWith(
      {Value<int>? id,
      Value<int>? bookmarkId,
      Value<int>? postId,
      Value<String>? uuid,
      Value<String>? title,
      Value<String>? banner,
      Value<String>? videoUrl,
      Value<String>? audioUrl,
      Value<String>? content,
      Value<int>? topicId,
      Value<String>? topic,
      Value<String>? category}) {
    return BookmarkDtoCompanion(
      id: id ?? this.id,
      bookmarkId: bookmarkId ?? this.bookmarkId,
      postId: postId ?? this.postId,
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      banner: banner ?? this.banner,
      videoUrl: videoUrl ?? this.videoUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      content: content ?? this.content,
      topicId: topicId ?? this.topicId,
      topic: topic ?? this.topic,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bookmarkId.present) {
      map['bookmark_id'] = Variable<int>(bookmarkId.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<int>(postId.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (banner.present) {
      map['banner'] = Variable<String>(banner.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<int>(topicId.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarkDtoCompanion(')
          ..write('id: $id, ')
          ..write('bookmarkId: $bookmarkId, ')
          ..write('postId: $postId, ')
          ..write('uuid: $uuid, ')
          ..write('title: $title, ')
          ..write('banner: $banner, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('content: $content, ')
          ..write('topicId: $topicId, ')
          ..write('topic: $topic, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $BookmarkDtoTable extends BookmarkDto
    with TableInfo<$BookmarkDtoTable, BookmarkDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarkDtoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _bookmarkIdMeta = const VerificationMeta('bookmarkId');
  @override
  late final GeneratedColumn<int?> bookmarkId = GeneratedColumn<int?>(
      'bookmark_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<int?> postId = GeneratedColumn<int?>(
      'post_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String?> uuid = GeneratedColumn<String?>(
      'uuid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bannerMeta = const VerificationMeta('banner');
  @override
  late final GeneratedColumn<String?> banner = GeneratedColumn<String?>(
      'banner', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _videoUrlMeta = const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String?> videoUrl = GeneratedColumn<String?>(
      'video_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _audioUrlMeta = const VerificationMeta('audioUrl');
  @override
  late final GeneratedColumn<String?> audioUrl = GeneratedColumn<String?>(
      'audio_url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _topicIdMeta = const VerificationMeta('topicId');
  @override
  late final GeneratedColumn<int?> topicId = GeneratedColumn<int?>(
      'topic_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String?> topic = GeneratedColumn<String?>(
      'topic', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        bookmarkId,
        postId,
        uuid,
        title,
        banner,
        videoUrl,
        audioUrl,
        content,
        topicId,
        topic,
        category
      ];
  @override
  String get aliasedName => _alias ?? 'bookmark_dto';
  @override
  String get actualTableName => 'bookmark_dto';
  @override
  VerificationContext validateIntegrity(Insertable<BookmarkDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bookmark_id')) {
      context.handle(
          _bookmarkIdMeta,
          bookmarkId.isAcceptableOrUnknown(
              data['bookmark_id']!, _bookmarkIdMeta));
    } else if (isInserting) {
      context.missing(_bookmarkIdMeta);
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner']!, _bannerMeta));
    } else if (isInserting) {
      context.missing(_bannerMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    } else if (isInserting) {
      context.missing(_videoUrlMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(_audioUrlMeta,
          audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta));
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(_topicIdMeta,
          topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta));
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BookmarkDtoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BookmarkDtoTable createAlias(String alias) {
    return $BookmarkDtoTable(attachedDatabase, alias);
  }
}

class CommentDtoData extends DataClass implements Insertable<CommentDtoData> {
  final int id;
  final int postId;
  final String comment;
  final String uuid;
  CommentDtoData(
      {required this.id,
      required this.postId,
      required this.comment,
      required this.uuid});
  factory CommentDtoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CommentDtoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      postId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['post_id'] = Variable<int>(postId);
    map['comment'] = Variable<String>(comment);
    map['uuid'] = Variable<String>(uuid);
    return map;
  }

  CommentDtoCompanion toCompanion(bool nullToAbsent) {
    return CommentDtoCompanion(
      id: Value(id),
      postId: Value(postId),
      comment: Value(comment),
      uuid: Value(uuid),
    );
  }

  factory CommentDtoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentDtoData(
      id: serializer.fromJson<int>(json['id']),
      postId: serializer.fromJson<int>(json['postId']),
      comment: serializer.fromJson<String>(json['comment']),
      uuid: serializer.fromJson<String>(json['uuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'postId': serializer.toJson<int>(postId),
      'comment': serializer.toJson<String>(comment),
      'uuid': serializer.toJson<String>(uuid),
    };
  }

  CommentDtoData copyWith(
          {int? id, int? postId, String? comment, String? uuid}) =>
      CommentDtoData(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        comment: comment ?? this.comment,
        uuid: uuid ?? this.uuid,
      );
  @override
  String toString() {
    return (StringBuffer('CommentDtoData(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('comment: $comment, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, postId, comment, uuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentDtoData &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.comment == this.comment &&
          other.uuid == this.uuid);
}

class CommentDtoCompanion extends UpdateCompanion<CommentDtoData> {
  final Value<int> id;
  final Value<int> postId;
  final Value<String> comment;
  final Value<String> uuid;
  const CommentDtoCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.comment = const Value.absent(),
    this.uuid = const Value.absent(),
  });
  CommentDtoCompanion.insert({
    this.id = const Value.absent(),
    required int postId,
    required String comment,
    required String uuid,
  })  : postId = Value(postId),
        comment = Value(comment),
        uuid = Value(uuid);
  static Insertable<CommentDtoData> custom({
    Expression<int>? id,
    Expression<int>? postId,
    Expression<String>? comment,
    Expression<String>? uuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (comment != null) 'comment': comment,
      if (uuid != null) 'uuid': uuid,
    });
  }

  CommentDtoCompanion copyWith(
      {Value<int>? id,
      Value<int>? postId,
      Value<String>? comment,
      Value<String>? uuid}) {
    return CommentDtoCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      comment: comment ?? this.comment,
      uuid: uuid ?? this.uuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<int>(postId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentDtoCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('comment: $comment, ')
          ..write('uuid: $uuid')
          ..write(')'))
        .toString();
  }
}

class $CommentDtoTable extends CommentDto
    with TableInfo<$CommentDtoTable, CommentDtoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentDtoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<int?> postId = GeneratedColumn<int?>(
      'post_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String?> uuid = GeneratedColumn<String?>(
      'uuid', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, postId, comment, uuid];
  @override
  String get aliasedName => _alias ?? 'comment_dto';
  @override
  String get actualTableName => 'comment_dto';
  @override
  VerificationContext validateIntegrity(Insertable<CommentDtoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    } else if (isInserting) {
      context.missing(_postIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommentDtoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CommentDtoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CommentDtoTable createAlias(String alias) {
    return $CommentDtoTable(attachedDatabase, alias);
  }
}

abstract class _$ThanLwinTimesDatabase extends GeneratedDatabase {
  _$ThanLwinTimesDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $TopicDtoTable topicDto = $TopicDtoTable(this);
  late final $CategoryDtoTable categoryDto = $CategoryDtoTable(this);
  late final $PostDtoTable postDto = $PostDtoTable(this);
  late final $BookmarkDtoTable bookmarkDto = $BookmarkDtoTable(this);
  late final $CommentDtoTable commentDto = $CommentDtoTable(this);
  late final TopicsDao topicsDao = TopicsDao(this as ThanLwinTimesDatabase);
  late final CategoriesDao categoriesDao =
      CategoriesDao(this as ThanLwinTimesDatabase);
  late final PostsDao postsDao = PostsDao(this as ThanLwinTimesDatabase);
  late final BookmarksDao bookmarksDao =
      BookmarksDao(this as ThanLwinTimesDatabase);
  late final CommentsDao commentsDao =
      CommentsDao(this as ThanLwinTimesDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [topicDto, categoryDto, postDto, bookmarkDto, commentDto];
}
