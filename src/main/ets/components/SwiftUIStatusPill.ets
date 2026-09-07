import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_SMALL,
  swiftUIColorWithOpacity,
  SwiftUITone
} from 'theme'

@Component
export struct SwiftUIStatusPill {
  @Prop title: ResourceStr = ''
  @Prop icon: ResourceStr = ''
  @Prop color: ResourceColor = getSwiftUIPalette().primary
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = 'auto'
  @Prop componentHeight: Length = 'auto'
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CONTROL
  @Prop textFontSize: number = 11

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.color, 0.30) : this.customBorderColor
  }

  build() {
    Row({ space: SWIFT_UI_SPACING_EXTRA_SMALL }) {
      if (this.icon !== '') {
        Text(this.icon)
          .fontSize(this.textFontSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.color)
      }

      Text(this.title)
        .fontSize(this.textFontSize)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.color)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
    .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: SWIFT_UI_SPACING_EXTRA_SMALL, bottom: SWIFT_UI_SPACING_EXTRA_SMALL })
    .backgroundColor(this.fillColor)
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [this.fillColor, 0.0],
        [swiftUIColorWithOpacity(this.color, 0.18), 0.70],
        [this.resolvedTintColor(), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Thin)
    .borderRadius(this.cornerRadius)
    .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
  }
}
