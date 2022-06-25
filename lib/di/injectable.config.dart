// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../data/app_repo.dart' as _i12;
import '../data/local/bookmarks_dao.dart' as _i7;
import '../data/local/categories_dao.dart' as _i8;
import '../data/local/local_datasource.dart' as _i11;
import '../data/local/models/thanlwintimes_db.dart' as _i4;
import '../data/local/posts_dao.dart' as _i9;
import '../data/local/topics_dao.dart' as _i5;
import '../data/network/api_service.dart' as _i6;
import '../data/network/remote_data_source.dart' as _i10;
import 'injectable_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Client>(() => injectableModule.client);
  gh.singleton<_i4.ThanLwinTimesDatabase>(_i4.ThanLwinTimesDatabase());
  gh.singleton<_i5.TopicsDao>(_i5.TopicsDao(get<_i4.ThanLwinTimesDatabase>()));
  gh.lazySingleton<_i6.ApiClient>(() => _i6.ApiClient(get<_i3.Client>()));
  gh.singleton<_i7.BookmarksDao>(
      _i7.BookmarksDao(get<_i4.ThanLwinTimesDatabase>()));
  gh.singleton<_i8.CategoriesDao>(
      _i8.CategoriesDao(get<_i4.ThanLwinTimesDatabase>()));
  gh.singleton<_i9.PostsDao>(_i9.PostsDao(get<_i4.ThanLwinTimesDatabase>()));
  gh.lazySingleton<_i10.RemoteDataSource>(
      () => _i10.RemoteDataSourceImpl(apiClient: get<_i6.ApiClient>()));
  gh.lazySingleton<_i11.LocalDatasource>(() => _i11.LocalDatasourceImpl(
      topicsDao: get<_i5.TopicsDao>(),
      categoriesDao: get<_i8.CategoriesDao>(),
      postsDao: get<_i9.PostsDao>(),
      bookmarksDao: get<_i7.BookmarksDao>()));
  gh.lazySingleton<_i12.AppRepo>(() => _i12.AppRepoImpl(
      localDatasource: get<_i11.LocalDatasource>(),
      remoteDataSource: get<_i10.RemoteDataSource>()));
  return get;
}

class _$InjectableModule extends _i13.InjectableModule {}
