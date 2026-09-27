
struct Student {
    var name: String
    var email: String?
}

let dara = Student(name: "Dara", email: "dara@school.edu")
let sok = Student(name: "Sok", email: nil)

let students = [dara, sok]

for student in students {

    if let email = student.email {
        print("\(student.name): \(email)")
    } else {
        print("\(student.name): no email on file")
    }
}

print("Sok's contact: \(sok.email ?? "not provided")")

let daraEmailLength = dara.email?.count ?? 0
print("Dara's email length: \(daraEmailLength)")

func sendReminder(to student: Student) {

    guard let email = student.email else {
        print("Cannot remind \(student.name): missing email.")
        return
    }
    print("Reminder sent to \(email).")
}

sendReminder(to: dara)
sendReminder(to: sok)


enum ScoreError: Error {
    case notANumber(String)
    case negative(Int)
    case above100(Int)
}

func parseScore(_ text: String) throws -> Int {
    guard let score = Int(text) else {
        throw ScoreError.notANumber(text)
    }

    if score < 0 {
        throw ScoreError.negative(score)
    }

    if score > 100 {
        throw ScoreError.above100(score)
    }

    return score
}

let inputs = ["88", "-4", "120", "ninety"]

for input in inputs {
    do {
        let savedScore = try parseScore(input)
        print("Saved score: \(savedScore)")
    } catch ScoreError.notANumber(let badText) {
        print("Error: \"\(badText)\" is not a number.")
    } catch ScoreError.negative(let badNum) {
        print("Error: \(badNum) is negative.")
    } catch ScoreError.above100(let badNum) {
        print("Error: \(badNum) is above 100.")
    } catch {
        print("Error: An unknown error occurred.")
    }
}
