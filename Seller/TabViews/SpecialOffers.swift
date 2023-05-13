//
//  SpecialOffers.swift
//  Seller
//
//  Created by Adnan Cobanoglu on 9.05.2023.
//

import SwiftUI

struct SpecialOffers: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack{
                    HStack {
                        Text("Special Offers").bold().foregroundColor(.white)
                        Spacer()
                        Text("").bold()
                            .padding(.trailing)
                    }
                    .padding(.leading)
                    
                    VStack{
                        HStack{
                            VStack{
                                Text("%20").bold().font(.largeTitle)
                                Text("Weekly Deals").font(.subheadline)
                                Text("Get a new car discount only for this weekend!")
                                    .font(.subheadline)
                                    .lineLimit(3)
                                    .padding(.leading)
                            }
                            Image("CarImage")
                            
                            
                        }
                    }.frame(width:UIScreen.main.bounds.width/1.2, height:160).background(CustomColor.CardColor).cornerRadius(20)
                        .padding(.bottom)
                        .padding(.top,20)
                }

                    VStack{
                        HStack{
                            VStack{
                                Text("%20").bold().font(.largeTitle)
                                Text("Weekly Deals").font(.subheadline)
                                Text("Get a new car discount only for this weekend!")
                                    .font(.subheadline)
                                    .lineLimit(3)
                                    .padding(.leading)
                            }
                            Image("CarImage")
                            
                            
                        }
                    }.frame(width:UIScreen.main.bounds.width/1.2, height:160).background(CustomColor.CardColor).cornerRadius(20)
                        .padding(.bottom)
                        .padding(.top,10)
                   
                    VStack{
                        HStack{
                            VStack{
                                Text("%20").bold().font(.largeTitle)
                                Text("Weekly Deals").font(.subheadline)
                                Text("Get a new car discount only for this weekend!")
                                    .font(.subheadline)
                                    .lineLimit(3)
                                    .padding(.leading)
                            }
                            Image("CarImage")
                            
                            
                        }
                    }.frame(width:UIScreen.main.bounds.width/1.2, height:160).background(CustomColor.CardColor).cornerRadius(20)
                        .padding(.bottom)
                        .padding(.top,10)
                
                    VStack{
                        HStack{
                            VStack{
                                Text("%20").bold().font(.largeTitle)
                                Text("Weekly Deals").font(.subheadline)
                                Text("Get a new car discount only for this weekend!")
                                    .font(.subheadline)
                                    .lineLimit(3)
                                    .padding(.leading)
                            }
                            Image("CarImage")
                            
                            
                        }
                    }.frame(width:UIScreen.main.bounds.width/1.2, height:160).background(CustomColor.CardColor).cornerRadius(20)
                        .padding(.bottom)
                        .padding(.top,10)
                
            }
                .padding(.top,40)
        }.background(CustomColor.MainColor)
    }
}

struct SpecialOffers_Previews: PreviewProvider {
    static var previews: some View {
        SpecialOffers()
    }
}
