part of 'main_page_cubit.dart';

sealed class MainPageState {}

final class MainPageInitialState extends MainPageState {}

final class MainPageLoadingState extends MainPageState {}

final class MainPageStubState extends MainPageState {
  final NewsModel newsModel;

  MainPageStubState({required this.newsModel});
}

final class MainPageLoadedState extends MainPageState {
  final String url;

  MainPageLoadedState({required this.url});
}

final class MainPageErrorState extends MainPageState {}
