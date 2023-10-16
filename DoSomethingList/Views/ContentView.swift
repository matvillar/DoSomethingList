//
//  ContentView.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewAgent = ContentViewAgent()
    var body: some View {
       
        if contentViewAgent.isLoggedIn , !contentViewAgent.currentUserId.isEmpty{
            // Signed in state
            TabView {
                AllToDosItemsView(userId: contentViewAgent.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label( "Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
            
        }
    }
}

#Preview {
    ContentView()
}
