
func checkStatus(score: Int, attendance: Int, gpa: Double) {
    print("Score: \(score)")

    var grade = ""
    if score >= 90 {
        grade = "A"
    } else if score >= 80 {
        grade = "B"
    } else if score >= 70 {
        grade = "C"
    } else if score >= 50 {
        grade = "D"
    } else {
        grade = "F"
    }
    print("Grade: \(grade)")

    let result = (score >= 50) ? "Pass" : "Fail"
    print("Result: \(result)")

    var message = ""
    switch grade {
    case "A":
        message = "Excellent!"
    case "B", "C":
        message = "Good work, keep going!"
    case "D":
        message = "You passed. Aim higher next time."
    case "F":
        message = "Please see your instructor."
    default:
        message = "Unknown grade"
    }
    print("Message: \(message)")

    let isEligible = (gpa >= 3.5 && attendance >= 90)
    print("Scholarship: \(isEligible ? "Eligible" : "Not eligible")")

    if attendance < 75 || score < 50 {
        print("Warning: At risk")
    } else {
        print("Warning: None")
    }
}

checkStatus(score: 82, attendance: 95, gpa: 3.6)
print("\nWith score 45, attendance 70, GPA 2.1:")

checkStatus(score: 45, attendance: 70, gpa: 2.1)


func register(name: String, age: Int, hasPaid: Bool) {

    guard !name.isEmpty else {
        print("Error: Name is required.")
        return
    }

    guard age >= 16 else {
        print("Error: \(name) is too young to register.")
        return
    }

    guard hasPaid else {
        print("Error: \(name) has not paid the fee.")
        return
    }

    print("\(name) is registered.")
}

register(name: "Dara", age: 18, hasPaid: true)
register(name: "Sok", age: 15, hasPaid: true)
register(name: "Vicheka", age: 20, hasPaid: false)
register(name: "", age: 19, hasPaid: true)
