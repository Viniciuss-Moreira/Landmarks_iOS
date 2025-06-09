//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 08/06/25.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)


                Text("Notificações: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Fotos da Temporada: \(profile.seasonalPhoto.rawValue)")
                Text("Data de Visita: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Emblemas Completados")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "Primeira Caminhada")
                            HikeBadge(name: "Dia da Terra")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Décima Caminhada")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Caminhadas Recentes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
