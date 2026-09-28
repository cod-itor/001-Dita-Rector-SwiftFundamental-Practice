

// MARK: - M1: Data Model, Add Student, View Students
struct Student {
    let id: Int
    var name: String
    var age: Int
    var email: String?
    var scores: [Int] = []

    var average: Double? {
        guard !scores.isEmpty else { return nil }
        
        var total = 0
        for score in scores {
            total += score
        }
        return Double(total) / Double(scores.count)
    }

    var grade: String {
        guard let avg = average else { return "-" }
        if avg >= 90 { return "A" }
        if avg >= 80 { return "B" }
        if avg >= 70 { return "C" }
        if avg >= 50 { return "D" }
        return "F"
    }

    var hasPassed: Bool {
        guard let avg = average else { return false }
        return avg >= 50
    }
}

var students: [Student] = []

func readString(prompt: String) -> String {
    print(prompt, terminator: "")
    return readLine() ?? ""
}

func readInt(prompt: String, errorMsg: String) -> Int? {
    let input = readString(prompt: prompt)
    if input.isEmpty { return nil }
    if let num = Int(input) { return num }
    print("Error: \(errorMsg)")
    return nil
}

func findStudentIndex(id: Int) -> Int? {
    return students.firstIndex(where: { $0.id == id })
}

func addStudent() {

    var id: Int = -1
    while true {
        guard let inputId = readInt(prompt: "Student ID: ", errorMsg: "ID must be a whole number.") else { continue }
        if inputId <= 0 {
            print("Error: ID must be greater than 0.")
            continue
        }
        if findStudentIndex(id: inputId) != nil {
            print("Error: ID \(inputId) already exists.")
            return
        }
        id = inputId
        break
    }

    var name = ""
    while true {
        let inputName = readString(prompt: "Name: ")
        if inputName.isEmpty {
            print("Error: Name cannot be empty.")
            continue
        }
        name = inputName
        break
    }

    var age = 0
    while true {
        guard let inputAge = readInt(prompt: "Age: ", errorMsg: "Age must be a whole number.") else { continue }
        if inputAge < 16 || inputAge > 60 {
            print("Error: Age must be between 16 and 60.")
            continue
        }
        age = inputAge
        break
    }

    var email: String? = nil
    while true {
        let inputEmail = readString(prompt: "Email (optional): ")
        if inputEmail.isEmpty { break }
        if !inputEmail.contains("@") {
            print("Error: Email must contain '@'.")
            continue
        }
        email = inputEmail
        break
    }

    let newStudent = Student(id: id, name: name, age: age, email: email)
    students.append(newStudent)
    print("Student added.")
}

func formatAverage(_ avg: Double?) -> String {
    guard let avg = avg else { return "-" }

    let rounded = Double(Int(avg * 100)) / 100.0
    return "\(rounded)"
}

func displayStudents(_ list: [Student]) {
    if list.isEmpty {
        print("No students yet.")
        return
    }
    print("ID\tName\t\tAverage\tGrade")
    for s in list {
        let avgStr = formatAverage(s.average)
        print("\(s.id)\t\(s.name)\t\t\(avgStr)\t\(s.grade)")
    }
}

func viewAllStudents() {
    displayStudents(students)
}

// MARK: - M2: Search, Update, Delete
func searchStudent() {
    let query = readString(prompt: "Search by exact ID or part of Name: ").lowercased()

    let results = students.filter { 
        String($0.id) == query || $0.name.lowercased().contains(query)
    }

    if results.isEmpty {
        print("Not found.")
    } else {
        displayStudents(results)
    }
}

func updateStudent() {
    guard let id = readInt(prompt: "Student ID to update: ", errorMsg: "Invalid ID.") else { return }
    guard let index = findStudentIndex(id: id) else {
        print("Error: Student not found.")
        return
    }

    var student = students[index]

    let newName = readString(prompt: "New Name (press Enter to keep '\(student.name)'): ")
    if !newName.isEmpty {
        student.name = newName
    }

    while true {
        let ageInput = readString(prompt: "New Age (press Enter to keep '\(student.age)'): ")
        if ageInput.isEmpty { break }
        if let newAge = Int(ageInput), newAge >= 16, newAge <= 60 {
            student.age = newAge
            break
        } else {
            print("Error: Age must be a whole number between 16 and 60.")
        }
    }

    let currentEmail = student.email ?? "not provided"
    while true {
        let emailInput = readString(prompt: "New Email (press Enter to keep '\(currentEmail)'): ")
        if emailInput.isEmpty { break }
        if emailInput.contains("@") {
            student.email = emailInput
            break
        } else {
            print("Error: Email must contain '@'.")
        }
    }

    students[index] = student
    print("Student updated.")
}

func deleteStudent() {
    guard let id = readInt(prompt: "Student ID to delete: ", errorMsg: "Invalid ID.") else { return }
    guard let index = findStudentIndex(id: id) else {
        print("Error: Student not found.")
        return
    }

    let confirm = readString(prompt: "Are you sure you want to delete \(students[index].name)? (y/n): ")
    if confirm.lowercased() == "y" {
        students.remove(at: index)
        print("Student deleted.")
    } else {
        print("Deletion cancelled.")
    }
}

// MARK: - M3: Scores, Averages, Grades, Class Report
func addScore() {
    guard let id = readInt(prompt: "Student ID: ", errorMsg: "Invalid ID.") else { return }
    guard let index = findStudentIndex(id: id) else {
        print("Error: Student not found.")
        return
    }

    while true {
        guard let score = readInt(prompt: "Score: ", errorMsg: "Score must be a whole number.") else { continue }
        if score >= 0 && score <= 100 {
            students[index].scores.append(score)
            print("Score added.")
            break
        } else {
            print("Error: Score must be between 0 and 100.")
        }
    }
}

func classReport() {
    let studentsWithScores = students.filter { !$0.scores.isEmpty }
    if studentsWithScores.isEmpty {
        print("No scores available for class report.")
        return
    }

    var classTotal = 0.0
    for student in studentsWithScores {
        if let avg = student.average {
            classTotal += avg
        }
    }
    
    let classAverage = classTotal / Double(studentsWithScores.count)

    print("Total Students: \(students.count)")
    print("Students with scores: \(studentsWithScores.count)")
    print("Class Average: \(formatAverage(classAverage))")
}

// MARK: - M4: Filter and Sort
func filterAndSort() {
    print("""
    1. Filter by Grade (A, B, C, D, F)
    2. Filter Passing Students
    3. Sort by Name (A-Z)
    4. Sort by Average (High to Low)
    """)
    let choice = readString(prompt: "Option: ")

    var resultList = students

    switch choice {
    case "1":
        let grade = readString(prompt: "Enter Grade: ").uppercased()
        resultList = students.filter { $0.grade == grade }
    case "2":
        resultList = students.filter { $0.hasPassed }
    case "3":
        resultList = students.sorted { $0.name.lowercased() < $1.name.lowercased() }
    case "4":
        resultList = students.sorted { ($0.average ?? -1) > ($1.average ?? -1) }
    default:
        print("Invalid option.")
        return
    }

    displayStudents(resultList)
}

// MARK: - Main Menu (Includes M5: Validation and Error Handling throughout the menu loop)
func showMenu() {
    print("""

    1. Add student
    2. View all students
    3. Search student
    4. Update student
    5. Delete student
    6. Add score
    7. Class report
    8. Filter & sort
    0. Exit
    """)
}

func run() {
    var isRunning = true
    while isRunning {
        showMenu()
        let option = readString(prompt: "Choose an option: ")
        print("")

        switch option {
        case "1": addStudent()
        case "2": viewAllStudents()
        case "3": searchStudent()
        case "4": updateStudent()
        case "5": deleteStudent()
        case "6": addScore()
        case "7": classReport()
        case "8": filterAndSort()
        case "0":
            print("Goodbye!")
            isRunning = false
        default:
            print("Invalid option.")
        }
    }
}

run()
