import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:test_app/presentation/controller/main_page_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        if (state is MainPageInitialState) {
          context.read<MainPageCubit>().fetchUrl();
        } else if (state is MainPageLoadedState) {
          return WillPopScope(
            onWillPop: () async {
              if (await _webViewController.canGoBack()) {
                _webViewController.goBack();
                return Future.value(false);
              } else {
                return Future.value(false);
              }
            },
            child: Scaffold(
              body: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(state.url)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useShouldOverrideUrlLoading: true,
                    javaScriptCanOpenWindowsAutomatically: true,
                    supportZoom: false,
                  ),
                ),
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          );
        } else if (state is MainPageErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('Нет Подключения к интернету((((((((('),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
