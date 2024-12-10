//
//  ContentView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { // return VStack 인데 return이 생략됨
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.top, 30)
            Text("Hello, world!")
            
            photoStack
            
            ZStack(alignment: .bottom) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.orange)
                    .background(Color(.yellow))
                
                InfoView()
            }
            
        }
        
    }
    
    var photoStack: some View {
        HStack {
            Image(systemName: "photo")
            Text("photo")
            Image(systemName: "photo")
            Text("photo")
            Image(systemName: "photo")
            Text("photo")
        }
        .padding()
        .background(Color(.green))
    }
}
    

struct InfoView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .opacity(0.5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("김유림")
                    Text("안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요!")
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

    #Preview {
        ContentView()
    }
