//
//  TaskRow.swift
//  ToDoAppMongoDB
//
//  Created by M H on 28/12/2021.
//

import SwiftUI

struct TaskRow: View {
	
	var title: String
	var completed: Bool
	
    var body: some View {
		HStack(spacing: 20) {
			Image(systemName: completed ? "checkmark.circle" : "circle")
			
			Text(title)
		} // h
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(title: "Do laundry", completed: true)
    }
}
