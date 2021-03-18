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
    
    var homeSections:[HomeSection] = []
    let layout = UICollectionViewLayout()
    
    func setupCollectionViewLayout() {
        
    }
    
    
    var defaultData = [
        MySection(name: "Events", imageName: "events_icon", data: ["1", "2", "3"]),
        MySection(name: "Attractions", imageName: "attractions_icon", data: ["4", "5", "6"]),
        MySection(name: "Hot Spots", imageName: "hotspot_icon", data: ["7", "8", "9"])
    ]
    
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
        
        self.collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: K.collectionViewHeaderIdentifier)
//        fetchHomeData()
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
                
                self!.homeSections.append(HomeSection(name: "Events", imageString: "events_icon", elements: safeData.events))
                
                self!.homeSections.append(HomeSection(name: "Attractions", imageString: "attractions_icon", elements: safeData.attractions))
                
                self!.homeSections.append(HomeSection(name: "Hot Spots", imageString: "hotspot_icon", elements: safeData.hotSpots))
                
                self!.collectionView.reloadData()
                
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
        return defaultData[section].data.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return defaultData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionViewCellIdentifier, for: indexPath) as! CollectionViewCell
        
        let section = defaultData[indexPath.section]
        cell.item = section.data[indexPath.item]
        
//        cell.titleLabel.text = homeSections[indexPath.section].elements?[indexPath.row].name
//        cell.subtitleLabel.text = homeSections[indexPath.section].elements?[indexPath.row].desc
//        cell.imageView.image = UIImage(named: "big_header") // Setting the default image as the header image until the image API gets fixed.
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            print("Checkpoint")
            let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.collectionViewHeaderIdentifier, for: indexPath) as! SectionHeaderView
            
    //        let section = homeSections[indexPath.section]
    //        sectionHeaderView.sectionTitleLabel.text = section.name
    //        sectionHeaderView.imageView.image = UIImage(named: section.imageString!)
    //        return sectionHeaderView
            
            sectionHeaderView.homeSection = defaultData[indexPath.section]
            return sectionHeaderView
        }
        else {
            print("FAILLEDD")
            return UICollectionReusableView()
        }
        
        
    }
    
    
}
