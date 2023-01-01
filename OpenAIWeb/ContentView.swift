//
//  ContentView.swift
//  OpenAIWeb
//
//  Created by Michele Manniello on 31/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    let urlString : String = "https://chat.openai.com/chat"
    
    var body: some View {
        VStack {
            if let url = URL(string: urlString){
                WebView(viewModel: viewModel, request: URLRequest(url: url))
            }else{
                Text("Url non available")
                    .foregroundColor(.gray)
                    
            }
            Image(systemName: "arrow.clockwise")
                .aspectRatio(contentMode: .fit)
                .frame(width: 30,height: 30)
                .onTapGesture {
                    viewModel.refresh.toggle()
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
