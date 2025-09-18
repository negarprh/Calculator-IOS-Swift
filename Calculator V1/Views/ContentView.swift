//
//  ContentView.swift
//  Calculator V1
//
//  Created by Negar Pirasteh on 2025-09-18.
//

import SwiftUI

struct ContentView: View {
    // UI
    @State private var display = "0"

    
    @State private var lastValue: Double? = nil
    @State private var pendingOp: Keys? = nil
    @State private var isTyping: Bool = false

    // Layout
    let rows: [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]

    var body: some View {
        ZStack {
            // background
            VStack(spacing: 0) {
                Color.pink.frame(height: 0)
                LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()

            VStack {
                Spacer()

                // Display
                HStack {
                    Spacer()
                    Text(display)
                        .font(.system(size: 70, weight: .bold))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 24)
                }

                // Buttons
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { key in
                            Button {
                                tap(key)
                            } label: {
                                Text(key.rawValue)
                                    .font(.system(size: 28, weight: .semibold))
                                    .frame(width: buttonWidth(key), height: buttonHeight())
                                    .background(key.buttonColor)
                                    .clipShape(Capsule()) // round; zero
                                    .foregroundColor(key.textColor)
                                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 3)
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 12)
        }
    }

    // MARK: - Sizes
    func buttonWidth(_ key: Keys) -> CGFloat {
        let w = (UIScreen.main.bounds.width - 5 * 12 - 32) / 4
        return key == .zero ? (w * 2 + 12) : w
    }
    func buttonHeight() -> CGFloat {
        (UIScreen.main.bounds.width - 5 * 12 - 32) / 4
    }

    // MARK: - Logic

    func tap(_ key: Keys) {
        switch key {
        // digits
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            appendDigit(key.rawValue)

        case .decimal:
            addDecimal()

        case .clear:
            clearAll()

        case .negative:
            toggleSign()

        case .percent:
            applyPercent()

        // operations
        case .add, .subtract, .multiply, .divide:
            setOperation(key)

        case .equal:
            calculateIfPossible()
        }
    }

    func appendDigit(_ d: String) {
        if isTyping {
            if display == "0" { display = d } else { display += d }
        } else {
            display = d
            isTyping = true
        }
    }

    func addDecimal() {
        if isTyping {
            if !display.contains(".") { display += "." }
        } else {
            display = "0."
            isTyping = true
        }
    }

    func clearAll() {
        display = "0"
        lastValue = nil
        pendingOp = nil
        isTyping = false
    }

    func toggleSign() {
        if display == "0" { return }
        if display.hasPrefix("-") { display.removeFirst() }
        else { display = "-" + display }
    }

    func applyPercent() {
        if let v = Double(display) {
            display = format(v / 100.0)
        }
    }

    func setOperation(_ op: Keys) {
        
        if isTyping {
            if let lhs = lastValue, let rhs = Double(display), let prevOp = pendingOp {
                lastValue = apply(prevOp, lhs, rhs)
                display = format(lastValue!)
            } else {
                lastValue = Double(display)
            }
            isTyping = false
        } else if lastValue == nil {
            
            lastValue = Double(display)
        }
        pendingOp = op
    }

    func calculateIfPossible() {
        guard let lhs = lastValue,
              let op = pendingOp,
              let rhs = Double(display) else { return }

        let result = apply(op, lhs, rhs)
        display = format(result)
        lastValue = nil
        pendingOp = nil
        isTyping = false
    }

    func apply(_ op: Keys, _ lhs: Double, _ rhs: Double) -> Double {
        switch op {
        case .add:      return lhs + rhs
        case .subtract: return lhs - rhs
        case .multiply: return lhs * rhs
        case .divide:   return rhs == 0 ? .infinity : lhs / rhs
        default:        return rhs
        }
    }

    func format(_ value: Double) -> String {
        if value.isInfinite || value.isNaN { return "Error" }
        let i = floor(value)
        if abs(value - i) < 1e-10 { return String(Int(i)) } // drop .0
        return String(format: "%g", value)
    }
}



#Preview {
    ContentView()
}
