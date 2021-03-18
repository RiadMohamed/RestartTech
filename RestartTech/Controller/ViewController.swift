//
//  ViewController.swift
//  RestartTech
//
//  Created by Riad Mohamed on 17/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.collectionViewLayout = setupCollectionView()
        }
    }
    
//    var homeSections:[HomeSection] = []
    
    var homeSections: [String:HomeSection] = [:]
    
    func setupUI() {
        searchBarView.layer.cornerRadius = 10
    }
    
    func setupCollectionView() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(150), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        fetchHomeData()
    }
    
//    @IBAction func buttonTapped(_ sender: UIButton) {
//        // Call the webservice
//        populateHome()
//    }
    
    
}


// MARK: - Networking Module of the VC
extension ViewController {
    private func fetchHomeData() {
        guard let homeURL = URL(string: K.homeURL) else {
            fatalError("Could not create the home URL")
        }
        
        let homeResource = Resource<HomeResponse>(url: homeURL)
        
        
        Webservice.shared.load(resource: homeResource) { [weak self] (result) in
            switch result {
            case .success(let homeResponse):
                print("Sucessful API Call")
                guard let safeData = homeResponse.data else {
                    print("Failed to get data from Home Response")
                    return
                }
                
                self!.homeSections["Events"]?.elements = safeData.events
                self!.homeSections["Events"]?.imageString = "events_icon"    // Change this to the image
                
                self!.homeSections["Attractions"]?.elements = safeData.attractions
                self!.homeSections["Attractions"]?.imageString = "attractions_icon"
                
                self!.homeSections["HotSpots"]?.elements = safeData.hotSpots
                self!.homeSections["HotSpots"]?.imageString = "hotspot_icon"
                
            case .failure(.networkingError):
                print("Failed API Call")
            
            case .failure(.JSONParingError):
                print("Failed to parse the response")
            case .failure(.urlParsingError):
                print("Failed to parse the URL")
            }
        }
    }
}


// MARK: - CollectionView Module
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionViewCellIdentifier, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.collectionViewHeaderIdentifier, for: indexPath) as! SectionHeaderView
//        sectionHeaderView.sectionTitleLabel.text =
    }
    
    
}
