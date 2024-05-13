//
//  DoubleFormatter.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import Foundation
let doubleFormatter : NumberFormatter = {
        let numberForm = NumberFormatter()
        numberForm.numberStyle = .decimal
        numberForm.minimumFractionDigits = 0
        numberForm.maximumFractionDigits = 1
        return numberForm
    }()
