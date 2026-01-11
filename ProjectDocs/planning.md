# Planejamento e Contexto - MeuFinalDeSemana

Este arquivo armazena o estado atual do projeto e o roteiro de implementação para garantir continuidade entre sessões.

## Estado Atual (24/12/2025)
*   **Componente Criado**: `EventCardView.swift` (Card de visualização de eventos com título, ícone, horário e categoria).
*   **Módulo em Foco**: Modelo de Dados e Integração.
*   **Metodologia**: Aprendizado Guiado (Mentor Socrático).

## Roteiro de Implementação

### 1. Fundação (Em Andamento)
- [x] Criar componente visual do Card (`EventCardView`)
- [x] **Definir Modelo de Dados (`Event`)**
    - Estrutura para suportar polimorfismo visual (Custo, Progresso, Descrição).
    - Suporte a Categorias com cores distintas.
    - [x] Refatorar `EventCardView` para usar o novo modelo.
- [ ] Criar Lista de Eventos (`ContentView`)
    - [x] Implementação básica com ScrollView e novos Cards.
    - [x] Agrupamento por Data (Seções: "Sábado", "Domingo").
    - [ ] Adaptação do Design (Dark Mode, Navigation Bar customizada).

### 2. Detalhes e Navegação (Planejado)
- [ ] Criar tela de detalhes do evento.
- [ ] Implementar navegação (NavigationStack).

### 3. Criação de Eventos (Futuro)
- [ ] Formulário de adição.
- [ ] Persistência básica.
