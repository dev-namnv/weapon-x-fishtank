# Changelog - thiết kế bể cá Weapon-X

File `.blend` không nằm trong git (ở Google Drive qua rclone). File này track mọi thay đổi thiết kế để biết bản `.blend` hiện có gì. Chi tiết số đo: `memory/wolverine-fishtank.md`.

Format: mỗi mục = 1 lần sửa, mới nhất trên cùng.

## 2026-10-27

- **Nắp `BASE UPPERVF2` - khoét ruột** (verts 385125 -> 341349). 3 Boolean DIFFERENCE, giữ nguyên ngoại hình + chiều cao z404:
  - `lid_cavity` r46 z366-401: khoét rỗng vòm đỉnh đặc (chừa vỏ 3mm) - giấu dây/khí.
  - `lid_feed` r14 z360-410: lỗ ăn + thoát/lấy khí Ø28 xuyên đỉnh.
  - `lid_led` r67.5 z335-350: rãnh vòng vào thành trong váy (chừa vỏ ngoài 2.5mm) - dán dải LED, không tăng cao.
  - Backup `BASE UPPERVF2_orig` (hidden).
- **Đế `BASE_LOWER` - khoét ruột trụ** cho `FT_Insert`: cutter r56.5 z3-110, xóa nub scan ở tâm (verts 441129 -> 440842). Cavity sạch, tường r58.5 giữ nguyên.
- **Đế `BASE_LOWER` - lỗ DC**: Boolean Ø5.6 trục Y @ x=CX+45 z30, né "râu back" (verts 440955 -> 441129).

## Quy ước

- Ngoại hình NGOÀI scan gốc giữ 100% (chữ "X", ống, gân, tai). Chỉ sửa RUỘT.
- Part chức năng = object rời prefix `FT_`.
- Mọi cut đều scripted/deterministic -> chạy lại khôi phục được nếu lỡ undo.
