//
//  ProfileView.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewAgent = ProfileViewAgent()
    var body: some View {
        NavigationView{
            VStack {
                if let user = profileViewAgent.user{
                    ProfileViewInfo(user: user)
                    
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Profile")
            
        }
        .onAppear{
            profileViewAgent.fetchUser()
        }
    }
    
    @ViewBuilder func ProfileViewInfo(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.darkPurple)
            .frame(width: 125, height: 125)
            .padding()
        //              Info: name, email, memeber since
        VStack(alignment: .leading){
            HStack {
                Text("Name:")
                    .bold()
                Text(user.name)
                
                
            }
            .padding()
            HStack {
                Text("Email:")
                    .bold()
                Text(user.email)
                
            }
            .padding()
            HStack {
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined ).formatted(date: .abbreviated, time: .shortened))")
                
            }
            .padding()
            
            
        }
        .padding()
        Spacer()
        Button(action: {
            profileViewAgent.logOut()
        }) {
            Text("Log Out")
                .font(.title3)
                .foregroundColor(.white).bold()
                .padding()
                .horAlign(.center)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.lightPink]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(10)
                .padding(.top, 20)
            
        }
        .padding(.horizontal,100)
        
        Spacer()
        
    }
}



#Preview {
    ProfileView()
}
