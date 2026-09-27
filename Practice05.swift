
func average(of scores: [Double]) -> Double {
    let total = scores.reduce(0, +)
    return total / Double(scores.count)
}

func letterGrade(for average: Double) -> String {
    if average >= 90 { return "A" }
    if average >= 80 { return "B" }
    if average >= 70 { return "C" }
    if average >= 50 { return "D" }
    return "F"
}

func printReport(_ name: String, scores: [Double]) {
    let avg = average(of: scores)
    let grade = letterGrade(for: avg)
    print("\(name): average \(avg), grade \(grade)")
}

printReport("Dara", scores: [80, 90, 85])
printReport("Sok", scores: [60, 70, 65])


let scores = [72, 45, 90, 61, 38, 85]

let isPassing: (Int) -> Bool = { (score: Int) -> Bool in
    return score >= 50
}

let passingScores = scores.filter { score in
    return score >= 50
}
print("Passing: \(passingScores)")

let bonusScores = scores.map { $0 + 5 }
print("Add 5 bonus points to every score: \(bonusScores)")

let sortedScores = scores.sorted { $0 > $1 }
print("Sort Highest first: \(sortedScores)")

let passingCount = scores.filter(isPassing).count
print("Passing count: \(passingCount)")
