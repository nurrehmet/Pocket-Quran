
import SwiftUI

struct SurahDetail: View {
    @State var ayats: [Ayat] = []

    
    var surah: Surah
    var body: some View {
        
        VStack() {
            
            Text(surah.nama)
                .font(.headline).bold()
            Text(surah.arti)
                .font(.subheadline).padding()
            HStack(){
                Text("Jumlah Ayat: \(surah.ayat)")
                    .font(.footnote).padding()
                               Text("Asma: \(surah.asma)")
                    .font(.footnote).padding()
            }.onAppear(){
                fetchAyat().getAyats(nomor:surah.nomor){
                    (ayats) in
                    self.ayats = ayats
                }
            }.font(.footnote).padding()
            if(ayats .isEmpty){
                if #available(iOS 14.0, *) {
                    ProgressView()
                } else {
                    // Fallback on earlier versions
                }
            }
            List(ayats) { ayat in
                VStack(alignment: .leading) {
                    Text(ayat.nomor)
                        .font(.headline).padding()
                    Text(ayat.ar)
                        .font(.headline).padding()
                    Text(ayat.id)
                        .font(.subheadline)
                }
            }
    }
    }
}
