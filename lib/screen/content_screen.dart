import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late final WebViewController controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            _isLoading = true;
          });
        },
        onProgress: (progress) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (url) {
          Future.delayed(Duration(milliseconds: 1), () {
            controller.runJavaScript("""
              setInterval(function() {
                var navElement = document.querySelector('header');
                if (navElement) {
                  navElement.style.display = 'none';
                }
            
                var spanElements = document.querySelectorAll('span');
                spanElements.forEach(function(spanElement) {
                  if (spanElement.textContent.includes('Download') || spanElement.textContent.includes('Share')) {
                    var parentDiv = findParentDiv(spanElement);
                    if (parentDiv) {
                      parentDiv.style.display = 'none';
                    }
                  }
                });
            
                function findParentDiv(element) {
                  var currentElement = element;
                  while (currentElement && currentElement.tagName !== 'DIV') {
                    currentElement = currentElement.parentNode;
                  }
                  return currentElement;
                }
              }, 1000);  // 1000 milliseconds = 1 second
            """);
            setState(() {
              _isLoading = false;
            });
          });
          setState(() {
            _isLoading = false;
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
