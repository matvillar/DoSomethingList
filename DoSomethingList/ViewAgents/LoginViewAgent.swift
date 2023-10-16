//
//  LoginViewAgent.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//
import FirebaseAuth
import Foundation


class LoginViewAgent: ObservableObject{
    @Published var userEmail: String = ""
    @Published var password: String = ""
    @Published var errorMessage = ""
    
    
    func login(){
        guard validate() else {
            return
        }
        // So if its all valid we will try to login the user
        Auth.auth().signIn(withEmail: userEmail, password: password)
        
    }
    
    private func validate()-> Bool{
        // Reset errorMessage every time we tap on login
        errorMessage = ""
        // User didnot type anything
        guard !userEmail.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all fields."
            return false
        }
    
        // Validate email
        guard userEmail.contains("@") && userEmail.contains(".") else {
            errorMessage = "Please enter valid Email"
            return false
        }
        
        return true
    }
}
