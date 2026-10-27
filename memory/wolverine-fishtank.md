---
name: wolverine-fishtank
description: Weapon-X Wolverine statue base/lid converted to mini fish tank in Blender - design rules, dims, part layout, progress
metadata:
  type: project
---

Chuyển đế + nắp tượng Wolverine/Weapon-X (từ `3d-first-final.jpg`) thành bể cá mini trong Blender 4.5. File units = METRIC mm (dimension value = mm thẳng).

**Đã lưu:** `wolverine-fishtank.blend` (scene), `print/*.stl` (7 part FT_ export in 3D), `README.md` (spec + lắp đặt + đi dây).

**Luật (user làm rõ):** NGOẠI HÌNH NGOÀI của scan gốc `BASE_LOWER` + `BASE UPPERVF2` giữ nguyên 100% (chữ "X", ống, gân, tai - nhìn ngoài không nhận ra đã sửa). RUỘT thì ĐƯỢC Boolean/khoét thoải mái cho phù hợp bể cá (mạch, flow, bơm giấu bên trong). Chỉ cấm đụng mặt NGOÀI. Lỗi đã mắc: từng build trụ trơn thay scan -> vứt mất thiết kế ngoài + lệch tâm.
  - Lỗ DC khoét THẬT xuyên `BASE_LOWER` (Boolean DIFFERENCE Ø5.6, trục Y @ x=CX+45, z30). Lệch phải né "râu back" giữa (xoff0 maxY+86 là râu; xoff+45 maxY+51 tường đặc, sạch, không dính ống cong trang trí). Lỗ thông Y129.5->147.4 (xuyên 17.9mm).
  - Ruột khoét rỗng trụ cho `FT_Insert`: lòng vốn đã rỗng r58.5 (ID~117) từ scan. Boolean DIFFERENCE cutter r56.5 z3-110 (nằm TRONG khoang, không chạm tường r58.5) xóa nub scan nổi ở tâm (r<6, z90+z100, gân mảnh nối main mesh). Cavity sạch 0 verts r<55 z5-108. verts 440955->441129(lỗ DC)->440842(cavity). Backup `BASE_LOWER_orig` (hidden). `FT_Insert` OD114/r57 clearance 1.5mm.
  - Nắp `BASE UPPERVF2` (chụp úp, tâm 100.3/95.6 ≈ đế, cao z331-404): ruột đã rỗng sẵn r<64 z330-368; vòm đỉnh ĐẶC z370-404; váy trong r65 vỏ dày 5mm (r65-70). 3 Boolean DIFFERENCE EXACT, KHÔNG tăng chiều cao (z404 giữ nguyên): (1) `lid_cavity` r46 z366-401 khoét rỗng vòm (chừa vỏ đỉnh 3mm, giấu dây/khí); (2) `lid_feed` r14 z360-410 lỗ ăn+thoát khí Ø28 xuyên đỉnh (dính lỗ núm scan sẵn -> hình keyhole, chức năng OK); (3) `lid_led` r67.5 z335-350 khoét rãnh vòng vào thành trong váy (chừa vỏ ngoài 2.5mm) để dán dải LED áp vào, không cộng cao. verts 385125->341349. Backup `BASE UPPERVF2_orig` (hidden). Verify: outer maxR mỗi z-band không đổi, cavity r<40 z368-398 = 0 verts, lỗ ăn thông (center r<12 empty), rãnh LED r64-67 = 0 còn vỏ r68-70 nguyên.

**Toạ độ:** đế thật tâm `(99.4, 95.7)`, KHÔNG phải world origin. Mọi part build quanh tâm này.

**Đo được:** lòng đế ID Ø117 (r58.6), sàn z2, cavity ~106mm, gờ ngồi kính z~108. Nắp cavity dưới ~Ø130.

**Part `FT_` (drop-in, tháo được):**
- `FT_Insert`: caddy 3 khoang OD114/ID109 (bông -> đá -> bơm/sủi), có SÀN đáy (FLOOR 3mm @ z2), 2 vách ngăn @ dy=-18/+18 (cao z2->107), lỗ thông nước r6 mỗi vách cho dòng chảy vòng. Khoang máy không cố định. REBUILD (443 verts) sau khi user báo bản cũ "dạng đặc", chưa rõ khoang - bản cũ chỉ là ống rỗng không sàn/vách. Dựng bằng cyl DIFFERENCE + vách clip INTERSECT đĩa trong + join() (boolean UNION vách thất bại -> mất vách).
- `FT_Deck`: sàn Ø130 ngồi gờ z108, rãnh ngồi kính Ø120, 3 lỗ return/overflow/air, socket chĩa xuống khoang máy. ỐNG CHĨA LÊN đã CẮT phẳng @ z117 (bisect+holes_fill) - trước chĩa tới z184 đâm vào Wolverine đặt trong kính, giờ stub ngắn sát sàn. Z[38,117] verts1846.
- `FT_Glass`: trụ mica OD Ø120 / ID Ø114, trong suốt (`FT_glassmat`, Transmission 1.0, Roughness 0.02, BLEND).
- `FT_LEDring`: vòng rãnh quấn LED quanh mép trên kính, giấu dưới nắp -> hiệu ứng màu "bể thí nghiệm".

**Điện (an toàn, 1 dây ra ngoài) - XONG:**
- `FT_DCport`: grommet Ø5.6 @ x=CX+45, z30, trục Y - KHỚP lỗ thật đã khoét xuyên `BASE_LOWER` (xem ngoại lệ trên). 1 dây adapter vào.
- `FT_PowerHub`: hộp chia khoang máy (46x22x24 @ CX,CY+30,z20), 3 cổng cắm trên (bơm/sủi/LED) + 1 DC-in mặt +Y. Cắm thẳng, không liền dây ra ngoài.
- `FT_LEDconduit`: ống OD6/ID4 luồn dây LED z116->322 @ (CX,CY+63), CHẠY NGOÀI kính sau lưng -> `FT_LEDring`. User chốt để lộ nguyên (cách A), như dây bể cá thật.

**Spec chốt:** tổng cao 402mm (~40cm, user OK "linh hoạt"), nước ~2.0L, cột nước 198mm (chừa 20mm headroom). Kính chuẩn cửa hàng: Ø90/100/110/**120**/140/150.

**Máy:** bơm `may-bom.jpg`; sủi khí ~8x3cm (ảnh `may-sui-khi.png` hỏng, user cấp số miệng). Sủi để KHÔ trong khoang 3, chỉ đá sủi xuống đáy qua ống air (an toàn điện). Sump tuần hoàn: overflow -> bông -> đá -> bơm -> đẩy ngược lên.

**Chốt hết:** (1) cao 402mm (~2.0L) - GIỮ; (2) sủi khô khoang 3, đá sủi xuống đáy qua ống air - OK; (3) ống dây LED để lộ sau lưng (cách A). 

**Còn lại (tùy chọn):** thêm chi tiết thẩm mỹ Weapon-X nếu user cần; in thử lát deck khớp gờ z108; nhuộm ống LED xám khớp mép nếu muốn đỡ chói (1 dòng material).
