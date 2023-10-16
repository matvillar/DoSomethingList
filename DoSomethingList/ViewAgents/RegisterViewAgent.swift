//
//  RegisterViewAgent.swift
//  DoSomethingList
//
//  Created by admin on 10/11/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewAgent: ObservableObject{
    @Published var userEmail: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    
    
    func register(){
        guard validate() else {
            return
        }
        // code continous here because validate passed
        Auth.auth().createUser(withEmail: userEmail, password: password){[weak self] result, error in
            // we are putting in a variable something we are checking if we got a result from creating a new user. result? (is optional to verify if it was created and it would not crash the app in case nothing is created.
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        
        }
        
        
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: userEmail, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    // we first validate and then register
    func validate() -> Bool{
        guard !userEmail.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty 
        else  {
            return false
        }
        guard userEmail.contains("@") && userEmail.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        return true
    }
    
}
