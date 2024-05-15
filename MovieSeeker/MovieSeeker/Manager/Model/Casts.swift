//
//  Casts.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation
struct Casts: Codable, Hashable{
    private let gender: Int?
    let original_name: String?
    let profile_path: String?
    let character: String?
    
    enum genderString: Int,Codable,Hashable{
        case female = 1
        case man = 2
        
        func stringValue()-> String {
            switch self {
            case .female:
                return "Female"
            case .man:
                return "Man"
            }
        }
    }
    func getGenderString() -> String? {
        guard let genderControl = self.gender, let genderString = genderString(rawValue: genderControl) else {
                return nil
            }
        return genderString.stringValue()

    }
}
