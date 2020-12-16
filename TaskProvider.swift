//
//  TaskProvider.swift
//  Dopamine
//
//  Created by David Jagga on 12/13/20.
//

import Foundation

public struct TaskProvider {
    
    static var name = ""
    public static func setLatestTask(string: String) {
        TaskProvider.name = string
    }
    public static func getLatestTask() -> String{
        return TaskProvider.name
    }
}

