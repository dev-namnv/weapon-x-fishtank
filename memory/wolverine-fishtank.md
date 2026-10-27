---
name: wolverine-fishtank
description: Weapon-X Wolverine statue base/lid converted to mini fish tank in Blender - design rules, dims, part layout, progress
metadata:
  type: project
---

Chuyển đế + nắp tượng Wolverine/Weapon-X (từ `3d-first-final.jpg`) thành bể cá mini trong Blender 4.5. File units = METRIC mm (dimension value = mm thẳng).

**Đã lưu:** `wolverine-fishtank.blend` (scene), `print/*.stl` (7 part FT_ export in 3D), `README.md` (spec + lắp đặt + đi dây).

**Luật bất di bất dịch:** KHÔNG đụng dao (Boolean) vào scan gốc `BASE_LOWER` + `BASE UPPERVF2` (high-poly 440k/385k verts = ngoại hình Weapon-X: chữ "X", ống, gân). Chỉ thêm part chức năng RỜI, prefix `FT_`. Lỗi đã mắc: từng build trụ trơn thay scan -> vứt mất thiết kế ngoài + lệch tâm. User chốt: "nắp và đế không được làm hỏng thiết kế bên ngoài, dùng lại thiết kế sẵn có chỉnh lại thôi".

**Toạ độ:** đế thật tâm `(99.4, 95.7)`, KHÔNG phải world origin. Mọi part build quanh tâm này.

**Đo được:** lòng đế ID Ø117 (r58.6), sàn z2, cavity ~106mm, gờ ngồi kính z~108. Nắp cavity dưới ~Ø130.

**Part `FT_` (drop-in, tháo được):**
- `FT_Insert`: caddy 3 khoang OD114 (bông -> đá -> bơm/sủi), vách so le, khoang máy không cố định.
- `FT_Deck`: sàn Ø130 ngồi gờ z108, rãnh ngồi kính Ø120, 3 lỗ return/overflow/air, ống in sẵn chĩa lên + socket chĩa xuống khoang máy.
- `FT_Glass`: trụ mica OD Ø120 / ID Ø114, trong suốt (`FT_glassmat`, Transmission 1.0, Roughness 0.02, BLEND).
- `FT_LEDring`: vòng rãnh quấn LED quanh mép trên kính, giấu dưới nắp -> hiệu ứng màu "bể thí nghiệm".

**Điện (an toàn, 1 dây ra ngoài) - XONG:**
- `FT_DCport`: lỗ DC sau đế, grommet Ø5.6, 1 dây adapter vào.
- `FT_PowerHub`: hộp chia khoang máy (46x22x24 @ CX,CY+30,z20), 3 cổng cắm trên (bơm/sủi/LED) + 1 DC-in mặt +Y. Cắm thẳng, không liền dây ra ngoài.
- `FT_LEDconduit`: ống OD6/ID4 luồn dây LED z116->322 @ (CX,CY+63), CHẠY NGOÀI kính sau lưng -> `FT_LEDring`. User chốt để lộ nguyên (cách A), như dây bể cá thật.

**Spec chốt:** tổng cao 402mm (~40cm, user OK "linh hoạt"), nước ~2.0L, cột nước 198mm (chừa 20mm headroom). Kính chuẩn cửa hàng: Ø90/100/110/**120**/140/150.

**Máy:** bơm `may-bom.jpg`; sủi khí ~8x3cm (ảnh `may-sui-khi.png` hỏng, user cấp số miệng). Sủi để KHÔ trong khoang 3, chỉ đá sủi xuống đáy qua ống air (an toàn điện). Sump tuần hoàn: overflow -> bông -> đá -> bơm -> đẩy ngược lên.

**Chốt hết:** (1) cao 402mm (~2.0L) - GIỮ; (2) sủi khô khoang 3, đá sủi xuống đáy qua ống air - OK; (3) ống dây LED để lộ sau lưng (cách A). 

**Còn lại (tùy chọn):** thêm chi tiết thẩm mỹ Weapon-X nếu user cần; in thử lát deck khớp gờ z108; nhuộm ống LED xám khớp mép nếu muốn đỡ chói (1 dòng material).
