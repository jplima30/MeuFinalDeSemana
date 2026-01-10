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

    var body: some View {
        ZStack {
            // Background geral (Cinza claro para destacar os cards brancos)
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // Título da Tela (Opcional por enquanto, mas bom para contexto)
                    HStack {
                        Text("Meus Eventos")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Lista de Cards
                    ForEach(events) { event in
                        EventCardView(event: event)
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    ContentView()
}
