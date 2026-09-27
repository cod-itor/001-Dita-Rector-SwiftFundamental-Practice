struct StudentScore {
    let name: String
    let score: Int

    var hasPassed: Bool {
        return score >= 50
    }
}

let students = [
    StudentScore(name: "Dara", score: 88),
    StudentScore(name: "Sok", score: 45),
    StudentScore(name: "Bopha", score: 92),
    StudentScore(name: "Rithy", score: 67),
    StudentScore(name: "Vicheka", score: 73),
    StudentScore(name: "Sophea", score: 39)
]

print("Students: \(students.count)")

if students.isEmpty {
    print("Class average: 0.00")
    print("No students to display.")
} else {

    let totalScore = students.reduce(0) { $0 + $1.score }
    let average = Double(totalScore) / Double(students.count)
    let roundedAverage = Double(Int(average * 100)) / 100.0
    print("Class average: \(roundedAverage)\n")

    print("--- Results ---")
    for student in students {
        let resultString = student.hasPassed ? "PASS" : "FAIL"
        print("\(student.name): \(student.score) \(resultString)")
    }

    let highest = students.max(by: { $0.score < $1.score })!
    let lowest = students.min(by: { $0.score < $1.score })!

    print("\nHighest: \(highest.name) (\(highest.score))")
    print("Lowest: \(lowest.name) (\(lowest.score))\n")

    let passingStudents = students.filter { $0.hasPassed }
    let passingNames = passingStudents.map { $0.name }.joined(separator: ", ")
    print("Passing: \(passingNames)\n")

    print("--- Ranking ---")
    let rankedStudents = students.sorted(by: { $0.score > $1.score })
    for (index, student) in rankedStudents.enumerated() {
        print("\(index + 1). \(student.name) - \(student.score)")
    }
}
