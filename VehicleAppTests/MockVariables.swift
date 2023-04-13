//
//  MockVariables.swift
//  VehicleAppTests
//
//  Created by Mine Rala on 12.04.2023.
//

@testable import VehicleApp

struct MockVariables {
    
    static let vehicleList = [
        Vehicle(id: 7333920,
                title: "VW BEETLE 14 TSİ RLİNE",
                location: Location(cityName: "Adana", townName: "Seyhan"),
                price: 350000,
                photo: "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg"),
        Vehicle(id: 16253376,
                title: "ORJINAL  MUAYENE SIFIR",
                location: Location(cityName: "İstanbul", townName: "Ümraniye"),
                price: 163000,
                photo: "https://arbstorage.mncdn.com/ilanfotograflari/2020/12/23/16253376/8bef8606-dec3-47c1-9d53-a1862b110e9f_image_for_silan_16253376_{0}.jpg")
    ]
    
    static let mockDetailResult = VehicleDetailResult(
        id: 7333920,
        title: "VW BEETLE 14 TSİ RLİNE",
        location: Location(cityName: "Adana", townName: "Seyhan"),
        category: Category(id: 12799, name: "otomobil/volkswagen-new-beetle-1-4-tsi-design"),
        modelName:  "Beetle 1.4 TSI Design DSG",
        price: 350000,
        dateFormatted: "30 Kasım 2020",
        photos: [
            "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg",
            "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/e99a0838-3f70-464c-86d6-cfee827fa5ad_image_for_silan_7333920_{0}.jpg"
        ],
        properties: [
            Property(name: "km", value: "23000"),
            Property(name: "color", value: "Kırmızı"),
            Property(name: "year", value: "2013"),
            Property(name: "gear", value: "Yarı Otomatik"),
            Property(name: "fuel", value: "Benzin")
        ],
        text: "ARACIMIZ İLK ELDEN OLUP DARBE DEGİSEN BOYA&nbsp; HASARKAYDİ YOKTUR İC DİS RLİNE PAKET OLUP EMSALSİZ TEMİZLİKTE VE 23000 KMDEDİR DETAYLİBİLGİ İCİN ARAYİNİZ&nbsp;",
        userInfo: UserInfo(nameSurname: "Sonia Norris", phone: "9009315760")
    )
    
    static let mockPhotoList = [
        "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/641e33f6-541f-40f3-8ba3-42960e563078_image_for_silan_7333920_{0}.jpg",
        "https://arbstorage.mncdn.com/ilanfotograflari/2017/08/03/7333920/e99a0838-3f70-464c-86d6-cfee827fa5ad_image_for_silan_7333920_{0}.jpg"
    ]
    
    static let mockTableItemList = [
        Property(name: "Fiyat", value: "350000"),
        Property(name: "İlan Tarihi", value: "30 Kasım 2020"),
        Property(name: "İlan No", value: "7333920"),
        Property(name: "Model", value: "Beetle 1.4 TSI Design DSG"),
        Property(name: "Km", value: "23000"),
        Property(name: "Renk", value: "Kırmızı"),
        Property(name: "Yıl", value: "2013"),
        Property(name: "Vites", value: "Yarı Otomatik"),
        Property(name: "Yakıt", value: "Benzin")
    ]
    
    static var sortList: [SortType] = [
        .zero,
        .priceAscending,
        .priceDescending,
        .dateAscending,
        .dateDescending,
        .yearAscending,
        .yearDescending
    ]
    
    static var emptySortList: [SortType] = []
    
    static let sortItem: SortType = .zero
    
    static let isPresentingVC = false
    
    static let isSortButtonTapped = false
    
    static let skipNumber = 0
    
    static let differentSkipNumer = 1
}
