//
//  DoSomethingListApp.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//
import FirebaseCore
import SwiftUI

@main
struct DoSomethingListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
