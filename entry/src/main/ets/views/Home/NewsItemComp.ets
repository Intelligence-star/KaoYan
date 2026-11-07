import { NewsItem } from '../../models/Index'

@Component
export struct NewsItemComp {
  @Prop newsItem: NewsItem

  private getPriorityText(priority: number): string {
    if (priority === 1) {
      return '重要'
    } else if (priority === 4) {
      return '了解'
    } else {
      return '一般'
    }
  }

  private getPriorityColor(priority: number): Resource {
    if (priority === 1) {
      return $r('app.color.common_main_color')
    } else if (priority === 4) {
      return $r('app.color.common_green')
    } else {
      return $r('app.color.common_blue')
    }
  }

  @Builder
  priorityTag(priority: number) {
    Stack({ alignContent: Alignment.Center }) {
      Text(this.getPriorityText(priority))
        .fontSize(10)
        .fontColor(this.getPriorityColor(priority))
        .height(18)
        .padding({ left: 6, right: 6 })
        .borderRadius(3)
        .backgroundColor(priority === 2 || priority === 3
          ? $r('app.color.common_blue_bg')
          : this.getPriorityColor(priority))
        .opacity(priority === 2 || priority === 3 ? 1 : 0.12)
      Text(this.getPriorityText(priority))
        .fontSize(10)
        .fontColor(this.getPriorityColor(priority))
        .height(18)
        .padding({ left: 6, right: 6 })
    }
    .height(18)
  }

  build() {
    Column() {
      Row() {
        this.priorityTag(this.newsItem.priority)

        Text(this.newsItem.stem)
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.black'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ left: 8 })
          .layoutWeight(1)
      }
      .width('100%')

      Row() {
        Text('点赞 ' + this.newsItem.likeCount)
          .fontSize(12)
          .fontColor($r('app.color.common_gray_01'))
        Column()
          .width(1)
          .height(10)
          .backgroundColor($r('app.color.common_gray_border'))
          .margin({ left: 10, right: 10 })
        Text('浏览 ' + this.newsItem.views)
          .fontSize(12)
          .fontColor($r('app.color.common_gray_01'))
      }
      .width('100%')
      .margin({ top: 8 })
      .alignItems(VerticalAlign.Center)

      Divider()
        .color($r('app.color.common_gray_border'))
        .strokeWidth(1)
        .width('100%')
    }
    .width('100%')
    .padding({ left: 12, right: 12, top: 12, bottom: 12 })
    .backgroundColor(Color.White)
  }
}
