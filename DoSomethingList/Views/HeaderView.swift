//
//  HeaderView.swift
//  DoSomethingList
//
//  Created by admin on 10/12/23.
//

import SwiftUI

struct HeaderView: View {
    let darkColor: Color
    let lightColor: Color
    let title: String
    let subTitle: String
    var body: some View {
        
        ZStack {
            // Background with the linear gradient
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [darkColor, lightColor]), startPoint: .leading, endPoint: .trailing))
            
                .ignoresSafeArea()
            
            
            // Your content here
            VStack(alignment: .center){
                Text(title)
                    .font(.system(size: 50)).bold()
                    .foregroundStyle(.white)
                
                Text(subTitle)
                    .font(.title)
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding(.top, 40)
        }
        .frame(height: 300)
    }
}

//#Preview {
//    HeaderView()
//}
