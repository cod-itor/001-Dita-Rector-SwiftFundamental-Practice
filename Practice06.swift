
struct Student {
    let id: Int
    var name: String
    var gpa: Double

    func summary() -> String {
        return "\(id) - \(name) (GPA \(gpa))"
    }

    mutating func updateGPA(to newGPA: Double) {
        gpa = newGPA
    }
}

let originalStudent = Student(id: 1001, name: "Dara", gpa: 3.75)
var copyStudent = originalStudent

copyStudent.updateGPA(to: 3.90)

print("Original: \(originalStudent.summary())")
print("Copy: \(copyStudent.summary())")


class Person {
    var name: String

    init(name: String) {
        self.name = name
    }

    func introduce() -> String {
        return "Hi, I'm \(name)."
    }
}

class Teacher: Person {
    var subject: String

    init(name: String, subject: String) {
        self.subject = subject
        super.init(name: name)
    }

    override func introduce() -> String {
        return "Hi, I'm \(name) and I teach \(subject)."
    }
}

let teacherA = Teacher(name: "Mr. Rithy", subject: "Math")
let teacherB = teacherA 

teacherB.name = "Ms. Sophea"
teacherB.subject = "Swift"

print(teacherA.introduce())
print(teacherB.introduce())
