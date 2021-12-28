//
//  RealmManager.swift
//  ToDoAppMongoDB
//
//  Created by M H on 28/12/2021.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
	private(set) var localRealm: Realm?
	@Published private(set) var tasks = [Task]()
	
	
	init() {
		openRealm()
		getTask()
	}
	
	func openRealm() {
		do {
			let config = Realm.Configuration(schemaVersion: 1)
			
			Realm.Configuration.defaultConfiguration = config
			
			localRealm = try Realm()
		} catch {
			print("Error opening realm: \(error)")
		}
	} // f
	
	func addTask(taskTitle: String) {
		if let localRealm = localRealm {
			do {
				try localRealm.write({
					let newTask = Task(value: ["title" : taskTitle, "completed": false])
					localRealm.add(newTask)
					
					getTask()
					
					print("Added new task to Realm: \(newTask)")
				}) // write
			} catch {
				print("Error adding task to Realm: \(error)")
			} // do
		} // if
	} // f
	
	func getTask() {
		if let localRealm = localRealm {
			
				let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
				tasks = []
				allTasks.forEach{ task in
					tasks.append(task)
				}
		} // if
	} // f
	
	func updateTask(id: ObjectId, completed: Bool){
		if let localRealm = localRealm {
			do {
				let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
				
				guard !taskToUpdate.isEmpty else {return}
				
				try localRealm.write{
					taskToUpdate[0].completed = completed
					
					getTask()
					
					print("Updated task id: \(id) , completed: \(completed)")
				} // write
			} catch {
				print("Error updating task id: \(id) to Realm: \(error)")
			} // do
		} // if
	} // f
	
	func deleteTask(id: ObjectId) {
		if let localRealm = localRealm {
			do {
				let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
				
				guard !taskToDelete.isEmpty else {return}
				
				try localRealm.write({
					localRealm.delete(taskToDelete)
					
					getTask()
					
					print("Deleted task id: \(id)")
				}) // write-delete
			} catch {
				print("Error deleting task id: \(id) to Realm: \(error)")
			} // do
		} // if
	} // f
	
}
