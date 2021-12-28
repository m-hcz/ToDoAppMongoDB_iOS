//
//  TaskView.swift
//  ToDoAppMongoDB
//
//  Created by M H on 28/12/2021.
//

import SwiftUI
import Network

struct TaskView: View {
	
	@EnvironmentObject var realManager: RealmManager
	
    var body: some View {
		VStack {
			HStack {
				Text("My tasks")
					.font(.title3)
					.bold()
					.padding()
				
				Spacer()
			} // h
			
			
			List{
				ForEach(realManager.tasks, id:\.id) { task in
					if !task.isInvalidated {
						TaskRow(title: task.title, completed: task.completed)
							.onTapGesture {
								realManager.updateTask(id: task.id, completed: !task.completed)
							} // tab
							.swipeActions(edge: .trailing) {
								Button(role: .destructive, action: {
									realManager.deleteTask(id: task.id)
								}, label: {
									Label("Delete", systemImage: "trash")
								}) // butt
							}
					} // if
				} // loop
				.listRowSeparator(.hidden)
			} // list
			.onAppear {
				UITableView.appearance().backgroundColor = UIColor.clear
				UITableViewCell.appearance().backgroundColor = UIColor.clear
			} // onapp
			
			
			
		} // v
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Const.bgColor)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
			.environmentObject(RealmManager())
    }
}
