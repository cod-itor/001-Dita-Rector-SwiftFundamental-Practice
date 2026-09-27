
var roster = ["Dara", "Sok", "Bopha"]
roster.append("Rithy")
roster.insert("Vicheka", at: 0)

print("All Data: \(roster)")
print("Count: \(roster.count)")
print("First: \(roster.first ?? "")")

roster.remove(at: 2)
print("After removing: \(roster)")
print("Has Dara: \(roster.contains("Dara"))")
print("Sorted: \(roster.sorted())")


var codingClub: Set<String> = ["Dara", "Sok", "Bopha"]
let mathClub: Set<String> = ["Sok", "Rithy", "Bopha"]

codingClub.insert("Dara")
print("Coding club size: \(codingClub.count)")

let inBoth = codingClub.intersection(mathClub)
print("In both clubs: \(inBoth.sorted())")

let allMembers = codingClub.union(mathClub)
print("All members: \(allMembers.sorted())")


var grades = ["Dara": 88, "Sok": 74]
grades["Bopha"] = 91
grades["Sok"] = 79
grades["Dara"] = nil

print("Bopha: \(grades["Bopha"] ?? 0)")
print("Rithy: \(grades["Rithy"] ?? 0)")
print("Entries: \(grades.count)")

for (name, score) in grades {
    print("\(name) -> \(score)")
}
