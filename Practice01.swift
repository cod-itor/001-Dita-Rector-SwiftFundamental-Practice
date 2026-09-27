let studentID = 1001
var name = "Dara"
var age: Int = 20
var gpa: Double = 3.75
var isActive = true

print("ID: \(studentID)")
print("Name: \(name)")
print("Age: \(age)")
print("GPA: \(gpa)")
print("Active: \(isActive)")

gpa = 3.90

print("Updated GPA: \(gpa)")

let score1 = 80
let score2 = 90
let score3 = 85

let total = score1 + score2 + score3

let average = Double(total) / 3.0

let roundedAverage = Int(average)

let label = "Total: \(total)"

print("Total: \(total)")
print("Average: \(average)")
print("Rounded average: \(roundedAverage)")
print("Label -> \(label)")
