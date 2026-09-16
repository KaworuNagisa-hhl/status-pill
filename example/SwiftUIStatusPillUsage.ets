import { SwiftUIStatusPill } from '@kaworunagisa_hhl/status-pill'

@Component
export struct SwiftUIStatusPillUsage {
  build() {
    SwiftUIStatusPill({
      title: 'Online',
      icon: 'ON',
      color: '#1E7A50'
    })
  }
}
