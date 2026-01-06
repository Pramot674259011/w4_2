## วิธีอัพเดทไฟล์ขึ้น GitHub Pages (Windows cmd.exe)

ไฟล์ที่เปลี่ยน/เพิ่มในโฟลเดอร์นี้:
- `w4_2.html` — ปรับ metadata, responsive CSS และ footer link
- `favicon.svg` — ไอคอนขนาดเล็กที่ใช้กับหน้าเว็บ

เพิ่มเติมที่สร้างขึ้นโดยอัตโนมัติ:
- `.github/workflows/pages.yml` — GitHub Actions workflow สำหรับ deploy หน้าเว็บแบบ static เมื่อ push ไปยัง `main`
- `push_changes.bat` — สคริปต์ Windows (cmd.exe) ช่วย add/commit และ push แบบ interactive

คำสั่งที่ต้องรันใน Command Prompt (เปิดไปที่โฟลเดอร์ `c:\Users\User\Desktop\โฟลเดอร์ใหม่ (5)`):

1) ตรวจสอบสถานะ git (ถ้ายังไม่เป็น repo ให้ดูคำสั่งถัดไป)

```cmd
git status
```

2) ถ้ายังไม่ใช่ Git repository ให้รัน (ครั้งแรกเท่านั้น):

```cmd
git init
git add .
git commit -m "Initial commit: add w4_2.html and favicon"
```

3) ถ้า repo มี remote อยู่แล้ว ให้เพิ่ม/commit การเปลี่ยนแปลง แล้ว push ขึ้น remote (สมมติ branch ชื่อ `main`):

```cmd
git add w4_2.html favicon.svg README.md
git commit -m "Improve metadata, responsive styles and add favicon"
git push origin main
```

4) ถ้ายังไม่มี remote ให้เพิ่ม remote ของคุณ (แทน URL ด้วย URL ของ repo ของคุณ):

```cmd
git remote add origin https://github.com/<USERNAME>/<REPO>.git
git branch -M main
git push -u origin main
```

5) ตรวจสอบการตั้งค่า GitHub Pages ในหน้า repository: Settings → Pages → เลือก branch (`main` หรือ `gh-pages`) และโฟลเดอร์ `/ (root)` แล้วบันทึก

หมายเหตุและคำแนะนำเพิ่มเติม:
- ผมไม่สามารถ push ให้เองได้เพราะต้องใช้สิทธิ์บนเครื่องของคุณ/บัญชี GitHub
- ถ้าคุณต้องการให้หน้าแสดงที่ `https://<USERNAME>.github.io/<REPO>/` ให้ตั้งค่า GitHub Pages ให้ถูกต้อง (branch และ folder)
- ถ้าต้องการให้ผมเตรียม branch ชื่อ `gh-pages` หรือไฟล์เพิ่มเติม เช่น `CNAME` บอกผมได้เลย
 
การใช้งาน `push_changes.bat` (สะดวกบน Windows)

1. เปิด Command Prompt ไปที่โฟลเดอร์นี้ หรือดับเบิลคลิก `push_changes.bat` ใน File Explorer
2. ถ้าต้องการให้สคริปต์ add/commit ให้โดยอัตโนมัติ ให้ตอบ `Y` เมื่อถูกถาม
3. ระบุ branch (default: `main`) และ remote (default: `origin`) แล้วรอจนสคริปต์ทำงานเสร็จ

หมายเหตุการ deploy อัตโนมัติ:
- Workflow `.github/workflows/pages.yml` จะทำงานเมื่อคุณ push ไปยัง branch `main` และจะ deploy ไฟล์ทั้งหมดที่อยู่ใน root ของ repo เป็น GitHub Pages
- หลัง push ให้ไปที่หน้า Repository → Settings → Pages เพื่อยืนยันว่า GitHub Pages ตั้งค่าให้ใช้ `GitHub Actions` (โดยทั่วไปจะเปิดได้อัตโนมัติหลัง workflow ทำงานสำเร็จ)
