//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by Neil Smyth on 7/28/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var name: String = ""
    @State var quantity: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Product.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button("Add") {
                        addProduct()
                    }
                    Spacer()
                    NavigationLink(destination: ResultsView(name: name,
                                           viewContext: viewContext)) {
                        Text("Find")
                    }
                    Spacer()
                    Button("Clear") {
                        name = ""
                        quantity = ""
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not found")
                            Spacer()
                            Text(product.quantity ?? "Not found")
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                .navigationTitle("Product Database")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
    }

    private func addProduct() {
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            
            saveContext()
        }
    }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { products[$0] }.forEach(viewContext.delete)
                saveContext()
            }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

struct ResultsView: View {
    
    var name: String
    var viewContext: NSManagedObjectContext
    @State var matches: [Product]?

    var body: some View {
       
        return VStack {
            List {
                ForEach(matches ?? []) { match in
                    HStack {
                        Text(match.name ?? "Not found")
                        Spacer()
                        Text(match.quantity ?? "Not found")
                    }
                }
            }
            .navigationTitle("Results")
        }
        .task {
                let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
                
                fetchRequest.entity = Product.entity()
                fetchRequest.predicate = NSPredicate(
                    format: "name CONTAINS %@", name
                )
                matches = try? viewContext.fetch(fetchRequest)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
