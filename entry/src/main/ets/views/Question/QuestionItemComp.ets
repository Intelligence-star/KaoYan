import { QuestionItem } from '../../models/Index'

@Component
export struct QuestionItemComp {
  @Prop questionItem: QuestionItem

  build() {
    Column() {
      Row() {
        Image(this.questionItem.creatorAvatar)
          .width(36)
          .height(36)
          .borderRadius(6)
          .objectFit(ImageFit.Cover)

        Text(this.questionItem.stem)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.black'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ left: 8 })
          .layoutWeight(1)

        Image($r('app.media.ic_kaoyan_more'))
          .width(20)
          .height(20)
          .margin({ left: 8 })
      }
      .width('100%')

      Text(this.questionItem.creatorName + ' · ' + this.questionItem.createdAt)
        .fontSize(11)
        .fontColor($r('app.color.common_gray_01'))
        .margin({ top: 6 })

      Text(this.questionItem.content)
        .fontSize(13)
        .fontColor($r('app.color.common_gray_03'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 8 })

      Row() {
        Text('点赞 ' + this.questionItem.likeCount)
          .fontSize(12)
          .fontColor($r('app.color.common_gray_01'))
        Text(' · ')
          .fontSize(12)
          .fontColor($r('app.color.common_gray_01'))
        Text('浏览 ' + this.questionItem.views)
          .fontSize(12)
          .fontColor($r('app.color.common_gray_01'))
      }
      .width('100%')
      .margin({ top: 8 })

      Divider()
        .color($r('app.color.common_gray_border'))
        .strokeWidth(1)
        .width('100%')
    }
    .width('100%')
    .padding({ left: 12, right: 12, top: 12, bottom: 12 })
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White)
  }
}
