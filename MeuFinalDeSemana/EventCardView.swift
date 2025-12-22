//
//  EventCardView.swift
//  MeuFinalDeSemana
//
//  Created by Joao Paulo Lima Silva on 21/12/25.
//

import SwiftUI

struct EventCardView: View {
    // 1. Aqui declaramos o que o card PRECISA receber
    let title: String
    let icon: String
    let time: String
    let category: String
    let peopleCount: Int
    let progress: Double? // Opcional (pode ser nil)

    var body: some View {
        // 2. Um layout simples só para testar se os dados chegam
        VStack {
            Image(systemName: icon)
            Text(title)
                .font(.headline)
            Text(time)
        }
        .padding()
        .background(Color.gray.opacity(0.2)) // Só para ver o tamanho
        .cornerRadius(12)
    }
}

// 3. O Preview vai reclamar, então precisamos passar dados de teste
#Preview {
    EventCardView(
        title: "Churrasco",
        icon: "flame.fill",
        time: "14:00",
        category: "Lazer",
        peopleCount: 5,
        progress: 0.7
    )
}
