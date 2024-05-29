// xxx.ets
import { router } from '@kit.ArkUI'
import { url } from '@kit.ArkTS'

@Entry
@Component
struct ListExample {
  private arr: string[] = [
    "自定义组件声明周期",
    "组件自定义布局",
    "自定义组件冻结功能之tab",
    "自定义组件冻结功能之LazyforEach",
    "builder装饰器",
    "builderParam装饰器",
    "extend装饰器",
    "StateStyles多态样式",
    "动画装饰器"]

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: string, index: number) => {
          ListItem() {
            Text(item)
              .width('100%').height(100).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
              .onClick( () => {
                if (index == 0) {
                  router.pushUrl({url: 'pages/ComponentLife'})
                } else if (index == 1) {
                  router.pushUrl({url: 'pages/ComponentCustomLayout'})
                } else if (index == 2) {
                  router.pushUrl({url: 'pages/ComponentFreezeTab'})
                } else if (index == 3) {
                  router.pushUrl({url: 'pages/ComponentFreezeLazyforEach'})
                } else if (index == 4) {
                  router.pushUrl({url: 'pages/BuilderDecorator'})
                } else if (index == 5) {
                  router.pushUrl({url: 'pages/BuilderParamDecorator'})
                } else if (index == 6) {
                  router.pushUrl({url: 'pages/ExtendDecorator'})
                } else if (index == 7) {
                  router.pushUrl({url: 'pages/StateStyles'})
                } else if (index == 8) {
                  router.pushUrl({url: 'pages/AnimatableDecorator'})
                }
              } )
          }
        }, (item: string) => item)
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .friction(0.6)
      .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}