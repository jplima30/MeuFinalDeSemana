
import Foundation
import SwiftUI

// 1. Enum para garantir que o evento só tenha um tipo por vez
enum EventType {
    case social // Apenas informativo (Ex: 'Games')
    case service(cost: Double) // Tem um custo associado
    case party(goal: Double, current: Double) // Tem meta monetária
    
    // Computed property para ajudar na cor do badge (opcional, mas útil)
    var badgeColor: Color {
        switch self {
        case .social: return .purple
        case .service: return .cyan
        case .party: return .orange
        }
    }
}

// 2. A Struct principal
struct Event: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let time: String
    let category: String // Poderia ser outro enum, mas String por enquanto serve
    let peopleCount: Int
    
    // O tipo carrega os dados específicos (polimorfismo)
    let type: EventType
    
    // Auxiliar para datas (Sábado vs Domingo)
    // Por enquanto vamos usar String simples no mock, mas idealmente seria Date
    let dateSection: String 
}
