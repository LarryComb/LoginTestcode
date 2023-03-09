//
//  ContentView.swift
//  TestLogIn
//
//  Created by LARRY COMBS on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginSreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    /*
                     //This peice of code is to updated version of NaviationLink
                     .navigationDestination(isPresented: $showingLoginSreen){ Text("You are logged in @\(username)")
                     EmptyView()
                     //Working Code
                     NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginSreen){
                     EmptyView()
                     */
                    
                    NavigationLink(destination: Text("You are logged in @\(username)"), isActive: $showingLoginSreen){
                                           EmptyView()
                      
                             
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    

                            

                        
                            
                        }
                }
            }
            .navigationBarHidden(true)
        }
    }

    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "larry" {
            wrongUsername = 0
            if password.lowercased() == "1234" {
                wrongPassword = 0
                showingLoginSreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

