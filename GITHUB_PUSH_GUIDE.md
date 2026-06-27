# 📤 Panduan Push ke GitHub

Dokumen ini berisi langkah-langkah lengkap untuk push project ke GitHub.

## 📋 Prasyarat

1. ✅ Sudah punya akun GitHub ([Daftar di sini](https://github.com/signup))
2. ✅ Git sudah terinstall ([Download Git](https://git-scm.com/downloads))
3. ✅ Project sudah selesai dan siap di-push

## 🚀 Langkah-Langkah

### 1. Buat Repository Baru di GitHub

1. Login ke [GitHub](https://github.com)
2. Klik tombol **"+"** di pojok kanan atas → **"New repository"**
3. Isi informasi repository:
   - **Repository name:** `clinic-registration-system`
   - **Description:** `🏥 Sistem Pendaftaran Klinik - Patient registration system with real-time notifications`
   - **Visibility:** 
     - ✅ **Public** (jika ingin orang lain bisa lihat)
     - ⚠️ **Private** (jika ingin hanya Anda yang bisa akses)
   - **JANGAN** centang:
     - ❌ Add a README file
     - ❌ Add .gitignore
     - ❌ Choose a license
     (karena kita sudah punya file-file ini)
4. Klik **"Create repository"**

### 2. Konfigurasi Git (First Time Only)

Jika ini pertama kali menggunakan Git, set identitas:

```bash
git config --global user.name "Nama Anda"
git config --global user.email "email@example.com"
```

Verifikasi:
```bash
git config --global --list
```

### 3. Inisialisasi Git di Project

Buka terminal/command prompt di folder `clinic-registration-system`:

```bash
cd c:\laragon\www\clinic-registration-system
```

Inisialisasi Git (jika belum):
```bash
git init
```

### 4. Tambahkan File ke Git

Cek status file:
```bash
git status
```

Tambahkan semua file (kecuali yang ada di `.gitignore`):
```bash
git add .
```

### 5. Buat Commit Pertama

```bash
git commit -m "🎉 Initial commit: Clinic Registration System v1.0"
```

### 6. Hubungkan dengan GitHub Repository

Ganti `YOUR-USERNAME` dengan username GitHub Anda:

```bash
git remote add origin https://github.com/YOUR-USERNAME/clinic-registration-system.git
```

Verifikasi remote:
```bash
git remote -v
```

Output:
```
origin  https://github.com/YOUR-USERNAME/clinic-registration-system.git (fetch)
origin  https://github.com/YOUR-USERNAME/clinic-registration-system.git (push)
```

### 7. Push ke GitHub

```bash
git branch -M main
git push -u origin main
```

**Catatan:** Anda mungkin diminta login GitHub:
- Username: `your-username`
- Password: **Gunakan Personal Access Token** (bukan password akun)

#### Cara Membuat Personal Access Token:

1. GitHub → **Settings** (pojok kanan atas foto profil)
2. **Developer settings** (menu paling bawah)
3. **Personal access tokens** → **Tokens (classic)**
4. **Generate new token** → **Generate new token (classic)**
5. Isi:
   - **Note:** `Git Push Token`
   - **Expiration:** `No expiration` atau pilih durasi
   - **Select scopes:** 
     - ✅ `repo` (full control)
     - ✅ `workflow` (jika pakai GitHub Actions)
6. **Generate token**
7. **COPY TOKEN** dan simpan di tempat aman (tidak bisa dilihat lagi!)

Paste token sebagai password saat diminta.

### 8. Verifikasi di GitHub

Buka browser dan akses:
```
https://github.com/YOUR-USERNAME/clinic-registration-system
```

Anda akan melihat semua file sudah ter-upload! 🎉

## 📝 File yang Di-Push

File berikut sudah otomatis di-push:

✅ Dokumentasi:
- `README.md` - Dokumentasi utama
- `CONTRIBUTING.md` - Panduan kontribusi
- `CHANGELOG.md` - Riwayat perubahan
- `LICENSE` - MIT License
- `DATABASE_UPDATE_GUIDE.md` - Panduan update database
- `MYSQL_SETUP_GUIDE.md` - Panduan setup MySQL
- `GITHUB_PUSH_GUIDE.md` - Panduan ini

✅ Source Code:
- `BE-clinic-registration-system/` - Backend (Express + Prisma)
- `FE-clinic-registration-system/` - Frontend (React + Vite)

✅ Database:
- `database.sql` - Complete SQL dump

✅ Config:
- `.gitignore` - File yang diabaikan Git
- `.env.example` - Template environment variables

## 🚫 File yang TIDAK Di-Push

File berikut **TIDAK** akan di-push (sudah ada di `.gitignore`):

- ❌ `node_modules/` - Dependencies (terlalu besar)
- ❌ `.env` - Environment variables (data sensitif!)
- ❌ `dist/`, `build/` - Build output
- ❌ Logs dan temporary files

## 🔄 Update Repository (Push Perubahan Baru)

Setelah melakukan perubahan pada code:

```bash
# 1. Cek file yang berubah
git status

# 2. Tambahkan file yang berubah
git add .
# Atau tambah file tertentu saja:
git add path/to/file.js

# 3. Commit dengan message yang jelas
git commit -m "fix: resolve login error on mobile"

# 4. Push ke GitHub
git push origin main
```

### Commit Message Best Practices

Gunakan format: `<type>: <description>`

**Types:**
- `feat` - Feature baru
- `fix` - Bug fix
- `docs` - Update dokumentasi
- `style` - Format code (no logic change)
- `refactor` - Refactor code
- `test` - Add tests
- `chore` - Maintenance

**Contoh:**
```bash
git commit -m "feat: add forgot password functionality"
git commit -m "fix: resolve doctor schedule overlap issue"
git commit -m "docs: update installation guide"
git commit -m "refactor: simplify auth middleware logic"
```

## 🌿 Bekerja dengan Branch

### Buat Branch Baru

```bash
# Buat dan pindah ke branch baru
git checkout -b feature/new-feature

# Atau buat branch tanpa pindah
git branch feature/new-feature
```

### Push Branch ke GitHub

```bash
git push origin feature/new-feature
```

### Merge Branch ke Main

```bash
# Pindah ke main
git checkout main

# Pull perubahan terbaru
git pull origin main

# Merge branch
git merge feature/new-feature

# Push ke GitHub
git push origin main
```

## 🔍 Command Berguna

### Lihat History Commit

```bash
git log --oneline
```

### Lihat Perubahan File

```bash
git diff
git diff path/to/file.js
```

### Batalkan Perubahan (Before Commit)

```bash
# Batalkan perubahan satu file
git checkout -- path/to/file.js

# Batalkan semua perubahan
git checkout -- .
```

### Undo Commit (After Commit, Before Push)

```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

### Pull dari GitHub

```bash
# Pull dan merge otomatis
git pull origin main

# Pull tanpa merge (fetch only)
git fetch origin main
```

## 🛡️ Tips Keamanan

### ⚠️ JANGAN Push File Sensitif!

File yang TIDAK BOLEH di-push:
- ❌ `.env` files
- ❌ Database credentials
- ❌ API keys / secrets
- ❌ Private keys (`.pem`, `.key`)
- ❌ Personal data

### ✅ Gunakan .env.example

Untuk environment variables:
1. Buat `.env.example` dengan placeholder values
2. Push `.env.example` (aman)
3. Jangan push `.env` (sudah ada di `.gitignore`)

Contoh `.env.example`:
```env
DATABASE_URL="mysql://username:password@localhost:3306/database_name"
JWT_SECRET="your-secret-key-here"
```

### 🔐 Jika Tidak Sengaja Push File Sensitif

**SEGERA lakukan:**

```bash
# 1. Hapus dari Git history
git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch path/to/sensitive-file" \
--prune-empty --tag-name-filter cat -- --all

# 2. Force push
git push origin --force --all

# 3. GANTI secret keys/passwords yang ter-expose!
```

**Lebih baik:** Gunakan tools seperti [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)

## 📱 GitHub Desktop (GUI Alternative)

Jika tidak nyaman dengan command line, gunakan [GitHub Desktop](https://desktop.github.com/):

1. Download dan install GitHub Desktop
2. Sign in dengan akun GitHub
3. Add existing repository (pilih folder project)
4. Commit dan push dengan GUI yang mudah

## 🆘 Troubleshooting

### Error: "remote: Repository not found"

**Penyebab:** URL remote salah atau tidak punya akses

**Solusi:**
```bash
# Cek remote URL
git remote -v

# Update remote URL
git remote set-url origin https://github.com/YOUR-USERNAME/clinic-registration-system.git
```

### Error: "failed to push some refs"

**Penyebab:** Ada perubahan di GitHub yang belum di-pull

**Solusi:**
```bash
# Pull dulu
git pull origin main --rebase

# Lalu push
git push origin main
```

### Error: "Authentication failed"

**Penyebab:** Password salah atau tidak pakai Personal Access Token

**Solusi:**
- Gunakan Personal Access Token sebagai password (lihat langkah 7)
- Atau setup SSH key

### File Tidak Berubah di GitHub

**Solusi:**
```bash
# Cek apakah file ada di .gitignore
cat .gitignore

# Jika iya, hapus dari .gitignore atau tambahkan dengan force
git add -f path/to/file.js
```

## 📚 Resource Tambahan

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Learn Git Branching](https://learngitbranching.js.org/)

## ✅ Checklist Sebelum Push

Pastikan sudah:
- [ ] Hapus semua `console.log()` debug
- [ ] Update README.md dengan info terbaru
- [ ] Tambahkan file `.env.example`
- [ ] Pastikan `.env` ada di `.gitignore`
- [ ] Test aplikasi berfungsi dengan baik
- [ ] Commit message jelas dan deskriptif
- [ ] Tidak ada file sensitif yang ikut ter-push

---

🎉 **Selamat! Project Anda sudah di GitHub!**

Jangan lupa:
- ⭐ **Star** repository Anda sendiri
- 📝 Update **README.md** dengan screenshot
- 🔗 Tambahkan **demo link** jika deploy
- 💬 Buka **Issues** untuk bug tracking

**Happy Coding!** 💻✨
