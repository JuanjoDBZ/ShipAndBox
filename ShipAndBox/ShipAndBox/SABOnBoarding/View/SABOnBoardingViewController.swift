//  SABOnBoardingViewController.swift
//  ShipAndBox
//  Created by IsitaFS003 on 02/09/21.
import UIKit
class SABOnBoardingViewController: UIViewController, UIScrollViewDelegate {
    /// Objeto CollectionView.
    @IBOutlet weak var collectionViewOnboarding: UICollectionView!
    /// Objeto PageControl.
    @IBOutlet weak var pageControl: UIPageControl!
    /// Método que se llama una vez que se ha cargado la vista.
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    /// Método para la creacion del CollectionView y declaracion de las celdas a mostrar.
    func setUpCollectionView() {
        collectionViewOnboarding.dataSource = self
        collectionViewOnboarding.delegate = self
        self.collectionViewOnboarding.register(UINib(nibName: "SABOnBoardingPackagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SABOnBoardingPackagesCollectionViewCell")
        self.collectionViewOnboarding.register(UINib(nibName: "SABOnBoardingAdministrationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SABOnBoardingAdministrationCollectionViewCell")
        self.collectionViewOnboarding.register(UINib(nibName: "SABOnBoardingCoOwnerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SABOnBoardingCoOwnerCollectionViewCell")
        pageControl.hidesForSinglePage = true
        collectionViewOnboarding.reloadData()
    }
}
extension SABOnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    /// Devuelva el número de secciones en la vista.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    /// - Returns: El número de secciones.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = 3
        pageControl.numberOfPages = count
        return count
    }
    /// Pregunta a su objeto de fuente de datos la cantidad de elementos en la sección especificada.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - section: Un número de índice que identifica una sección en.
    /// - Returns: El número de elementos en la sección.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    ///  Este método es responsable de crear, configurar y devolver la celda apropiada para el elemento dado.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - indexPath: La ruta del índice que especifica la ubicación del elemento.
    /// - Returns: Un objeto de celda configurado.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        if section == 0 {
            let cellCoOwner = collectionView.dequeueReusableCell(withReuseIdentifier:"SABOnBoardingCoOwnerCollectionViewCell", for: indexPath)
            return cellCoOwner
        }
        if section == 1 {
            let cellCoOwner = collectionView.dequeueReusableCell(withReuseIdentifier:"SABOnBoardingAdministrationCollectionViewCell", for: indexPath)
            return cellCoOwner
        }
            let cellPackages = collectionView.dequeueReusableCell(withReuseIdentifier:"SABOnBoardingPackagesCollectionViewCell", for: indexPath)
            return cellPackages
    }
    /// Le dice al delegado que la celda especificada está a punto de mostrarse en la vista de colección.
    /// - Parameters:
    ///   - collectionView: La vista de la colección que solicita esta información.
    ///   - cell: El objeto de celda que se agrega.
    ///   - indexPath: La ruta de índice del elemento de datos que representa la celda.
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        thisWidth = CGFloat(self.frame.width)
//        return CGSize(width: thisWidth, height: self.frame.height)
//    }
}
