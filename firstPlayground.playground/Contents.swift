import Foundation

let nombre: String = "Maria"
var edad: Int = 21
var estatura: Double = 2.40

print("Edad: \(edad)")

func calculateIMB(weight: Double, height: Double) -> Double? {
    
    guard height > 0 else {return nil}
    
    return weight / (height * height)
}

func bmiCalculator(for bmi: Double) -> String {
    
    switch bmi {
    case ..<18.5:
        return "bajo"
        
    case 18.5..<25:
        return "normal"
        
    case 25..<30:
        return "alto"

    default:
        return "muy alto"
    }
    
    
    
}

//secure unwrapping
if let bmi = calculateIMB(weight: 60, height: 1.62){
    
    let category = bmiCalculator(for: bmi)
    
    let roundedBMI = String(format: "%.2f", bmi)
    
    
} else {
    print("No se pudo calcular el bmi")
}
