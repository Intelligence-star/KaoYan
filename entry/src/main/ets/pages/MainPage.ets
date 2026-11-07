import { HomePage } from './HomePage'
import { QuestionPage } from './QuestionPage'
import { MinePage } from './MinePage'

interface TabData {
  title: string
  normalIcon: Resource
  selectedIcon: Resource
}

const tabDataList: TabData[] = [
  { title: '首页', normalIcon: $r('app.media.tabbar_home'), selectedIcon: $r('app.media.tabbar_home_fill') },
  { title: '研经', normalIcon: $r('app.media.tabbar_kaoyan'), selectedIcon: $r('app.media.tabbar_kaoyan_fill') },
  { title: '我的', normalIcon: $r('app.media.tabbar_mine'), selectedIcon: $r('app.media.tabbar_mine_fill') }
]

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0

  @Builder
  tabItem(item: TabData, index: number) {
    Column() {
      Image(this.currentIndex === index ? item.selectedIcon : item.normalIcon)
        .width(24)
        .height(24)
      Text(item.title)
        .fontSize(10)
        .margin({ top: 4 })
        .fontColor(this.currentIndex === index
          ? $r('app.color.black')
          : $r('app.color.common_gray_01'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
      ForEach(tabDataList, (item: TabData, index: number) => {
        TabContent() {
          if (index === 0) {
            HomePage()
          } else if (index === 1) {
            QuestionPage()
          } else {
            MinePage()
          }
        }
        .tabBar(this.tabItem(item, index))
      }, (item: TabData) => item.title)
    }
    .width('100%')
    .height('100%')
    .barHeight(56)
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}
