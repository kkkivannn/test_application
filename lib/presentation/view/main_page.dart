import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:test_app/presentation/controller/main_page_cubit.dart';
import 'package:test_app/presentation/widget/news_card_widget.dart';

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
        } else if (state is MainPageStubState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 80),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ivan',
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              'News',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xffE6E6E6),
                    ),
                  ],
                ),
              ),
            ),
            body: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.newsModel.articles.length,
              itemBuilder: (context, index) => NewsCardWidget(
                image: state.newsModel.articles[index].urlToImage,
                title: state.newsModel.articles[index].title,
                description: state.newsModel.articles[index].description,
                nameCompany: state.newsModel.articles[index].source.name,
              ),
            ),
          );
        } else if (state is MainPageErrorState) {
          return const Scaffold(
            body: Center(
              child: Text("Нет подключения к интернету((((((((("),
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
