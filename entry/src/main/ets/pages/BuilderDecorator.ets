import { router } from '@kit.ArkUI';

class Tmp {
  paramA1: string = '';
}

@Builder function parentBuilder($$: Tmp) {
  Row() {
    Column() {

      Text(`parentBuilder===${$$.paramA1}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      HelloComponent({message: $$.paramA1})
      childBuilder({paramA1: $$.paramA1})
    }
  }
}

@Component
struct HelloComponent {
  @Prop message: string = '';

  build() {
    Row() {
      Text(`HelloComponent===${this.message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Builder
function childBuilder($$: Tmp) {
  Row() {
    Column() {
      Text(`childBuilder===${$$.paramA1}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      HelloChildComponent({message: $$.paramA1})
      grandsonBuilder({paramA1: $$.paramA1})
    }
  }
}

@Component
struct HelloChildComponent {
  @State message: string = '';
  build() {
    Row() {
      Text(`HelloChildComponent===${this.message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Builder function grandsonBuilder($$: Tmp) {
  Row() {
    Column() {
      Text(`grandsonBuilder===${$$.paramA1}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      HelloGrandsonComponent({message: $$.paramA1})
    }
  }
}

@Component
struct HelloGrandsonComponent {
  @Link message: string;
  build() {
    Row() {
      Text(`HelloGrandsonComponent===${this.message}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
  }
}

@Entry
@Component
struct Parent {
  @State label: string = 'Hello';
  build() {
    Column() {
      parentBuilder({paramA1: this.label})
      Button('Click me').onClick(() => {
        this.label = 'ArkUI';
      })
      Button('back')
        .margin(20)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          router.back()
        })
    }
  }
}