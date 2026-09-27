enum EnrollmentError: Error {
    case alreadyEnrolled(String)
    case courseFull(String)
    case courseDoesNotExist(String)
}

class Course {
    let code: String
    let title: String
    let capacity: Int
    var enrolledStudents: Set<String> = []

    var seatsLeft: Int {
        return capacity - enrolledStudents.count
    }

    init(code: String, title: String, capacity: Int) {
        self.code = code
        self.title = title
        self.capacity = capacity
    }
}

class Registrar {
    var courses: [String: Course] = [:]

    func addCourse(_ course: Course) {
        courses[course.code] = course
    }

    func enroll(student: String, in courseCode: String) {
        do {

            guard let course = courses[courseCode] else {
                throw EnrollmentError.courseDoesNotExist(courseCode)
            }

            guard !course.enrolledStudents.contains(student) else {
                throw EnrollmentError.alreadyEnrolled("\(student) is already enrolled")
            }

            guard course.seatsLeft > 0 else {
                throw EnrollmentError.courseFull(courseCode)
            }

            course.enrolledStudents.insert(student)
            print("Enrolled \(student) in \(course.code)")

        } catch EnrollmentError.courseDoesNotExist(let code) {
            print("Rejected \(student): \(code) does not exist")
        } catch EnrollmentError.alreadyEnrolled(let message) {
            print("Skipped: \(message)")
        } catch EnrollmentError.courseFull(let code) {
            print("Rejected \(student): \(code) is full")
        } catch {
            print("Unknown error occurred.")
        }
    }
}

let registrar = Registrar()
registrar.addCourse(Course(code: "SWE101", title: "Swift Fundamentals", capacity: 2))
registrar.addCourse(Course(code: "UX110", title: "Intro to UX", capacity: 30))

registrar.enroll(student: "Dara", in: "SWE101")
registrar.enroll(student: "Sok", in: "SWE101")
registrar.enroll(student: "Dara", in: "SWE101")
registrar.enroll(student: "Bopha", in: "SWE101")
registrar.enroll(student: "Rithy", in: "CS999")

if let swe = registrar.courses["SWE101"] {
    let roster = swe.enrolledStudents.sorted().joined(separator: ", ")
    print("\n\(swe.title): \(roster)")
    print("Seats left: \(swe.seatsLeft)")
}
