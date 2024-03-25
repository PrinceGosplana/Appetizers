//
//  AccountView.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

import SwiftUI

struct AccountView: View {

    @State private var firstName = ""
    @State private var lasttName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lasttName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: .date)

                    Button {

                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }

                Section {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills", isOn: $frequentRefills)
                } header: {
                    Text("Requests")
                }
                .tint(.braindPrimary)

            }

                .navigationTitle("🥗 Account")
        }
    }
}

#Preview {
    AccountView()
}
