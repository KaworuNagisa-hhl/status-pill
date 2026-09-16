# status-pill

`status-pill` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃状态胶囊组件，适合展示同步状态、提醒状态、标签和轻量筛选条件。默认是 iOS 式半透明小胶囊，可自定义颜色、宽高、圆角、边框和字号。

## 实际运行效果

下面展示状态胶囊的默认展示、强调色和自定义宽高状态：

![status pill preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/status-pill@main/docs/status-pill-preview.gif)

## 安装

```bash
ohpm install @kaworunagisa_hhl/status-pill
```


## 正常使用样式

```ts
import { SwiftUIStatusPill } from '@kaworunagisa_hhl/status-pill'
import { SwiftUITone } from '@kaworunagisa_hhl/theme'

@Component
struct SyncStatusPill {
  build() {
    SwiftUIStatusPill({
      title: '已同步',
      icon: 'S',
      color: '#141414',
      tone: SwiftUITone.GlassBlack
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIStatusPill({
  title: 'custom 148x34',
  icon: 'W',
  color: '#141414',
  componentWidth: 148,
  componentHeight: 34,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1,
  cornerRadius: 8,
  textFontSize: 12
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from '@kaworunagisa_hhl/theme'

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth('92%')
  .withHeight('auto')
  .withRadius(8)
  .withFillColor('#E6111111')
  .withTintColor('#22FFFFFF')
  .withBorder('#33FFFFFF', 1)
  .withShadow('#33000000', 16)
  .withPadding(12)

SwiftUIStatusPill({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## 示例目录

完整最小示例见 `example/SwiftUIStatusPillUsage.ets`。该示例演示了状态文本、图标文本和语义色，适合在线状态、同步状态和标签。

## 颜色与风格预设

`SwiftUITone` 继续保持三个基础颜色枚举：`GlassBlack`、`PureWhite`、`SystemGray`。如果业务希望更快套用品牌风格，可以从 `theme` 引入 `SwiftUIBrandStyle` 与 `swiftUIConfigForStyle()`，当前提供 `Graphite`、`Mist`、`Ocean`、`Mint`、`Amber`、`Rose`、`Lavender` 七组预设。预设只是快捷入口，仍可继续叠加 `withFillColor()`、`withTintColor()`、`withColor()`、`withAccentColor()`、`withBorder()`、`withShadow()`、`withRadius()`、`withPadding()`、`withSize()`、`withTitleFontSize()`、`withSubtitleFontSize()`、`withTextFontSize()`、`withIconSize()`、`withSpacing()` 等链式方法做高度自定义。

```ts
import { SwiftUIBrandStyle, swiftUIConfigForStyle } from '@kaworunagisa_hhl/theme'

const oceanStyle = swiftUIConfigForStyle(SwiftUIBrandStyle.Ocean)
  .withRadius(8)
  .withPadding(14)
  .withBorder('#6657C7F7', 1.2)
  .withShadow('#241D4ED8', 20)
```

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `title` | `ResourceStr` | `''` | 胶囊文本 |
| `icon` | `ResourceStr` | `''` | 可选前缀图标字符 |
| `color` | `ResourceColor` | 黑色主色 | 文本和强调色 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'auto'` | 胶囊宽度 |
| `componentHeight` | `Length` | `'auto'` | 胶囊高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1` | 边框宽度 |
| `cornerRadius` | `number` | `12` | 圆角 |
| `textFontSize` | `number` | `11` | 文本字号 |
