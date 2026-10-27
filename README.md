# Wolverine / Weapon-X -> bể cá mini

Chuyển đế + nắp tượng Wolverine/Weapon-X (ref `3d-first-final.jpg`) thành bể cá mini để bàn, in 3D + lắp máy lọc/sủi/LED. Giữ NGUYÊN ngoại hình gốc (chữ "X", ống, gân), chỉ thêm ruột chức năng rời.

## Files

| File | Là gì |
|---|---|
| `wolverine-fishtank.blend` | Scene Blender gốc. Scan `BASE_LOWER` + `BASE UPPERVF2` = vỏ Weapon-X (không đụng dao). Part `FT_` = ruột chức năng rời. |
| `3d-first-final.jpg` | Ảnh tham chiếu thiết kế. |
| `print/*.stl` | Part in 3D (xem bảng dưới). |
| `memory/` | Memory project (spec, số đo, luật thiết kế). |
| `CLAUDE.md` | Luật cho agent. |

## Part thiết kế (part `FT_` = in 3D, rời, tháo được)

Đơn vị mm. Tâm đế thật `(99.4, 95.7)`.

| Part | Phần bể | Nhiệm vụ |
|---|---|---|
| `FT_Insert` | ruột đế | Caddy 3 khoang: **bông lọc -> đá lọc -> bơm/sủi**. Vách so le ép nước đi vòng. Khoang máy KHÔNG cố định (thay máy được). |
| `FT_Deck` | nắp khoang lọc | Sàn Ø130 ngồi gờ đế (z108). Rãnh ngồi kính Ø120. 3 lỗ: return / overflow / air. Ống in sẵn chĩa lên bể + socket chĩa xuống khoang máy. |
| `FT_Glass` | thành bể | Trụ mica **OD Ø120 / ID Ø114**. *Mua ống mica cửa hàng* - STL chỉ để tham chiếu kích thước, không in. |
| `FT_LEDring` | mép nắp | Vòng rãnh quấn dải LED quanh mép trên kính, giấu dưới nắp -> hiệu ứng màu "bể thí nghiệm". |
| `FT_DCport` | sau đế | Grommet lỗ DC Ø5.6 cho 1 dây nguồn adapter đi vào. |
| `FT_PowerHub` | khoang máy | Hộp chia điện: 1 DC-in -> 3 cổng cắm (bơm / sủi / LED). |
| `FT_LEDconduit` | sau lưng | Ống OD6/ID4 luồn dây LED từ khoang đế lên nắp. Chạy ngoài kính, lộ sau lưng (như dây bể cá thật). |

## Spec

- Tổng cao **402mm** (~40cm) · nước **~2.0L** · cột nước 198mm (chừa 20mm headroom).
- Kính: ống mica chuẩn cửa hàng **Ø120mm**.
- Lọc sump tuần hoàn: `overflow -> bông -> đá -> bơm -> đẩy ngược lên bể`.

## Lắp đặt

1. **In 3D:** `FT_Insert`, `FT_Deck`, `FT_LEDring`, `FT_DCport`, `FT_PowerHub`, `FT_LEDconduit`. Khoang kín nước (Insert, Deck) in nhiều wall + xử lý chống thấm (epoxy/resin food-safe).
2. **Kính:** mua ống mica Ø120 (OD) cắt dài 205mm. Dán đáy kính vào rãnh `FT_Deck` bằng keo silicon bể cá.
3. **Ruột đế:** đặt `FT_Insert` vào lòng đế gốc. Nhồi bông lọc khoang 1, đá lọc khoang 2.
4. **Máy:** bơm + máy sủi để khoang 3 (khô). Đậy `FT_Deck` lên gờ z108.
5. **Nắp:** quấn dải LED vào `FT_LEDring`, đặt nắp scan `BASE UPPERVF2` lên trên.

## Đi dây (an toàn - 1 dây ra ngoài)

```
Adapter DC ──► FT_DCport (lỗ sau đế, grommet)
                   │
                   ▼
            FT_PowerHub (hộp chia trong khoang máy)
             ├─► cổng 1 ──► Bơm
             ├─► cổng 2 ──► Máy sủi
             └─► cổng 3 ──► dây LED ──► FT_LEDconduit ──► FT_LEDring (nắp)
```

**Luật an toàn điện:**
- Chỉ **1 dây DC** duy nhất ra ngoài (qua `FT_DCport`). Mọi dây/jack còn lại nằm trong khoang kín.
- Máy sủi + biến áp để **KHÔ** trong khoang. Chỉ **đá sủi + ống air** xuống nước.
- Không để tiếp điện gần nước. Cắm thiết bị vào `FT_PowerHub` -> không có dây lòng thòng ngoài bể.

## Luật thiết kế (khi sửa tiếp)

- KHÔNG Boolean / cắt / scale / đổi hình scan gốc (`BASE_LOWER`, `BASE UPPERVF2`).
- Mọi chức năng mới = object rời prefix `FT_`, build quanh tâm `(99.4, 95.7)`.
- Xong phần nào update `memory/wolverine-fishtank.md`.
