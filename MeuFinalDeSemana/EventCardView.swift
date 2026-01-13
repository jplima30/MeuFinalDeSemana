//
//  EventCardView.swift
//  MeuFinalDeSemana
//
//  Created by Joao Paulo Lima Silva on 21/12/25.
//

import SwiftUI

struct EventCardView: View {
    let event: Event
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                // Ícone estilizado
                ZStack {
                    Circle()
                        .fill(event.type.badgeColor.opacity(0.1))
                        .frame(width: 44, height: 44)
                    Image(systemName: event.icon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(event.type.badgeColor)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(event.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                // Badge de tempo
                Text(event.time)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            HStack {
                Label("\(event.peopleCount) pessoas", systemImage: "person.2.fill")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                // Lógica de exibição baseada no tipo de evento
                switch event.type {
                case .party(_, let current):
                     // Exemplo simplificado, idealmente calcularia % da meta
                    Text("R$ \(Int(current))")
                        .font(.caption)
                        .bold()
                        .foregroundColor(event.type.badgeColor)
                case .service(let cost):
                    Text("R$ \(Int(cost))")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.primary)
                case .social:
                    EmptyView()
                }
            }
            
            // Barra de Progresso (apenas para Party por enquanto)
            if case .party(let goal, let current) = event.type {
                let progress = current / goal
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 6)
                        
                        Capsule()
                            .fill(event.type.badgeColor)
                            .frame(width: geometry.size.width * CGFloat(progress), height: 6)
                    }
                }
                .frame(height: 6)
            }
        }
        .padding(16)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(16)
        .shadow(color: colorScheme == .dark ? .clear : Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.1), lineWidth: 1)
        )
    }
}

// 3. Preview atualizado
#Preview {
    VStack {
        EventCardView(event: Event(
            title: "Churrasco",
            icon: "flame.fill",
            time: "14:00",
            category: "Lazer",
            peopleCount: 15,
            type: .party(goal: 500, current: 350),
            dateSection: "Sábado"
        ))
        
        EventCardView(event: Event(
            title: "Futebol",
            icon: "sportscourt.fill",
            time: "10:00",
            category: "Esporte",
            peopleCount: 12,
            type: .social,
            dateSection: "Domingo"
        ))
    }
    .padding()
    .background(Color(.secondarySystemBackground))
}
