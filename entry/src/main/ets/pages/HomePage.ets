import { NewsItem } from '../models/Index'
import { jsonNewsItem1, jsonNewsItem2, jsonNewsItem3, jsonNewsItem4, jsonNewsItem5 } from '../testdata/index'
import { NewsItemComp } from '../views/Home/NewsItemComp'

@Component
export struct HomePage {
  @State newsList: NewsItem[] = []

  aboutToAppear(): void {
    this.newsList.push(JSON.parse(jsonNewsItem1) as NewsItem)
    this.newsList.push(JSON.parse(jsonNewsItem2) as NewsItem)
    this.newsList.push(JSON.parse(jsonNewsItem3) as NewsItem)
    this.newsList.push(JSON.parse(jsonNewsItem4) as NewsItem)
    this.newsList.push(JSON.parse(jsonNewsItem5) as NewsItem)
  }

  build() {
    Column() {
      // 顶部搜索区（本任务为静态搜索栏，不实现搜索逻辑，不使用 TextInput）
      Row() {
        Image($r('app.media.ic_home_scan'))
          .width(22)
          .height(22)

        Row() {
          Image($r('app.media.ic_common_search'))
            .width(16)
            .height(16)
          Text('搜索题目')
            .fontSize(13)
            .fontColor($r('app.color.common_gray_01'))
            .margin({ left: 6 })
        }
        .layoutWeight(1)
        .height(36)
        .borderRadius(18)
        .backgroundColor($r('app.color.home_gray'))
        .margin({ left: 10 })
        .padding({ left: 12, right: 12 })
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .height(48)
      .padding({ top: 6, bottom: 6 })
      .alignItems(VerticalAlign.Center)

      Swiper() {
        Image($r('app.media.banner_1'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
        Image($r('app.media.banner_2'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
        Image($r('app.media.banner_3'))
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
      }
      .height(150)
      .borderRadius(8)
      .clip(true)
      .margin({ top: 10 })
      .autoPlay(true)
      .interval(3000)
      .loop(true)
      .indicator(Indicator.dot()
        .itemWidth(6)
        .itemHeight(6)
        .color($r('app.color.common_gray_border'))
        .selectedItemWidth(12)
        .selectedItemHeight(6)
        .selectedColor($r('app.color.common_blue')))

      List({ space: 0 }) {
        ForEach(this.newsList, (item: NewsItem) => {
          ListItem() {
            NewsItemComp({ newsItem: item })
          }
        }, (item: NewsItem) => item.id)
      }
      .layoutWeight(1)
      .width('100%')
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12 })
    .backgroundColor(Color.White)
  }
}
