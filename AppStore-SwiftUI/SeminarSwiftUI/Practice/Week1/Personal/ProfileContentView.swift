//
//  ProfileContentView.swift
//  SeminarSwiftUI
//
//  Created by 김유림 on 11/23/24.
//

import SwiftUI

struct ProfileContentView: View {
    var body: some View {
        VStack {
            ProfileView()
            MyInfoView()
        }
        
    }
}

struct MyInfoView: View {
    var body: some View {
        VStack {
            titleView
            subTitleView
        }
        .padding(.horizontal, 20)
    }
    
    
    var titleView: some View {
        HStack {
            Text("iOS")
            Text("김유림")
                .bold()
                .foregroundStyle(.blue)
            Spacer()
            Text("YB")
                .foregroundStyle(.gray)
        }
    }
    
    var subTitleView: some View {
        HStack {
            Text("01년생")
            Spacer()
            Text("ISTJ")
                .foregroundStyle(.purple)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Image(systemName: "person")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color(.gray))
            .clipShape(.circle)
            .frame(width: 100)
    }
}


#Preview {
    ProfileContentView()
}
