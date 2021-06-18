//
//  ContentView.swift
//  Watch-Notes WatchKit Extension
//
//  Created by jigar dave on 14/06/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:-  PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text : String = ""
    
    
    // MARK:- FUNCTION
    
    func getDecomentaryDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return path[0]
        
    }
    func save(){
        //        dump(notes)
        do{
            let data = try JSONEncoder() .encode(notes)
            
            let url = getDecomentaryDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
        }
        catch{
            print("Saving data has failed!")
        }
        
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDecomentaryDirectory().appendingPathComponent("notes")
                
                let data = try Data(contentsOf: url)
                
                notes  = try JSONDecoder().decode([Note].self, from: data)}
            
            catch{
                
            }
        }
        
    }
    
    func delete(offsets: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
        
    }
    
    
    
    // MARK:- BODY
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6)
            {
                TextField("Add new Note", text: $text)
                Button {
                    //action
                    
                    guard text.isEmpty == false else{return}
                    
                    let note = Note (id: UUID(), text:text)
                    
                    notes.append(note)
                    
                    text = ""
                    
                    save()
                    
                }
                
                label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .thin))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                //                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                
                
                
            }//hstack
            Spacer()
            
            if notes.count >= 1 {
                List {
                    ForEach (0..<notes.count, id:\.self)
                    {i in NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index:  i)) {
                        HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(1)
                                    .padding(.leading, 5)
                                
                        }
                    }//hstack
                    }//loop
                    .onDelete(perform: delete)
                    
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }//list
        }//vstack
        .navigationTitle("Notes")
        .onAppear(perform: {load()
        })
        
    }
}


// MARK:- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
