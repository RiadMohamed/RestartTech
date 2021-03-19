//
//  ViewController.swift
//  RestartTech
//
//  Created by Riad Mohamed on 17/03/2021.
//

import UIKit
import FanMenu
import Macaw

class ViewController: UIViewController {
    
    @IBOutlet weak var fanMenu: FanMenu!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.collectionViewLayout = setupCollectionView()
        }
    }
    
    var homeSections:[HomeSection] = []
    
    override func viewDidAppear(_ animated: Bool) {
        if let tabBarController = self.tabBarController {
            // Add the fanMenu as a child to the TabBar so it can be on top the TabBar view.
            tabBarController.view.addSubview(fanMenu)
        }
    }
    
    func setupFanMenu() {
        // Create the Main Button
        fanMenu.button = FanMenuButton(
            id: "main",
            image: UIImage(named: "bellman_bottom-icon"),
            color: Color(val: 0x7c93fe)
        )
        
        // Create the items buttons
        fanMenu.items = [
            FanMenuButton(id: "hotspots", image: UIImage(named: "hotspot_icon"), color: Color(val: 0xFFFFFF), title: "Hotspots", titleColor: Color(val: 0x0), titlePosition: .bottom),
            FanMenuButton(id: "events", image: UIImage(named: "events_icon"), color: Color(val: 0xFFFFFF), title: "Events", titleColor: Color(val: 0x0), titlePosition: .bottom),
            FanMenuButton(id: "attractions", image: UIImage(named: "attarctions_icon"), color: Color(val: 0xFFFFFF), title: "Attractions", titleColor: Color(val: 0x0), titlePosition: .bottom),
            FanMenuButton(id: "map", image: UIImage(named: "small_grey_location_pin"), color: Color(val: 0xFFFFFF), title: "Map", titleColor: Color(val: 0x0), titlePosition: .bottom)
        ]
        
        // Style the fanMenu
        fanMenu.menuRadius = 90.0
        fanMenu.duration = 0.2
        fanMenu.delay = 0.05
        fanMenu.interval = (Double.pi, 2 * Double.pi)
        fanMenu.menuBackground = .clear
        fanMenu.backgroundColor = .clear
        
        // Handlers for the fanMenu events
        fanMenu.onItemWillClick = {button in
            print("Item \(button.id) Will Click")
        }
        
        fanMenu.onItemDidClick = {button in
            print("Item \(button.id) Did Click")
        }
    }
    
   // Default data for testing purposes of the collectionView
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
        // Setup the main components of the Hoem Screen
        setupUI()
        
        // Setup the Fan Menu
        setupFanMenu()
        
        // Register the custom section class of the CollectionView Section
        self.collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: K.collectionViewHeaderIdentifier)
        fetchHomeData()
    }
}


// MARK: - Networking Module of the VC
extension ViewController {
    private func fetchHomeData() {
        // Setup the base URL
        guard let homeURL = URL(string: K.homeURL) else {
            fatalError("Could not create the home URL")
        }
        
        // Setup the local Resource
        let homeResource = Resource<HomeResponse>(url: homeURL)
        
        // Call the webservice and pass the resource to initiate the request
        Webservice.shared.load(resource: homeResource) { [weak self] (result) in
            switch result {
            // Response received and parsed.
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
