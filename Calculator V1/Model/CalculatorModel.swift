//
//  CalculatorModel.swift
//  Calculator V1
//
//  Created by Negar Pirasteh on 2025-09-18.
//

import SwiftUI

// All the keys for calculator
enum Keys: String {
    // numbers
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"

    // operations
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "÷"
    case equal = "="

    // special
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"

    // colors for each key
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .purple
        case .clear, .percent, .negative:
            return .white
        default:
            return .yellow
        }
    }

    var textColor: Color {
        switch self {
        case .clear, .percent, .negative:
            return .black
        default:
            return .white
        }
    }
}
