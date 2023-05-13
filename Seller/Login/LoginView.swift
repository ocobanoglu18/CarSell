//
//  LoginView.swift
//  Seller
//
//  Created by Adnan Cobanoglu on 10.05.2023.
//

import SwiftUI

struct LoginView: View {

    var body: some View {
        TabView{
            LoginPage1().tabItem {
                
            }
            LoginPage2().tabItem {
                
            }
            LoginPage3().tabItem {
                
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

    
    struct LoginPage1: View {
        var body: some View {
            ZStack {
                   CustomColor.MainColor
                       .ignoresSafeArea()
                   
                   VStack {
                       Image(systemName: "car.side")
                           .foregroundColor(.white)
                           .font(.system(size: 50))
                           .scaleEffect(x: -1, y: 1)
                   }
               }
        }
    }
    
    struct LoginPage2: View {
        var body: some View {
            ZStack {
                CustomColor.MainColor
                    .ignoresSafeArea()
                   VStack {
                       Image(systemName: "car.side.rear.open")
                           .foregroundColor(.white)
                           .font(.system(size: 50))
                           .scaleEffect(x: -1, y: 1)
                   }
               }
        }
    }
    
    struct LoginPage3: View {
        @AppStorage("username") var username: String=""
        @AppStorage("loginStatus") var loginStatus: Bool=false
        var body: some View {
            ZStack {
                CustomColor.MainColor
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack{
                        Image(systemName: "car.2")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .scaleEffect(x: -1, y: 1)
                        
                        VStack(alignment: .center) {
                            Text("Please enter username for enjoying the rest !")
                            HStack {
                                Image(systemName: "person.circle") .foregroundColor(.gray)
                                    .font(.headline);
                                TextField("username", text: $username) }
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                            .padding(.horizontal)
                        }.padding(.top,30)
                    }
                
                    Spacer()
                    VStack{
                        Button {
                            loginStatus=true
                        } label: {
                            Text("Login").foregroundColor(.white)
                        }
                        .tint(CustomColor.CardColor)
                        .buttonStyle(.borderedProminent)
                        .padding(.trailing)
                        
                        
                    }
                    Spacer()
                }
            }
            
        }
    }
