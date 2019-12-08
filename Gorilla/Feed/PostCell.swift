//
//  PostCell.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {

  static let reuseId = "PostCellReuseId"

  let rootView = UIView()
  let titleLabel = UILabel()
  let dateLabel = UILabel()
  let postLabel = UITextView()
  let dateFormatter = DateFormatter()

  override init(frame: CGRect) {
    super.init(frame: frame)

    dateFormatter.dateFormat = "MM/dd/yyyy"

    rootView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    titleLabel.frame = CGRect(x: 20, y: 20,  width: UIScreen.main.bounds.width - 40, height: 20)
    dateLabel.frame = CGRect(x: 20, y: 48, width: UIScreen.main.bounds.width - 40, height: 20)
    postLabel.frame = CGRect(x: 16, y: 70, width: UIScreen.main.bounds.width - 40, height: 100)

    titleLabel.font = AppFonts.Heading3.medium
    dateLabel.font = AppFonts.Heading5.light
    postLabel.font = AppFonts.Heading3.regular

    titleLabel.textColor = .black
    dateLabel.textColor = .gray
    postLabel.textColor = .darkGray

    rootView.addSubview(titleLabel)
    rootView.addSubview(dateLabel)
    rootView.addSubview(postLabel)

    addSubview(rootView)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /**
   - Description: Reset and prepare the data to reuse the cell view.
   */
  override func prepareForReuse() {
    super.prepareForReuse()

    titleLabel.text = ""
    dateLabel.text = ""
    postLabel.text = ""
  }

  func configure(post: Post) {
    let dateInterval = Date(timeIntervalSince1970: (Double(post.unix_timestamp))!)
    let date = dateFormatter.string(from: dateInterval)

    titleLabel.text = "\(post.first_name) \(post.last_name)"
    dateLabel.text = "\(date)"
    postLabel.text = post.post_body
  }
    
}
