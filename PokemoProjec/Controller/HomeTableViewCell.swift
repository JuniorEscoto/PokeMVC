//
//  HomeTableViewCell.swift
//  PokemoProjec
//
//  Created by user922809 on 6/2/20.
//  Copyright © 2020 user922809. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imgPoke: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate var indicator:UIActivityIndicatorView!
    
    func awakeFromNib(_ id: Int, name: String, pokeImageUrl: String) {
      super.awakeFromNib()
      setupUI(id, name: name)
      setupNotification(pokeImageUrl)
    }
    
    deinit {
      imgPoke.removeObserver(self, forKeyPath: "image")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func setupUI(_ id: Int, name: String) {
      idLabel.text = NSString(format: "#%03d", id) as String
      labelName.text = name
      imgPoke.image = UIImage(named: "default_img")
      
      indicator = UIActivityIndicatorView()
      indicator.center = CGPoint(x: imgPoke.bounds.midX, y: imgPoke.bounds.midY)
      indicator.style = .large
      indicator.startAnimating()
      imgPoke.addSubview(indicator)
      
      imgPoke.addObserver(self, forKeyPath: "image", options: [], context: nil)
    }
    
    fileprivate func setupNotification(_ pokeImageUrl: String) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: downloadImageNotification), object: self, userInfo: ["imgPoke":imgPoke as Any, "pokeImageUrl" : pokeImageUrl])
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      if keyPath == "image" {
        indicator.stopAnimating()
      }
    }
    
}
