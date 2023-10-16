//
//  ContentViewAgent.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//
import FirebaseAuth
import Foundation


class ContentViewAgent: ObservableObject {
@Published var currentUserId: String = ""
    
    // handler is a const that will keep a look on authentication changes
    // When they say is mutable is that the variable can change is like let in javascript
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _ , user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""

            }
        }
    }
    
    public var isLoggedIn: Bool {
        // if someone is signed in it current user will not be nil.
        return Auth.auth().currentUser != nil
    }
}
