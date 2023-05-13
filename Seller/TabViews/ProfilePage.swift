//
//  ProfilePage.swift
//  Seller
//
//  Created by Adnan Cobanoglu on 9.05.2023.
//

import SwiftUI

struct ProfilePage: View {
    @AppStorage("loginStatus") var loginStatus: Bool=false
    @AppStorage("username") var username: String=""
    var body: some View {
        NavigationStack {
            VStack{
                Image(systemName: "person.circle")
                    .foregroundColor(.white)
                    .font(.system(size:70))
                    .padding(.top,30)

                HStack {
                    Spacer()
                    Text(username).foregroundColor(.white)
                    Spacer()
                }
                .padding(.top,10)
                VStack{
                    CustomNavigationLink(title: "gear", title2: "Settings") {
                        VStack{
                            Text("Feature not available now")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(CustomColor.MainColor)
                        
                    }
                    CustomNavigationLink(title: "bookmark", title2: "Listings") {
                        VStack{
                            Text("Feature not available now")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(CustomColor.MainColor)
                    }
                    CustomNavigationLink(title: "house", title2: "Company Info") {
                        VStack{
                            Text("Feature not available now")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(CustomColor.MainColor)
                    }
                    CustomNavigationLink(title: "person", title2: "Info") {
                        VStack{
                            Text("Feature not available now")
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(CustomColor.MainColor)
                    }
                }
                .padding(.top,60)
                Spacer()
                Button {
                    loginStatus=false
                } label: {
                    HStack{
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Logout")
                            
                            .font(.headline)
                    }
                }.buttonStyle(.borderedProminent)
                    .tint(.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.bottom)
                
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .background(CustomColor.MainColor)
            
            

        }.background(CustomColor.MainColor)
            .tint(.white)
            .navigationBarBackButtonHidden(true)
    }
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String,title2:String,@ViewBuilder content: @escaping ()->Detail)-> some View {
        VStack{
            NavigationLink {
                content()
            } label: {
                HStack{
                    Image(systemName: title)
                        .foregroundColor(.white)
                        .padding(.leading)
                    Text(title2)
                        .foregroundColor(.white)
                        .padding(.leading)
                    Spacer()
                    Image(systemName: "arrow.right").foregroundColor(.white)
                        .padding(.trailing)
                }.frame(width: UIScreen.main.bounds.width-20,height: 50).background(CustomColor.CardColor).cornerRadius(20)
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(false)
            .padding(.top,20)
        }
    }
}
                          



struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
