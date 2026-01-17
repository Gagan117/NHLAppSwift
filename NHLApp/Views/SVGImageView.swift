//
//  SVGImageView.swift
//  NHLApp
//
//  Created by Gaganvir Bhullar on 2026-01-17.
//

import SwiftUI
import SVGKit

struct SVGImageView: UIViewRepresentable {
    let url: URL
    var width: CGFloat = 60
    var height: CGFloat = 60

    func makeUIView(context: Context) -> SVGKFastImageView {
        // Initialize with a placeholder SVGKImage
        let placeholder = SVGKImage()
        guard let imageView = SVGKFastImageView(svgkImage: placeholder) else {
            // fallback in case optional fails
            return SVGKFastImageView()
        }

        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)

        // Load the remote SVG asynchronously
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let svgImage = SVGKImage(data: data) else { return }
            DispatchQueue.main.async {
                imageView.image = svgImage
                imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
            }
        }.resume()

        return imageView
    }

    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        // No-op, image is updated in makeUIView
    }
}






