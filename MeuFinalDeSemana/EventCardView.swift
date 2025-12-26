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
    var color: Color = .blue // Valor padrão para não quebrar inicializações existentes se houver

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                // Ícone estilizado
                ZStack {
                    Circle()
                        .fill(color.opacity(0.1))
                        .frame(width: 44, height: 44)
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Badge de tempo
                Text(time)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            HStack {
                Label("\(peopleCount) pessoas", systemImage: "person.2.fill")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                if let progress = progress {
                    Text("\(Int(progress * 100))%")
                        .font(.caption)
                        .bold()
                        .foregroundColor(color)
                }
            }
            
            // Barra de Progresso (se existir)
            if let progress = progress {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 6)
                        
                        Capsule()
                            .fill(color)
                            .frame(width: geometry.size.width * CGFloat(progress), height: 6)
                    }
                }
                .frame(height: 6)
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        )
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
        progress: 0.7,
        color: .red
    )
}
