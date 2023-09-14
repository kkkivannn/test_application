part of 'main_page_cubit.dart';

class MainPageState {}

class MainPageInitialState extends MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageLoadedState extends MainPageState {
  final String url;

  MainPageLoadedState({required this.url});
}

class MainPageErrorState extends MainPageState {}
