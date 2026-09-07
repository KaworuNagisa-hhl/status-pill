import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_SMALL,
  swiftUIColorWithOpacity,
  SwiftUIComponentConfig,
  SwiftUITone
} from 'theme'

@Component
export struct SwiftUIStatusPill {
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
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

  private resolvedTone(): SwiftUITone {
    return this.config.tone === undefined ? this.tone : this.config.tone
  }

  private resolvedColor(): ResourceColor {
    return this.config.color === undefined ? this.color : this.config.color
  }

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedHeight(): Length {
    return this.config.height === undefined ? this.componentHeight : this.config.height
  }

  private resolvedFillColor(): ResourceColor {
    return this.config.fillColor === undefined ? this.fillColor : this.config.fillColor
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  private resolvedBorderWidth(): number {
    return this.config.borderWidth === undefined ? this.customBorderWidth : this.config.borderWidth
  }

  private resolvedTextFontSize(): number {
    return this.config.textFontSize === undefined ? this.textFontSize : this.config.textFontSize
  }

  private resolvedTintColor(): ResourceColor {
    if (this.config.tintColor) {
      return this.config.tintColor
    }
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.resolvedTone()).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    if (this.config.borderColor) {
      return this.config.borderColor
    }
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.resolvedColor(), 0.30) : this.customBorderColor
  }

  build() {
    Row({ space: SWIFT_UI_SPACING_EXTRA_SMALL }) {
      if (this.icon !== '') {
        Text(this.icon)
          .fontSize(this.resolvedTextFontSize())
          .fontWeight(FontWeight.Bold)
          .fontColor(this.resolvedColor())
      }

      Text(this.title)
        .fontSize(this.resolvedTextFontSize())
        .fontWeight(FontWeight.Bold)
        .fontColor(this.resolvedColor())
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width(this.resolvedWidth())
    .height(this.resolvedHeight())
    .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: SWIFT_UI_SPACING_EXTRA_SMALL, bottom: SWIFT_UI_SPACING_EXTRA_SMALL })
    .backgroundColor(this.resolvedFillColor())
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [this.resolvedFillColor(), 0.0],
        [swiftUIColorWithOpacity(this.resolvedColor(), 0.18), 0.70],
        [this.resolvedTintColor(), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Thin)
    .borderRadius(this.resolvedCornerRadius())
    .border({ width: this.resolvedBorderWidth(), color: this.resolvedBorderColor() })
  }
}
