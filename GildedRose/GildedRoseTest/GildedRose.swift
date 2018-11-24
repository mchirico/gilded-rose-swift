public class GildedRose {
  
  static func normal(items: Array<Item>,i: Int) -> [Item] {
    var items = items
    
    items[i].sellIn = items[i].sellIn - 1
    if  items[i].quality <= 0 {
      return items
    }
    
    items[i].quality = items[i].quality - 1
    if items[i].name == "Wirt's Third Leg" {
      if i+1 < items.count {
        let j = i + 1
        if items[j].name == "Drakefire Amulet" {
          items[j].sellIn = items[j].sellIn - 1
          items[j].quality = items[j].quality - 1
          return items
        }
      }
      
    }
    
    if items[i].name == "Periapt of Vitality" {
      items[i].quality = items[i].quality - 1
      return items
    }
    
    if items[i].name == "Skull of Gul'dan" {
      items[i].quality = items[i].quality - 1
      return items
    }

    return items
  }
  
  
  public static func updateQuality(items: Array<Item>) -> [Item] {
    var items = items
    
    for i in 0 ..< items.count {
      
      // Check normal
      let normalList = ["+5 Dexterity Vest","Wirt's Third Leg",
                    "Periapt of Vitality","Skull of Gul'dan",
                    "Khadgar's Whisker"]
      if normalList.contains(items[i].name)   {
        return normal(items: items,i: i)
      }
      
      
      if items[i].name == "Sulfuras, Hand of Ragnaros" {
        return items
      }
      
      if items[i].name == "Conjured Mana Cake" && items[i].quality > 0 {
         items[i].quality = items[i].quality - 1
        // return items
      }
      
      if items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert" {

        print(".........................quality: \(items[i].quality)")
         print("**********************  items: \(items[i].name)")
        if items[i].quality > 0 {
          if items[i].name != "Sulfuras, Hand of Ragnaros" {
            items[i].quality = items[i].quality - 1
            print(".........................items: \(items[i].name)")
          }
        }
      } else {
        if items[i].quality < 50 {
          items[i].quality = items[i].quality + 1
          
          if items[i].name == "Backstage passes to a TAFKAL80ETC concert" {
            if items[i].sellIn < 11 {
              if items[i].quality < 50 {
                items[i].quality = items[i].quality + 1
              }
            }
            
            if items[i].sellIn < 6 {
              if items[i].quality < 50 {
                items[i].quality = items[i].quality + 1
              }
            }
          }
        }
      }
      
      if items[i].name != "Sulfuras, Hand of Ragnaros" {
        items[i].sellIn = items[i].sellIn - 1
      }
      
      if items[i].sellIn < 0 {
        if items[i].name != "Aged Brie" {
          if items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
            if items[i].quality > 0 {
              if items[i].name != "Sulfuras, Hand of Ragnaros" {
                items[i].quality = items[i].quality - 1
              }
            }
          } else {
            items[i].quality = items[i].quality - items[i].quality
          }
        } else {
          if items[i].quality < 50 {
            items[i].quality = items[i].quality + 1
          }
        }
      }
    }
    
    return items
  }
  
}


