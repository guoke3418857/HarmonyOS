// page.ets
import { router } from '@kit.ArkUI';

@Entry
@Component
struct ComponentLifeNext {
  @State textColor: Color = Color.Black;
  @State num: number = 0

  onPageShow() {
    this.num = 5
  }

  onPageHide() {
    console.log("ComponentLifeNext onPageHide");
  }

  onBackPress() { // 不设置返回值按照false处理
    this.textColor = Color.Grey
    this.num = 0
  }

  aboutToAppear() {
    this.textColor = Color.Blue
  }

  build() {
    Column() {
      Text(`num 的值为：${this.num}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.textColor)
        .margin(20)
        .onClick(() => {
          this.num += 5
        })
      Button('back')
        .margin(20)
        .backgroundColor(this.textColor)
        .onClick(() => {
          router.back()
        })
    }
    .height('100%')
    .width('100%')
  }
}