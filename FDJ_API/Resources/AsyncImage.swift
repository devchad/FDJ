//
//  AsyncImage.swift
//  FDJ_API
//
//  Created by ghulam  on 30/08/2023.
//

import Foundation
import UIKit
import SwiftUI

class AsyncImageService {
    func getImage(with url: String) async -> UIImage? {
        guard let url = URL(string: url) else {
            return nil
        }
        do {
            return try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                            let image = UIImage(data: data)
                            continuation.resume(returning: image)
                    }
                }.resume()
            }
        } catch {
            return nil
        }
    }
}

struct AsyncImage: View {
    
    private var url: String
    @State var image: UIImage?
    @State private var isLoaded: Bool = false
    init(url: String) {
        self.url = url
    }
    var body: some View {
        if let image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Spacer().onAppear {
                if isLoaded == false {
                    Task {
                        let image = await AsyncImageService().getImage(with: url)
                        await MainActor.run {
                            self.isLoaded = true
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
        static var previews: some View {
            AsyncImage(url: "https://www.thesportsdb.com//images//media//team//badge//rwqrrq1473504808.png")
        }
}
