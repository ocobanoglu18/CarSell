//
//  ContentView.swift
//  Seller
//
//  Created by Ozcan Adnan Cobanoglu (Dogus Teknoloji) on 8.05.2023.
//


import SwiftUI

struct ContentView: View {
    @AppStorage("loginStatus") var loginStatus: Bool=false
    @AppStorage("username") var username: String=""
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "MainColor")
        
    }
    var body: some View {
        if(loginStatus==true){
            
            TabView {
                HomePage()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                ProfilePage()
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
                
            }.tint(.white)
        }else{
            LoginView()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
