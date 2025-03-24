//
//  MainContentView.swift
//  TestTaskFaifly
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import SwiftUI
import Alamofire

struct MainContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("123456") {
                AF.request("https://reqres.in/api/users?page={1}")
                    .validate()
                    .validate(contentType: ["application/json"])
                    .responseString { response in
                        switch response.result {
                        case .success:
                            print(response.result)
                        case let .failure(error):
                            print(error)
                        }
                    }
            }
        }
        .padding()
    }
}
