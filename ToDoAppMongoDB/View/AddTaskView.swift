//
//  AddTaskView.swift
//  ToDoAppMongoDB
//
//  Created by M H on 28/12/2021.
//

import SwiftUI

struct AddTaskView: View {
	
	@Environment(\.dismiss) var dismiss
	
	@EnvironmentObject var realManager: RealmManager
	
	@State private var title: String = ""
	
    var body: some View {
		VStack(alignment: .leading, spacing: 20, content: {
			Text("Create a new task")
				.font(.title3)
				.bold()
			
			TextField("Enter your task here", text: $title)
				.textFieldStyle(.roundedBorder)
			
			Button(action: {
				if title != "" {
					realManager.addTask(taskTitle: title)
				} // if
				dismiss()
			}, label: {
				Text("Add task")
					.foregroundColor(.white)
					.padding()
					.padding(.horizontal)
					.background(.green)
					.clipShape(Capsule())
			}) // butt
			
			Spacer()
		}) // v
			.padding(.top, 40)
			.padding(.horizontal)
			.background(Const.bgColor)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
			.environmentObject(RealmManager())
    }
}
