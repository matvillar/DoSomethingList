//
//  RegisterView.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct RegisterView: View {
@StateObject var registerViewAgent = RegisterViewAgent()
    var body: some View {
        VStack{
            HeaderView(darkColor: .darkPurple, lightColor: .lightPurple, title: "DoSome List", subTitle: "Welcome!")
            
            RegisterFormView()
               
        }
    }
    

    
    @ViewBuilder func RegisterFormView() -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hue: 1.0, saturation: 0.004, brightness: 0.92))
                .offset(y: -130)
                .shadow(radius: 7)
            
            
            VStack (alignment: .leading ,spacing: 20){
                Text("REGISTER")
                    .font(.title).bold()
                    .padding(.top, 20)
                
                
                TextField("Name", text: $registerViewAgent.name)
                    .textContentType(.emailAddress)
                    .borderView(1, .gray.opacity(0.5))
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.top, 20)
                
                
                TextField("Email", text: $registerViewAgent.userEmail)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .borderView(1, .gray.opacity(0.5))
                 
                
                SecureField("Password", text: $registerViewAgent.password)
                    .borderView(1, .gray.opacity(0.5))
                
                HStack{
                    Button(action: {
                        registerViewAgent.register()
                        
                    }) {
                        Text("Register")
                            .font(.title3)
                            .foregroundColor(.white).bold()
                            .padding()
                            .horAlign(.center)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.darkPurple, Color.lightPurple]), startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(10)
                            .padding(.top, 20)
                        
                    }
                    
                }
                
                Spacer()
            }
            .offset(y: -130)
            .padding(30)
        }
        .padding(.horizontal, 20)
    }
       
}

#Preview {
    RegisterView()
}
