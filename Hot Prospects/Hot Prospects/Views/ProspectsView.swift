//
//  ProspectsView.swift
//  Hot Prospects
//
//  Created by Анна Перехрест  on 2023/10/05.
//

import SwiftUI

struct ProspectsView: View {
    let filter: FilterType
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
enum FilterType {
    case none, contacted, uncontacted
}
