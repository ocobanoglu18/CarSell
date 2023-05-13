import SwiftUI

class ModelData: ObservableObject {
    @Published var models = [Model]()

    init() {
        guard let url = URL(string: "https://private-anon-214c7ebbfc-simpleclassifieds.apiary-mock.com/") else {
            fatalError("Invalid URL")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                self.models = try JSONDecoder().decode([Model].self, from: data)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
