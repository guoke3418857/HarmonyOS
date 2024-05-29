@Extend(Text) function fancy (fontSize: number) {
  .fontColor(Color.Red)
  .fontSize(fontSize)
}

@Entry
@Component
struct FancyUse {
  @State fontSizeValue: number = 20
  build() {
    Row({ space: 10 }) {
      Text('Fancy')
        .fancy(this.fontSizeValue)
        .onClick(() => {
          this.fontSizeValue = 30
        })
    }
  }
}


// @Extend(Text) function makeMeClick(onClick: () => void) {
//   .backgroundColor(Color.Blue)
//   .onClick(onClick)
// }
//
// @Entry
// @Component
// struct FancyUse {
//   @State label: string = 'Hello World';
//
//   onClickHandler() {
//     this.label = 'Hello ArkUI';
//   }
//
//   build() {
//     Row({ space: 10 }) {
//       Text(`${this.label}`)
//         .makeMeClick(() => {this.onClickHandler()})
//     }
//   }
// }