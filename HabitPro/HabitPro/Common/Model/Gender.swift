//
//  Gender.swift
//  HabitPro
//
//  Created by Felipe Domingos on 16/07/22.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
case male = "Masculino"
case female = "Feminino"
case others = "Outros"
    
    var id: String {
        self.rawValue
    }
    var  index: Self.AllCases.Index {
        return Self.allCases.firstIndex { self == $0} ?? 0
    }
}

