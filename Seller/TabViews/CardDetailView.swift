//
//  CardDetailView.swift
//  Seller
//
//  Created by Ozcan Adnan Cobanoglu (Dogus Teknoloji) on 8.05.2023.
//

import SwiftUI

struct DetailView: View {
    var item: Model
    @State var showingCredits = false
    @State var tapLiked = false

    var body: some View {
        VStack(alignment: .leading) {
            if let image = item.images?.first {
                AsyncImage(url: URL(string: image.url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:UIScreen.main.bounds.width,height: 200)
                        .cornerRadius(20)

                } placeholder: {
                    ProgressView()
                }
            }
            Image("360View")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,height: 50)
 
            HStack {
                Text(item.make + " " + item.model)
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)
                    .padding(.bottom, 5)
                .opacity(0.8)
                
                Spacer()
                Button {
                    tapLiked.toggle()
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundColor(tapLiked ? .red : .white)
                        .font(.headline)
                        .opacity(0.8)
                }

            }
            
            HStack{
                Text("New")
                    .padding(.all,4)
                       .background(Color.black)
                       .foregroundColor(.white)
                       .cornerRadius(10)
                       .font(.subheadline)
                       .opacity(0.8)
                
                Image(systemName: "star.fill")
                    .font(.subheadline)
                    .opacity(0.8)
                Text("Reviews")
                    .font(.subheadline)
                    .opacity(0.8)
                Spacer()
            }.padding(.leading)
            
            Text("Description")
                .foregroundColor(.white)
                .bold()
                .font(.headline)
                .padding(.leading)
            
            Text(item.description)
                .font(.subheadline)
                .opacity(0.8)
                .padding(.bottom, 10)
                .padding(.leading)
               
            
            Text("Gallery Photos")
                .foregroundColor(.white).bold()
                .font(.headline)
                .padding(.leading)
            if let images = item.images {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(images, id: \.url) { image in
                            AsyncImage(url: URL(string: image.url)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/7)
                            .cornerRadius(10)
                        }
                    }
                }
                HStack {
                    Spacer()
                    Image(systemName: "arrow.right").font(.title).foregroundColor(.white)
                    Spacer()
                }.padding(.top,5)
            }
            
            HStack {
                
                VStack {
                    Text("Price")
                        .font(.subheadline)
                        .opacity(0.8)
                        .padding(.top)

                    Text("\(item.price)" + " " + "$")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom)
          
               
                }.padding(.leading,10)
                Spacer()
                Button {
                    showingCredits=true
                } label: {
                    Text("Make an Offer").foregroundColor(.black)
                }.buttonStyle(.borderedProminent)
                    .padding(.trailing)
                
             


            }
            .frame(width:UIScreen.main.bounds.width,height: 70).background(Color.black).cornerRadius(10).opacity(0.7)
            
            Spacer()
                .sheet(isPresented: $showingCredits) {
                    VStack{
                        if let details = item.seller {
                            VStack{
                                HStack {
                                    Text("City")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.headline)
                                    
                                    Text(details.city).foregroundColor(.white)
                                        .font(.subheadline)
                                        .opacity(0.8)
                                }
                                HStack {
                                    Text("Phone")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.headline)
                                    
                                    Text(details.phone).foregroundColor(.white)
                                        .font(.subheadline)
                                        .opacity(0.8)
                                }
                                HStack {
                                    Text("Type")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.headline)
                                    
                                    Text(details.type).foregroundColor(.white)
                                        .font(.subheadline)
                                        .opacity(0.8)
                                }
                            }

                        }else {
                            Text("seller not avaliable")
                        }
                    } .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                        .presentationDetents([.height(300)])
                }
        }
        .padding()
        .navigationBarTitle(Text(item.model), displayMode: .inline)
        .tint(.white)
        .background(CustomColor.MainColor)
        
   
    }
}


struct DetailView_Previews: PreviewProvider {
    static let item = Model(id: 1, make: "Brand A", model: "Model A", price: 20000, firstRegistration: "2020", mileage: 50000, fuel: "Gasoline", images: [ImageList(url: "https://example.com/imageA.jpg"), ImageList(url: "https://example.com/imageB.jpg")], description: "This is a Model A car", modelline: "Standard", seller: Seller(type: "Dealer", phone: "555-1234", city: "New York"), colour: "Red")

    static var previews: some View {
        NavigationView {
            DetailView(item: item)
        }
    }
}
