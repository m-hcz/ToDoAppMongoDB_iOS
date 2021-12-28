//
//  ContentView.swift
//  ToDoAppMongoDB
//
//  Created by M H on 28/12/2021.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var realmManager = RealmManager()
	@State private var showAddTaksView: Bool = false
	
    var body: some View {
		ZStack(alignment: .bottomTrailing, content: {
			TaskView()
				.environmentObject(realmManager)
			
			SmallAddButton()
				.padding()
				.onTapGesture {
					showAddTaksView.toggle()
				}
		}) // z
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
			.background(Const.bgColor)
			.sheet(isPresented: $showAddTaksView, onDismiss: nil, content: {
				AddTaskView()
					.environmentObject(realmManager)
			})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
