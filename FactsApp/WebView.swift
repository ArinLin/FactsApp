//
//  WebView.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator

        let swipeRightGesture = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.goBack(_:)))
        swipeRightGesture.direction = .right
        webView.addGestureRecognizer(swipeRightGesture)

        let swipeLeftGesture = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.goForward(_:)))
        swipeLeftGesture.direction = .left
        webView.addGestureRecognizer(swipeLeftGesture)

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var webView: WKWebView?

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
        }

        @objc func goBack(_ sender: UISwipeGestureRecognizer) {
            if let webView = webView, webView.canGoBack {
                webView.goBack()
            }
        }

        @objc func goForward(_ sender: UISwipeGestureRecognizer) {
            if let webView = webView, webView.canGoForward {
                webView.goForward()
            }
        }
        // Добавить обработчики навигации, если нужно
    }
}

