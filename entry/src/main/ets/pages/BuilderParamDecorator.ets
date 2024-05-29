class Tmp{
  label:string = ''
}
@Builder function overBuilder($$ : Tmp) {
  Text($$.label)
    .width(400)
    .height(50)
    .backgroundColor(Color.Green)
}

@Component
struct Child {
  label: string = 'Child'
  @Builder customBuilder() {}
  @Builder customChangeThisBuilder() {}
  // 无参数类型，指向的componentBuilder也是无参数类型
  @BuilderParam customBuilderParam: () => void = this.customBuilder;
  // 有参数类型，指向的overBuilder也是有参数类型的方法
  @BuilderParam customOverBuilderParam: ($$ : Tmp) => void = overBuilder;

  @BuilderParam customChangeThisBuilderParam: () => void = this.customChangeThisBuilder;



  build() {
    Column() {
      this.customBuilderParam()
      this.customOverBuilderParam({label: 'global Builder label' } )
      this.customChangeThisBuilderParam()
    }

  }
}

@Entry
@Component
struct Parent {
  label: string = 'Parent'

  @Builder componentBuilder() {
    Text(`${this.label}`)
  }

  build() {
    Column() {
      this.componentBuilder()
      Child({ customBuilderParam: this.componentBuilder, customOverBuilderParam: overBuilder, customChangeThisBuilderParam: ():void=>{this.componentBuilder()} })
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}