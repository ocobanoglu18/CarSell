import SwiftUI



struct SearchView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @ObservedObject var modelData = ModelData()

    var filteredModels: [Model] {
        modelData.models.filter({ searchText.isEmpty ? true : $0.make.localizedCaseInsensitiveContains(searchText) })
    }

    var body: some View {
        NavigationView {
            ZStack {
                CustomColor.MainColor
                VStack {
                    SearchBar(text: $searchText, placeholder: "Search")
                        .padding(.top, 10)
                        .padding(.horizontal, 10)

                    List {
                        ForEach(filteredModels) { model in
                            NavigationLink(destination: DetailView(item: model)) {
                                ModelRowView(model: model)
                            }
                        }
                        .listRowBackground(CustomColor.CardColor)
                        .listStyle(.insetGrouped)
                    }
                    .background(CustomColor.MainColor)
                    .scrollContentBackground(.hidden)
                    .navigationBarTitle(Text("Search"))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(showCancelButton)
                    .animation(.default)
                }
                .background(CustomColor.MainColor)
            }
        }
        .background(CustomColor.MainColor)
    }
}
struct ModelRowView: View {
    var model: Model
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "car")
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("\(model.make) \(model.model)")
                        .font(.headline)
                    Text("\(model.price) €")
                        .font(.subheadline)
                }
            }
        }.frame(width: .infinity,height: 60)
        Divider().bold().frame(height: 4)
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
                .background(CustomColor.CardColor)
                .cornerRadius(8)
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
            }
            .opacity(text.isEmpty ? 0 : 1)
        }
        .padding(.horizontal)
    }
}
