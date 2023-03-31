//
//  SignUpReponse.swift
//  HabitPro
//
//  Created by Felipe Domingos on 20/07/22.
//

import Foundation

struct ErrorResponse: Decodable {
    let detail: String

    
    enum CodingKeys: String, CodingKey {
      case detail
  }
}
