//
//  UIImageView.swift
//  iOSEvaluation
//
//  Created by Waqas Naseem on 24/09/2023.
//

import SDWebImage

extension UIImageView {
  func setImage(with url: URL?) {
    if let imageURL = url {
      sd_setImage(with: imageURL,
                  placeholderImage: UIImage(named: "placeHolder"),
                  options: [.scaleDownLargeImages], completed: nil)
    } else {
      image = UIImage(named: "placeHolder")
    }
  }
}
