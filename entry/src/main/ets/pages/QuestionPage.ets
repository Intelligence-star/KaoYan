import { QuestionItem } from '../models/Index'
import { jsonQuestionItem1, jsonQuestionItem2, jsonQuestionItem3, jsonQuestionItem4, jsonQuestionItem5 } from '../testdata/index'
import { QuestionItemComp } from '../views/Question/QuestionItemComp'

// 页面本地展示数据
interface UniversityItem {
  name: string
  icon: Resource
  hotIndex: string
}

const universityList: UniversityItem[] = [
  { name: '北京大学', icon: $r('app.media.ic_university_pku'), hotIndex: '3.5k' },
  { name: '清华大学', icon: $r('app.media.ic_university_thu'), hotIndex: '3.6k' },
  { name: '天津大学', icon: $r('app.media.ic_university_tj'), hotIndex: '3.2k' },
  { name: '南开大学', icon: $r('app.media.ic_university_nk'), hotIndex: '3.1k' },
  { name: '湖北大学', icon: $r('app.media.ic_university_hb'), hotIndex: '2.9k' }
]

@Component
export struct QuestionPage {
  @State questionList: QuestionItem[] = []

  aboutToAppear(): void {
    this.questionList.push(JSON.parse(jsonQuestionItem1) as QuestionItem)
    this.questionList.push(JSON.parse(jsonQuestionItem2) as QuestionItem)
    this.questionList.push(JSON.parse(jsonQuestionItem3) as QuestionItem)
    this.questionList.push(JSON.parse(jsonQuestionItem4) as QuestionItem)
    this.questionList.push(JSON.parse(jsonQuestionItem5) as QuestionItem)
  }

  build() {
    Column() {
      // 头部搜索区（静态搜索栏，不实现搜索逻辑）
      Row() {
        Image($r('app.media.ic_kaoyan_text'))
          .height(24)
          .objectFit(ImageFit.Contain)

        Row() {
          Image($r('app.media.ic_common_search'))
            .width(16)
            .height(16)
          Text('请输入关键字')
            .fontSize(13)
            .fontColor($r('app.color.common_gray_01'))
            .margin({ left: 6 })
        }
        .layoutWeight(1)
        .height(36)
        .borderRadius(18)
        .backgroundColor($r('app.color.home_gray'))
        .margin({ left: 12 })
        .padding({ left: 12, right: 12 })
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .height(48)
      .padding({ left: 12, right: 12 })
      .alignItems(VerticalAlign.Center)

      List() {
        ForEach(universityList, (uni: UniversityItem) => {
          ListItem() {
            Column() {
              Image(uni.icon)
                .width(44)
                .height(44)
                .borderRadius(22)
                .objectFit(ImageFit.Cover)

              Row() {
                Text('热门指数')
                  .fontSize(11)
                  .fontColor($r('app.color.common_gray_01'))
                Text(uni.hotIndex)
                  .fontSize(11)
                  .fontColor($r('app.color.common_green'))
                  .margin({ left: 4 })
              }
              .margin({ top: 8 })

              Button('查看')
                .height(28)
                .fontSize(12)
                .margin({ top: 8 })
                .backgroundColor(Color.White)
                .fontColor($r('app.color.common_gray_03'))
                .border({ width: 1, color: $r('app.color.common_gray_border') })
                .borderRadius(4)
            }
            .width(110)
            .height(130)
            .padding(10)
            .justifyContent(FlexAlign.Center)
            .backgroundColor(Color.White)
            .borderRadius(8)
            .border({ width: 1, color: $r('app.color.common_gray_border') })
          }
          .margin({ left: 12, right: 4 })
        }, (uni: UniversityItem) => uni.name)
      }
      .listDirection(Axis.Horizontal)
      .width('100%')
      .height(140)
      .edgeEffect(EdgeEffect.Spring)
      .margin({ top: 10 })

      List({ space: 0 }) {
        ForEach(this.questionList, (item: QuestionItem) => {
          ListItem() {
            QuestionItemComp({ questionItem: item })
          }
        }, (item: QuestionItem) => item.id)
      }
      .layoutWeight(1)
      .width('100%')
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}
