//
//  Prospect.swift
//  Hot Prospects
//
//  Created by Анна Перехрест  on 2023/10/05.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

class TestEnviroment: ObservableObject {
    @Published var test = "TEST"
}

 class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
     @Published var test = "FFFF"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }

        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
