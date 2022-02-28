//
//  main.swift
//  homework7
//
//  Created by Aurelica Apps iOS Dev - 1 on 28/02/22.
//

import Foundation

print("Hello, World!")



struct User {
    let name: String
    let surname: String
    let age: Int
    let position: Position
    let interviewMarks: Int
    var salary: Int
}


struct Position {
    let positionName: String
}

enum EnsureWorkCompanyError: Error {
    case errorOfEmployeeName
    case errorAge
    case errorPosition
}

class EnsureWorkCompany {

    var employee = ["Mark": User(name: "Mark", surname: "Twen", age: 34, position: Position(positionName: "ios developer"), interviewMarks: 10, salary: 30000),
                    "Grigoriy": User(name: "Григорий", surname: "Холостяков", age: 28, position: Position(positionName: "director"), interviewMarks: 8, salary: 50000)
    ]

    var marksCount = 0

    func calculateCoins(userName positionName: String, age averageAge: Int) throws -> Position?  {

        guard var user = employee[positionName] else { throw EnsureWorkCompanyError.errorOfEmployeeName}
        guard user.age < 18 else { throw EnsureWorkCompanyError.errorAge }
        guard user.interviewMarks > marksCount else { return nil }

        marksCount += user.interviewMarks
        user.salary *= marksCount

        print("your salary was increased to \(user.salary)")

        return user.position

    }
}
let employeeGroup = EnsureWorkCompany()

employeeGroup.marksCount = 3
let test2 = try? employeeGroup.calculateCoins(userName: "Markk", age: 12)


do {
    let test3 = try employeeGroup.calculateCoins(userName: "Markk", age: 10)
    print(test3?.positionName ?? "")

} catch let error {
    print(error)

}
