final GetIt getIt = GetIt.instance;
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

Future<void> setupModules(
    {required List<Function> injectModule}) async {
  for (final Function element in injectModule) {
    element.call();
  }
}

Future<void> appModule() async {
  // getIt.registerSingleton(AppRouterImpl(_navigatorKey));
  // getIt.registerSingleton(AliceInspector(_navigatorKey));
  // getIt.registerSingleton(ApiClientImpl(aliceInspector: getIt<AliceInspector>()));
  // getIt.registerSingleton(RemoteDataSource(apiClient: getIt<ApiClientImpl>()));
  // getIt.registerSingletonAsync(() => Session.init());
}

Future<void> repoModule() async {
  // getIt.registerFactory(() => MovieRepoImpl(remoteDataSource: getIt<RemoteDataSource>()));
}

Future<void> useCaseModule() async {
  // getIt.registerFactory(() => GetNowPlayingMovieUseCase(getIt<MovieRepoImpl>()));
}

List<SingleChildWidget> viewModelModule(){
  return [
    Provider<HomeViewModel>(
        create: (_) => HomeViewModel(getIt<GetNowPlayingMovieUseCase>())
    ),
    Provider<IntroViewModel>(create: (_) => IntroViewModel()),
    Provider(create: (_) => SettingViewModel(getIt<Session>()))
  ];
}