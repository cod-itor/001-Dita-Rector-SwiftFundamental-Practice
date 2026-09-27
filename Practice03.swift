
for i in 1...10 {
    print("7 x \(i) = \(7 * i)")
}

print("")

let topics = ["Variables", "Conditionals", "Loops", "Collections"]
for i in 0..<topics.count {

    print("\(i + 1). \(topics[i])")
}


var totalMinutes = 0
var sessionCount = 0

while totalMinutes < 100 {
    sessionCount += 1
    totalMinutes += 25
    print("Session \(sessionCount): \(totalMinutes) minutes")
}
print("Goal reached in \(sessionCount) sessions.")

var countdown = 3
repeat {
    print("\(countdown)...")
    countdown -= 1
} while countdown > 0
print("Break time!")


let scores = [78, 92, -5, 64, 101, 88, -1, 70]
var validCount = 0
var totalScore = 0

for score in scores {

    if score == -1 {
        print("End marker found. Stopping.")
        break
    }

    if score < 0 || score > 100 {
        print("\(score) skipped (invalid)")
        continue
    }

    print("\(score) accepted")
    validCount += 1
    totalScore += score
}

print("Valid scores: \(validCount)")
print("Total: \(totalScore)")
