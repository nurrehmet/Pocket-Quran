//
//  FetchAyat.swift
//  SwiftUI Json List Data
//
//  Created by Imam Nurrahmat on 20/07/21.

import Foundation

class fetchAyat {
    @Published var loading = false
    func getAyats(nomor: String, completion:@escaping ([Ayat]) -> ()
                  
) {
        self.loading = true
        guard let url = URL(string: "https://api.npoint.io/99c279bb173a6e28359c/surat/\(nomor)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let ayats = try! JSONDecoder().decode([Ayat].self, from: data!)
            print(ayats)
            
            DispatchQueue.main.async {
                completion(ayats)
                self.loading = false
            }
        }
        .resume()
    }
}
