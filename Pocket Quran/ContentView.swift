import SwiftUI


struct ContentView: View {
    @State private var surahData = [Surah]()
    
    var body: some View {
        
        NavigationView{List(surahData, id: \.nama) { item in
            NavigationLink(destination: SurahDetail(surah: item)) {
                
                VStack() {
                    if(surahData .isEmpty){
                        if #available(iOS 14.0, *) {
                            ProgressView()
                        } else {
                        }
                    }
                    Text(item.nama)
                        .font(.headline)
                        .padding()
                }.navigationBarTitle(
                    "🕌"+" Pocket Quran").navigationBarItems(trailing: NavigationLink(destination:ProfileView()){
                    Image(systemName: "person").resizable().frame(width:25, height:25)
                })
                
            }
            
        }.onAppear(perform: loadData)}
        
    }
    
    
}


extension ContentView
{
    func loadData() {
        
        guard let url = URL(string: "https://api.npoint.io/99c279bb173a6e28359c/data") else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response_obj = try? JSONDecoder().decode([Surah].self, from: data) {

                    DispatchQueue.main.async {
                        self.surahData = response_obj
                    }
                }
                
            }
            
        }.resume()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
