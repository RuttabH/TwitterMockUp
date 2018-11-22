//
//  HomeDataSourceController.swift
//  TwitterMockUp
//
//  Created by TAMUR on 08/11/2018.
//  Copyright © 2018 taimoor.com. All rights reserved.
//

import UIKit
import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {
    
    //MARK: VC LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        // Checking commits
        //testing
        
        self.collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setUpNavigationBarItems()

        Service.sharedInstance.fetchHomeFeed { (homeDataSource) in
            self.datasource = homeDataSource
        }
        
        //fetchHomeFeed()
    }
    
    
    //MARK: FUNCTIONS
    private func  setUpNavigationBarItems() {
        setupRightNavItems()
        setupRemainingNavItems()
        setupLeftNavItems()
    }
    
    
    //MARK: COLLECTIONVIEW FUNC
    
    // This function handles screen rotation( its expand the copllectionview according to the screen)
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout() //This functions relayout the collectionview(change width height position based on screen size
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.size.width, height: 64)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            print(user)
            
            
            //Lets get an estimation of the height of our cell based on user.bioText
            
            //Approix width is calculated by subtracting the profile imageview left padding,profile image view width and the padding bwteen the profileimageview and biotext with the cell width
            let approximateWidthOfUserBiotextView = view.frame.width - 12 - 50 - 12 - 2
            
            //Random value of 1000 is given to height
            let size = CGSize(width: approximateWidthOfUserBiotextView,height: 1000)
            
            //In UserCell.swift we declared and intialized bioTextView with a font size of 15 thus we have to do it here as well
            let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            let estimateFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
            
            //66 is added to height because of the padding of name and username. example 20(padding of username) + 20(padding of name) + 12 padding fpr textview itself = 52
            //textview inheritedly needs more height when you estimates its height thus 14 was added to 52
            return CGSize(width: view.frame.width, height: estimateFrame.height + 66)
        }

        
        return CGSize(width: view.frame.size.width, height: 150)
    }
}
