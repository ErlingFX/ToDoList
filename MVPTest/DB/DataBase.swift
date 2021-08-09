//
//  DataBase.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 06.08.2021.
//

import Foundation


class DataBase {
    static var shared = DataBase()
     var arrayOfEvents: [Task] = []
    

    func getArrayOfEvent() -> [Task] {
        return arrayOfEvents
    }
    func addArrayOfEvent(addTask: Task) {
        arrayOfEvents.append(addTask)
        print(arrayOfEvents)
    }
}
