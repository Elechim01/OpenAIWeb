//
//  Home.swift
//  OpenAIWeb
//
//  Created by Michele Manniello on 31/12/22.
//

import SwiftUI
import WebKit

struct WebView:UIViewRepresentable {
    
    @ObservedObject var viewModel:ViewModel
    
    let request:URLRequest
    
    func makeUIView(context: Context) -> WKWebView{
//        Creare una configurazione per la WebView che utilizza il portachiavi
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.websiteDataStore = WKWebsiteDataStore.default()
        
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
    
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if viewModel.refresh {
            uiView.reload()
            return
        }
        uiView.load(request)
    }
}
