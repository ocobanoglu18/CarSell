//
//  ContentView.swift
//  Seller
//
//  Created by Ozcan Adnan Cobanoglu (Dogus Teknoloji) on 8.05.2023.
//


import SwiftUI

struct HomePage: View {
    @State var items = [Model]()
    @AppStorage("username") var username: String=""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Image(systemName: "person").font(.title)
                        .padding(.leading)
                    Spacer()
                    VStack{
                        Text("Good Morning!")
                        Text(username).bold().font(.largeTitle)
                    }
                    Spacer()
                    Image(systemName: "alarm").font(.title)
                    Image(systemName: "heart").font(.title)
                        .padding(.trailing)
                }
                ScrollView(showsIndicators: false) {
                    VStack{
                        HStack {
                            Text("Special Offers").bold()
                            Spacer()
                            
                            Button {
                            } label: {
                                NavigationLink {
                                    SpecialOffers()
                                } label: {
                                    Text("See all!").bold()
                                        .padding(.trailing)
                                }
                                
                                
                            }
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
                    Image("BrandLogos")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width-20)
                    
                    HStack {
                        Text("All List").bold()
                        Spacer()
                        Text("").bold()
                            .padding(.trailing)
                    }
                    .padding(.leading)
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                        ForEach(items, id: \.id) { item in
                            if let image = item.images?.first {
                                NavigationLink(destination: DetailView(item: item)) {
                                    VStack {
                                        AsyncImage(url: URL(string: image.url)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width:.infinity,height: 100)
                                                .cornerRadius(20)
                                            
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        
                                        
                                        Text(item.model).foregroundColor(.white)
                                            .font(.headline)
                                        
                                        Text(item.description).foregroundColor(.white)
                                        Text("\(item.price)" + " " + "$")
                                            .foregroundColor(.white)
                                            .bold()
                                            .padding(.top)
                                            .padding(.bottom)
                                        
                                        
                                    }
                                    .background(CustomColor.CardColor).cornerRadius(20)
                                    
                                }
                            }
                        }.padding(.trailing)
                            .padding(.leading)
                        
                    }
                }
            }
            .navigationTitle("")
              .navigationBarBackButtonHidden(false)
            .background(CustomColor.MainColor)
        }
        
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://private-anon-214c7ebbfc-simpleclassifieds.apiary-mock.com/") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid HTTP response")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let items = try JSONDecoder().decode([Model].self, from: data)
                DispatchQueue.main.async {
                    self.items = items
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

