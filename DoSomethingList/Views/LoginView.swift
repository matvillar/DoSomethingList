//
//  Loginview.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewAgent = LoginViewAgent()
 
    var body: some View {
        
        NavigationView{
            VStack {
                //Header
                HeaderView(darkColor: .blue, lightColor: .cyan, title: "DoSome List", subTitle: "Get Things Done")
                
                // Login
                LoginFormView()
                    
                
                HStack{
                    Text("Not Register Yet?")
                        .font(.title3)
                    NavigationLink("Register Now", destination: RegisterView())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                }
                .font(.callout)
                .verAlign(.bottom)
                .padding(.bottom, 50)
                
            }
        }
    }
    

    
    @ViewBuilder func LoginFormView() -> some View {
        
    
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hue: 1.0, saturation: 0.004, brightness: 0.92))
                .offset(y: -130)
                .shadow(radius: 7)
            
           
            
            VStack (alignment: .leading ,spacing: 20){
                if !loginViewAgent.errorMessage.isEmpty{
                    Text(loginViewAgent.errorMessage)
                        .foregroundStyle(.red).bold()
                }
                
                Text("LOGIN")
                    .font(.title).bold()
                    .padding(.top, 20)
                
                
                
                TextField("Email", text: $loginViewAgent.userEmail)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .borderView(1, .gray.opacity(0.5))
                    .padding(.top, 20)
                
                SecureField("Password", text: $loginViewAgent.password)
                    .borderView(1, .gray.opacity(0.5))
                
                HStack{
                    Button(action: {
                        loginViewAgent.login()
                    }) {
                        Text("Log In")
                            .font(.title3)
                            .foregroundColor(.white).bold()
                            .padding()
                            .horAlign(.center)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .leading, endPoint: .trailing)
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
    LoginView()
}






