import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movies_app/data/core/api.client.dart';
import 'package:movies_app/data/data_sources/movie_remote.datasource.dart';
import 'package:movies_app/data/repositories/movie.repository.dart';
import 'package:movies_app/data/repositories/movie.repositoryImpl.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.usecase.dart';
import 'package:movies_app/domain/usecases/get_playing_now.usecase.dart';
import 'package:movies_app/domain/usecases/get_popular.usecase.dart';
import 'package:movies_app/domain/usecases/get_trending.usecase.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

// Get the static instance of GetIt.
final getItInstance = GetIt.I;


init() {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));
  getItInstance.registerFactory(
  () => MovieCarouselBloc(
    getTrending: getItInstance(),
  ),
);
}