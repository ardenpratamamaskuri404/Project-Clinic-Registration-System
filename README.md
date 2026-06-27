# 🏥 Clinic Registration System

Sistem Pendaftaran Klinik berbasis web untuk memudahkan pasien mendaftar secara online dan dokter mengelola jadwal praktik serta pendaftaran pasien secara real-time.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Node](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)
![React](https://img.shields.io/badge/react-18.3.1-61dafb.svg)

## 📋 Daftar Isi

- [Fitur Utama](#-fitur-utama)
- [Tech Stack](#-tech-stack)
- [Prasyarat](#-prasyarat)
- [Instalasi](#-instalasi)
- [Konfigurasi Database](#-konfigurasi-database)
- [Menjalankan Aplikasi](#-menjalankan-aplikasi)
- [Kredensial Default](#-kredensial-default)
- [Struktur Proyek](#-struktur-proyek)
- [API Endpoints](#-api-endpoints)
- [Troubleshooting](#-troubleshooting)
- [Kontribusi](#-kontribusi)
- [Lisensi](#-lisensi)

## ✨ Fitur Utama

### 👤 Untuk Pasien
- ✅ Registrasi dan login akun
- ✅ Melihat daftar poli dan dokter tersedia
- ✅ Melihat jadwal dokter berdasarkan hari
- ✅ Mendaftar konsultasi dengan dokter
- ✅ Melihat riwayat pendaftaran
- ✅ Notifikasi real-time status pendaftaran

### 👨‍⚕️ Untuk Dokter
- ✅ Dashboard manajemen pendaftaran
- ✅ Kelola jadwal praktik (tambah, edit, hapus)
- ✅ Melihat daftar pendaftaran pasien
- ✅ Terima/tolak pendaftaran pasien
- ✅ Notifikasi real-time pendaftaran baru
- ✅ Filter dan pencarian data

### 🔔 Real-time Features
- WebSocket untuk notifikasi instant
- Auto-update daftar pendaftaran
- Live status perubahan

## 🛠 Tech Stack

### Frontend
- **React** 18.3.1 - UI Library
- **Vite** - Build tool & dev server
- **Tailwind CSS** - Styling
- **Shadcn UI** - Component library
- **React Router** - Routing
- **Axios** - HTTP client
- **Socket.IO Client** - Real-time communication
- **React Hot Toast** - Notifications
- **Lucide React** - Icons

### Backend
- **Node.js** - Runtime environment
- **Express** - Web framework
- **Prisma** - ORM
- **MySQL** - Database
- **JWT** - Authentication
- **bcryptjs** - Password hashing
- **Socket.IO** - WebSocket server
- **Zod** - Schema validation

## 📦 Prasyarat

Pastikan sudah terinstall:

- **Node.js** >= 18.0.0 ([Download](https://nodejs.org/))
- **MySQL** >= 8.0 ([Laragon](https://laragon.org/) / [XAMPP](https://www.apachefriends.org/))
- **Git** ([Download](https://git-scm.com/))
- **npm** atau **yarn**

## 🚀 Instalasi

### 1. Clone Repository

```bash
git clone https://github.com/username/clinic-registration-system.git
cd clinic-registration-system
```

### 2. Install Dependencies Backend

```bash
cd BE-clinic-registration-system
npm install
```

### 3. Install Dependencies Frontend

```bash
cd ../FE-clinic-registration-system
npm install
```

## 🗄 Konfigurasi Database

### Metode 1: Menggunakan File SQL (Tercepat)

1. **Pastikan MySQL berjalan** (Laragon atau XAMPP)

2. **Import database menggunakan file SQL:**

```bash
# Via Command Line (Windows - Laragon)
C:\laragon\bin\mysql\mysql-8.0.30-winx64\bin\mysql.exe -u root < database.sql

# Via phpMyAdmin
# 1. Buka http://localhost/phpmyadmin
# 2. Import -> Pilih file database.sql -> Go
```

### Metode 2: Menggunakan Prisma

1. **Buat file `.env` di folder `BE-clinic-registration-system`:**

```bash
cd BE-clinic-registration-system
```

2. **Isi file `.env`:**

```env
DATABASE_URL="mysql://root:@127.0.0.1:3306/klinik_db"
JWT_SECRET="supersecretkey123"
PORT=5000
CLIENT_URL="http://localhost:5173"
```

3. **Push schema dan seed database:**

```bash
npx prisma db push
npm run seed
```

### Verifikasi Database

```bash
npx prisma studio
```

Atau cek via MySQL:

```sql
USE klinik_db;
SELECT * FROM User;
SELECT * FROM Poli;
SELECT * FROM Dokter;
```

## ▶️ Menjalankan Aplikasi

### Terminal 1: Backend

```bash
cd BE-clinic-registration-system
npm run dev
# atau
node server.js
```

Backend akan berjalan di: `http://localhost:5000`

### Terminal 2: Frontend

```bash
cd FE-clinic-registration-system
npm run dev
```

Frontend akan berjalan di: `http://localhost:5173`

## 🔑 Kredensial Default

### Akun Dokter
- **Email:** `doctor@klinik.com`
- **Password:** `doctor123`
- **Role:** DOCTOR
- **Akses:** Dashboard dokter, kelola jadwal, terima/tolak pendaftaran

### Akun Pasien
- **Email:** `budi@gmail.com`
- **Password:** `patient123`
- **Role:** PATIENT
- **Akses:** Daftar konsultasi, lihat riwayat pendaftaran

## 📁 Struktur Proyek

```
clinic-registration-system/
├── BE-clinic-registration-system/       # Backend API
│   ├── prisma/
│   │   ├── schema.prisma               # Database schema
│   │   └── seed.js                     # Seed data
│   ├── src/
│   │   ├── middleware/
│   │   │   └── auth.js                 # Authentication middleware
│   │   ├── routes/
│   │   │   ├── auth.js                 # Auth endpoints
│   │   │   ├── poli.js                 # Poli endpoints
│   │   │   ├── dokter.js               # Doctor endpoints
│   │   │   ├── jadwal.js               # Schedule endpoints
│   │   │   └── pendaftaran.js          # Registration endpoints
│   │   └── utils/
│   │       ├── prisma.js               # Prisma client
│   │       ├── socket.js               # Socket.IO config
│   │       └── socketEmitter.js        # Socket events
│   ├── .env                            # Environment variables
│   ├── server.js                       # Entry point
│   └── package.json
│
├── FE-clinic-registration-system/       # Frontend React
│   ├── src/
│   │   ├── api/
│   │   │   └── api.js                  # Axios config
│   │   ├── components/
│   │   │   ├── layout/                 # Layout components
│   │   │   └── ui/                     # Shadcn UI components
│   │   ├── context/
│   │   │   └── AuthContext.jsx         # Auth state management
│   │   ├── pages/
│   │   │   ├── auth/                   # Login & Register
│   │   │   ├── patient/                # Patient pages
│   │   │   ├── doctor/                 # Doctor pages
│   │   │   └── landing/                # Landing page
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── .env                            # Environment variables
│   └── package.json
│
├── database.sql                        # Complete SQL dump
├── DATABASE_UPDATE_GUIDE.md            # Database migration guide
├── MYSQL_SETUP_GUIDE.md               # MySQL setup instructions
└── README.md                          # This file
```

## 🔌 API Endpoints

### Authentication

```http
POST   /api/auth/register      # Registrasi user baru
POST   /api/auth/login          # Login user
```

### Poli (Public)

```http
GET    /api/poli                # Get semua poli
```

### Dokter (Public)

```http
GET    /api/dokter              # Get semua dokter
```

### Jadwal (Mixed)

```http
GET    /api/jadwal              # Get semua jadwal (public)
POST   /api/jadwal              # Create jadwal (doctor only)
DELETE /api/jadwal/:id          # Delete jadwal (doctor only)
```

### Pendaftaran (Protected)

```http
GET    /api/pendaftaran         # Get pendaftaran (filtered by role)
POST   /api/pendaftaran         # Create pendaftaran (patient)
PATCH  /api/pendaftaran/:id/status  # Update status (doctor only)
```

### WebSocket Events

```javascript
// Client → Server
socket.emit('join-room', 'patient-{userId}')
socket.emit('join-room', 'doctor')

// Server → Client
socket.on('new-registration', (data) => {})
socket.on('registration-status-updated', (data) => {})
```

## 🐛 Troubleshooting

### Error: `EADDRINUSE: Address already in use`

**Solusi:**
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# Stop all node processes
taskkill /IM node.exe /F
```

### Error: `Token is not valid - User not found`

**Penyebab:** Database direset tapi token lama masih ada di localStorage

**Solusi:**
1. Buka DevTools (F12) → Application → Local Storage
2. Hapus `token` dan `user`
3. Refresh dan login ulang

### Error: `POST /api/jadwal 400` (dokterId undefined)

**Penyebab:** User doctor belum ter-link dengan dokter profile

**Solusi:**
```bash
# Re-seed database
cd BE-clinic-registration-system
node prisma/seed.js

# Logout dan login ulang
```

### Error: Prisma Client error

**Solusi:**
```bash
cd BE-clinic-registration-system
npx prisma generate
npx prisma db push
```

### Port Frontend/Backend Conflict

Edit file `.env`:

**Backend `.env`:**
```env
PORT=5001  # Ubah dari 5000
```

**Frontend `.env`:**
```env
VITE_API_URL=http://localhost:5001/api
```

## 🤝 Kontribusi

Kontribusi sangat diterima! Silakan:

1. Fork repository ini
2. Buat branch fitur (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## 📝 To-Do / Roadmap

- [ ] Implementasi forgot password
- [ ] Export laporan pendaftaran (PDF/Excel)
- [ ] Multi-language support (EN/ID)
- [ ] Email notification
- [ ] SMS notification via Twilio
- [ ] Payment gateway integration
- [ ] Medical record system
- [ ] Appointment reminder
- [ ] Admin dashboard untuk analytics

## 📄 Lisensi

Distributed under the MIT License. See `LICENSE` for more information.

## 👥 Tim Pengembang

- **Backend Developer** - Algifahri
- **Frontend Developer** - Arden dan Alif
- **UI/UX Designer** - Chika dan humayra 

## 📧 Kontak

Project Link: [https://github.com/ardenpratamamaskuri404/Project-Clinic-Registration-System]

---

⭐️ Jika project ini membantu, berikan star di GitHub!
