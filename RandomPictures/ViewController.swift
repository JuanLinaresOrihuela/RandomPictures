//
//  ViewController.swift
//  RandomPictures
//
//  Created by Juan Linares on 7/18/23.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    } ()
    
    
    private let button: UIButton = {
        let button = UIButton ()
        button.backgroundColor = .clear
        button.setTitle("Tap Here", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    } ()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 400)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPictures()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPictures()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom, width: view.frame.size.width - 60, height: 55)

        getRandomPictures()
    }
    
    func getRandomPictures() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string:urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image =  UIImage(data: data)
        
    }


}

