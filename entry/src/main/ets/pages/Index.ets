import router from '@ohos.router'
import { User } from '../models/Index'
import { jsonUser } from '../testdata/index'

@Extend(TextInput)
function loginInput() {
  .width('100%')
  .height(48)
  .fontSize(16)
  .backgroundColor(Color.Transparent)
  .borderRadius(0)
  .border({ width: 0 })
}

@Entry
@Component
struct Index {
  @State username: string = ''
  @State password: string = ''
  private presetUser: User = { id: '', username: '', password: '', avatar: '', token: '' }

  aboutToAppear(): void {
    const user = JSON.parse(jsonUser) as User
    this.presetUser = user
  }

  onPageShow(): void {
    this.username = ''
    this.password = ''
  }

  private showToast(message: string): void {
    this.getUIContext().getPromptAction().showToast({ message: message, duration: 2000 })
  }

  login(): void {
    if (this.username.trim() === '') {
      this.showToast('请输入用户名')
      return
    }
    if (this.password === '') {
      this.showToast('请输入密码')
      return
    }
    if (this.username.trim() !== this.presetUser.username || this.password !== this.presetUser.password) {
      this.showToast('用户名或密码错误')
      return
    }
    AppStorage.setOrCreate<string>('user', JSON.stringify(this.presetUser))
    router.pushUrl({ url: 'pages/MainPage' })
  }

  build() {
    Column() {
      Image($r('app.media.ic_mine_logo'))
        .width(56)
        .height(56)

      Text('考研通')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.black'))
        .margin({ top: 16 })

      Text('考研通，让备考更轻松！')
        .fontSize(12)
        .fontColor($r('app.color.common_gray_01'))
        .margin({ top: 8 })

      TextInput({ placeholder: '请输入用户名', text: $$this.username })
        .loginInput()
        .margin({ top: 60 })

      Divider()
        .color($r('app.color.common_gray_border'))
        .strokeWidth(1)
        .width('100%')

      TextInput({ placeholder: '请输入密码', text: $$this.password })
        .type(InputType.Password)
        .loginInput()
        .margin({ top: 24 })

      Divider()
        .color($r('app.color.common_gray_border'))
        .strokeWidth(1)
        .width('100%')

      Button('立即登录')
        .width('100%')
        .height(44)
        .borderRadius(6)
        .backgroundColor($r('app.color.common_main_color'))
        .fontColor(Color.White)
        .fontSize(16)
        .margin({ top: 32 })
        .onClick(() => {
          this.login()
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 40, right: 40, top: 100 })
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}
