//
//  FeedViewController.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var createPostButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var mindButton: UIButton!

  let dateFormatter = DateFormatter()

  var posts = [Post]()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let GorillaAPI = API.init(URL: "https://gl-endpoint.herokuapp.com/feed")

    GorillaAPI.getPage { (posts) in
      self.posts = []
      self.posts = posts

      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }

    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let date = Date()
    dateFormatter.dateFormat = "EEEE, MMM d"
    let dateString = dateFormatter.string(from: date)

    dateLabel.text = dateString

    collectionView.delegate = self
    collectionView.dataSource = self

    collectionView.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)

    let image: UIImage = UIImage(named: "Favicon")!
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.image = image
    navigationBar?.topItem?.titleView = imageView
    navigationBar?.backgroundColor = AppColors.primaryColor

    createPostButton.addTarget(
      self,
      action: #selector(createPostButtonTouched),
      for: .touchUpInside
    )

    mindButton.addTarget(
      self,
      action: #selector(createPostButtonTouched),
      for: .touchUpInside
    )
  }

  @objc func createPostButtonTouched() {
    performSegue(withIdentifier: AppSegues.FeedToCreatePost, sender: nil)
  }

}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let postCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: PostCell.reuseId,
      for: indexPath) as? PostCell

    let post = posts[indexPath.item]

    postCell!.configure(post: post)

    return postCell!
  }

  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
    return posts.count
  }

}
