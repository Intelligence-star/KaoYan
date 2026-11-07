import router from '@ohos.router'
import { User } from '../models/Index'

// 页面本地展示数据
interface EntryItem {
  title: string
  icon: Resource
}

const entryList: EntryItem[] = [
  { title: '历史记录', icon: $r('app.media.ic_mine_history') },
  { title: '我的收藏', icon: $r('app.media.ic_mine_collect') },
  { title: '我的点赞', icon: $r('app.media.ic_mine_like') },
  { title: '累计学时', icon: $r('app.media.ic_mine_study') }
]

interface ToolItem {
  title: string
  icon: Resource
}

const toolList: ToolItem[] = [
  { title: '开发常用单词', icon: $r('app.media.ic_mine_notes') },
  { title: '意见反馈', icon: $r('app.media.ic_mine_file') },
  { title: '关于我们', icon: $r('app.media.ic_mine_info') },
  { title: '设置', icon: $r('app.media.ic_mine_setting') }
]

@Component
export struct MinePage {
  @StorageProp('user') userStr: string = ''

  private getUser(): User {
    if (this.userStr === '') {
      return { id: '', username: '', password: '', avatar: '', token: '' }
    }
    return JSON.parse(this.userStr) as User
  }

  private getAvatar(): ResourceStr {
    if (this.userStr === '') {
      return $r('app.media.ic_mine_avatar')
    }
    return this.getUser().avatar
  }

  logout(): void {
    AppStorage.delete('user')
    if (router.getLength() !== '1') {
      router.back()
    } else {
      // 降级：页面栈中仅当前页（无上一页）时 back 无法返回，直接 replaceUrl 到登录页
      router.replaceUrl({ url: 'pages/Index' })
    }
  }

  @Builder
  toolRow(item: ToolItem, isLast: boolean) {
    Column() {
      Row() {
        Image(item.icon)
          .width(20)
          .height(20)
        Text(item.title)
          .fontSize(14)
          .fontColor($r('app.color.black'))
          .margin({ left: 10 })
          .layoutWeight(1)
        Image($r('app.media.ic_public_detail'))
          .width(16)
          .height(16)
      }
      .width('100%')
      .height(52)
      .padding({ left: 14, right: 14 })
      .onClick(() => {
        // 本任务不实现跳转
      })

      if (!isLast) {
        Divider()
          .color($r('app.color.common_gray_border'))
          .strokeWidth(1)
          .margin({ left: 44 })
      }
    }
    .width('100%')
  }

  build() {
    Column() {
      Column() {
        Row() {
          Image(this.getAvatar())
            .width(64)
            .height(64)
            .borderRadius(32)
            .objectFit(ImageFit.Cover)
            .border({ width: 2, color: Color.White })

          Column() {
            Text(this.getUser().nickName ?? '未登录')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.black'))

            Row() {
              Image($r('app.media.ic_mine_edit'))
                .width(14)
                .height(14)
              Text('编辑信息')
                .fontSize(12)
                .fontColor($r('app.color.common_gray_03'))
                .margin({ left: 4 })
            }
            .margin({ top: 6 })
          }
          .margin({ left: 14 })
        }
        .alignItems(VerticalAlign.Top)
      }
      .width('100%')
      .height(200)
      .padding({ left: 20, right: 20, top: 44 })
      .linearGradient({
        angle: 180,
        colors: [
          [$r('app.color.common_main_color'), 0.0],
          [Color.White, 0.9]
        ]
      })

      Column() {
        GridRow({ columns: 4 }) {
          ForEach(entryList, (entry: EntryItem) => {
            GridCol({ span: 1 }) {
              Column() {
                Image(entry.icon)
                  .width(24)
                  .height(24)
                Text(entry.title)
                  .fontSize(11)
                  .fontColor($r('app.color.common_gray_03'))
                  .margin({ top: 6 })
              }
              .justifyContent(FlexAlign.Center)
              .alignItems(HorizontalAlign.Center)
              .constraintSize({ minHeight: 44 })
            }
          }, (entry: EntryItem) => entry.title)
        }
      }
      .margin({ left: 12, right: 12, top: -40 })
      .borderRadius(12)
      .padding({ top: 16, bottom: 16 })
      .backgroundColor(Color.White)

      Column() {
        ForEach(toolList, (item: ToolItem, index: number) => {
          this.toolRow(item, index === toolList.length - 1)
        }, (item: ToolItem) => item.title)
      }
      .margin({ left: 12, right: 12, top: 12 })
      .borderRadius(12)
      .backgroundColor(Color.White)

      Text('退出登录')
        .fontSize(14)
        .fontColor($r('app.color.common_main_color'))
        .textAlign(TextAlign.Center)
        .width('100%')
        .height(44)
        .margin({ top: 24 })
        .onClick(() => {
          this.logout()
        })
    }
    .width('100%')
    .height('100%')
    .padding({ bottom: 16 })
    .backgroundColor($r('app.color.common_gray_bg'))
  }
}
