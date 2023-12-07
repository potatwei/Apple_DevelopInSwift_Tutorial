//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Shihang Wei on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var savedNames: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List{
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        if !names.contains(nameToAdd){
                            names.append(nameToAdd.trimmingCharacters(in: .whitespaces))
                            nameToAdd = ""
                        }
                    }
                }
            
            Toggle("Remove picked names", isOn: $shouldRemovePickedName)
            
            HStack {
                Button  {
                    savedNames = names
                    names = []
                } label: {
                    Text("Save List")
                        .frame(width: 92, height: 30)
                        .font(.title3)
                }
                .buttonStyle(.borderedProminent)
                .padding(.trailing, 3)
                
                Button  {
                    names = savedNames
                    savedNames = []
                } label: {
                    Text("Add List")
                        .frame(width: 92, height: 30)
                        .font(.title3)
                }
                .buttonStyle(.borderedProminent)
            }
            
            Button {
                if names.count > 0 {
                    pickedName = names.randomElement()!
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == pickedName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .frame(width: 220, height: 40)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
