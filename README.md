# status-pill

`status-pill` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃状态胶囊组件，适合展示同步状态、提醒状态、标签和轻量筛选条件。默认是 iOS 式半透明小胶囊，可自定义颜色、宽高、圆角、边框和字号。

## 实际运行效果

下面展示状态胶囊的默认展示、强调色和自定义宽高状态：

![status pill preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/status-pill@main/docs/status-pill-preview.gif)

## 安装

```bash
ohpm install status-pill
```

本地源码依赖：

```json5
{
  "dependencies": {
    "status-pill": "file:../status-pill",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIStatusPill } from 'status-pill'
import { SwiftUITone } from 'theme'

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

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
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
