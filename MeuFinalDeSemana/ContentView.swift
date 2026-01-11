//
//  ContentView.swift
//  MeuFinalDeSemana
//
//  Created by Joao Paulo Lima Silva on 19/12/25.
//

import SwiftUI

struct ContentView: View {
    // Dados de exemplo para visualizar o layout
    let events: [Event] = [
        Event(
            title: "Churrasco da Turma",
            icon: "flame.fill",
            time: "14:00",
            category: "Social",
            peopleCount: 15,
            type: .party(goal: 800, current: 450),
            dateSection: "Sábado"
        ),
        Event(
            title: "Noite de Jogos",
            icon: "gamecontroller.fill",
            time: "20:00",
            category: "Lazer",
            peopleCount: 6,
            type: .social,
            dateSection: "Sábado"
        ),
        Event(
            title: "Compras da Semana",
            icon: "cart.fill",
            time: "10:00",
            category: "Rotina",
            peopleCount: 2,
            type: .service(cost: 450.0),
            dateSection: "Domingo"
        )
    ]

    // Computed property para agrupar os eventos
    var groupedEvents: [String: [Event]] {
        Dictionary(grouping: events) { $0.dateSection }
    }
    
    // Ordem desejada das seções
    let sectionsOrder = ["Sábado", "Domingo"]

    var body: some View {
        ZStack {
            // Background geral (Cinza claro)
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            
            ScrollView {
                // Header (Título)
                HStack {
                    Text("Meus Eventos")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // LazyVStack com pinnedViews para os headers das seções
                LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
                    
                    ForEach(sectionsOrder, id: \.self) { sectionName in
                        // Só mostra a seção se houver eventos nela
                        if let sectionEvents = groupedEvents[sectionName], !sectionEvents.isEmpty {
                            Section(header: SectionHeaderView(title: sectionName)) {
                                ForEach(sectionEvents) { event in
                                    EventCardView(event: event)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 16)
            }
        }
    }
}

// Subview para o Header da Seção
struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.ultraThinMaterial) // Efeito de vidro "Frost"
                .cornerRadius(10)
            Spacer()
        }
        .padding(.vertical, 4)
        // Adiciona um padding negativo horizontal se quisermos que encoste mais, 
        // ou mantém alinhado com o padding da lista.
    }
}

#Preview {
    ContentView()
}
