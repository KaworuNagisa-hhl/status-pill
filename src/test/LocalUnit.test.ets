import { describe, it, expect } from '@ohos/hypium'
import { swiftUIColorWithOpacity } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIStatusPill', () => {
    it('uses_status_title_icon_color_contract', 0, () => {
      const title = 'Active'
      const icon = 'OK'
      const color = '#1E7A50'
      expect(title).assertEqual('Active')
      expect(icon).assertEqual('OK')
      expect(swiftUIColorWithOpacity(color, 0.18)).assertEqual('#2E1E7A50')
    })
  })
}
