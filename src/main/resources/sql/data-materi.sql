-- =================================================================
--      SCRIPT INISIALISASI DATABASE UNTUK MODUL PENYULUHAN
--      (UPDATED: LIGHT GREEN THEME - MATCHING USER IMAGE)
-- =================================================================

-- -----------------------------------------------------
-- BAGIAN 1: PEMBUATAN STRUKTUR TABEL (TIDAK ADA PERUBAHAN)
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS modules (
    id BIGINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS steps (
    id BIGINT PRIMARY KEY,
    module_id BIGINT NOT NULL REFERENCES modules(id),
    step_order INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    text_content TEXT,
    image_url VARCHAR(255),
    interactive_type VARCHAR(50),
    interactive_url VARCHAR(255),
    media_description VARCHAR(255),
    UNIQUE(module_id, step_order)
);


-- -----------------------------------------------------
-- BAGIAN 2: PENGISIAN DATA KONTEN (HTML & CSS DIPERBAIKI)
-- -----------------------------------------------------

-- MODUL UTAMA
INSERT INTO modules (id, title, description)
VALUES (1, 'Penyuluhan Berhenti Merokok', 'Modul edukasi lengkap untuk membantu pengguna berhenti merokok.')
ON CONFLICT (id) DO UPDATE SET
    title = EXCLUDED.title,
    description = EXCLUDED.description;

-- STEP 1: Pengantar (Disesuaikan persis dengan gambar target)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    1, 1, 1,
    'Pengantar',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">

       <div style="background-color: #E3F2FD; padding: 15px 20px; margin-bottom: 20px; border-radius: 8px; border-left: 4px solid #1E88E5; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
         <div style="display: flex; align-items: center; margin-bottom: 5px;">
           <span style="font-size: 20px; margin-right: 10px;">🚬️</span>
           <strong style="text-transform: uppercase;  color: #1E88E5; font-size: 18px;">APA ITU ROKOK?</strong>
         </div>
         <p style="font-size: 16px;">
           Rokok adalah silinder kertas berisi daun tembakau olahan. Meski umum, rokok mengandung bahan yang <strong style="color: #d32f2f;">sangat berbahaya bagi kesehatan</strong> (baik bagi perokok maupun orang sekitar).
         </p>
       </div>

       <p style="font-size: 16px; margin-bottom: 25px;">
         Kebiasaan ini bukan sekadar budaya, tapi ancaman serius. <strong style="color: #d32f2f;">Tidak ada dampak positif</strong> yang berarti dari merokok, justru sebaliknya, ia membawa ribuan racun ke dalam tubuh.
       </p>
       <div style="background-color: #ffebee; padding: 15px 20px; border-radius: 8px; border-left: 4px solid #c62828; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
         <div style="display: flex; align-items: center; margin-bottom: 5px;">
           <span style="font-size: 20px; margin-right: 10px;">⚠️</span>
             <strong style="text-transform: uppercase; color: #c62828; font-size: 18px;">FAKTA MEMPRIHATINKAN</strong>
         </div>
         <p style="color: #b71c1c; font-size: 15px; line-height: 1.5; margin: 0;">
           Prevalensi merokok pada remaja usia 13–15 tahun di Indonesia mencapai 20,3%. Artinya, 1 dari 5 remaja sudah meracuni tubuhnya sejak dini.
         </p>
       </div>
    </div>',
    '/public/modules/1.Pengantar.png',
    NULL, NULL, NULL
) ON CONFLICT (id) DO UPDATE SET text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 2: Kandungan Zat pada Rokok (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    2, 1, 2,
    'Kandungan Zat pada Rokok',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="color: #b71c1c; margin-top: 0; font-size: 22px; display: flex; align-items: center;">
           <span style="font-size: 28px; margin-right: 10px;">☠️</span>
           LEBIH DARI 7.000 ZAT BERBAHAYA
       </h2>
       <p style="margin-bottom: 20px;">Di dalam satu batang rokok, terdapat ribuan zat kimia, ratusan di antaranya beracun dan sekitar 70 bersifat karsinogenik (penyebab kanker).</p>
       <div style="margin-top: 20px; display: grid; gap: 15px;">
         <div style="background-color: #f5f5f5; padding: 15px; border-radius: 8px; border-left: 4px solid #2e7d32; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
           <div style="display: flex; align-items: flex-start;">
             <span style="font-size: 24px; margin-right: 12px;">🫁</span>
             <div>
               <strong style="color: #2e7d32; font-size: 17px;">Tar</strong>
               <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Residu lengket berwarna cokelat yang mengendap di paru-paru, merusak silia, dan pemicu utama kanker.</p>
             </div>
           </div>
         </div>
         <div style="background-color: #f5f5f5; padding: 15px; border-radius: 8px; border-left: 4px solid #d32f2f; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
           <div style="display: flex; align-items: flex-start;">
             <span style="font-size: 24px; margin-right: 12px;">💊</span>
             <div>
               <strong style="color: #c62828; font-size: 17px;">Nikotin</strong>
               <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Zat adiktif yang membuat kecanduan. Nikotin mencapai otak dalam 10 detik, meningkatkan detak jantung dan tekanan darah.</p>
             </div>
           </div>
         </div>
         <div style="background-color: #f5f5f5; padding: 15px; border-radius: 8px; border-left: 4px solid #f57c00; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
           <div style="display: flex; align-items: flex-start;">
             <span style="font-size: 24px; margin-right: 12px;">🌫️</span>
             <div>
               <strong style="color: #e65100; font-size: 17px;">Karbon Monoksida (CO)</strong>
               <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Gas beracun (sama seperti asap knalpot) yang mengikat hemoglobin darah, sehingga tubuh kekurangan oksigen.</p>
             </div>
           </div>
         </div>
         <div style="background-color: #f5f5f5; padding: 15px; border-radius: 8px; border-left: 4px solid #455a64; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
           <div style="display: flex; align-items: flex-start;">
             <span style="font-size: 24px; margin-right: 12px;">🧪</span>
             <div>
               <strong style="color: #37474f; font-size: 17px;">Logam Berat & Racun Lain</strong>
               <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Mengandung Arsenik (racun tikus), Timbal, Formaldehida (pengawet mayat), dan Benzena (pelarut industri).</p>
             </div>
           </div>
         </div>
       </div>
    </div>',
    '/public/modules/2.ZatBerbahaya.png',
    'VIDEO',
    'https://www.youtube.com/embed/96ZPwmtjpJQ?si=bojvnLlhkFINjDOA',
    'Animasi: Zat Berbahaya Dalam Rokok'
) ON CONFLICT (id) DO UPDATE SET text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 3: Mitos vs. Fakta Merokok (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    3, 1, 3,
    'Mitos vs. Fakta Merokok',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="color: #212121; margin-top: 0; font-size: 22px; display: flex; align-items: center; margin-bottom: 25px;">
         BANYAK YANG SALAH PAHAM
       </h2>
       <div style="background-color: #fff; border: 1px solid #e0e0e0; border-radius: 10px; margin-bottom: 20px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
         <div style="background-color: #ffebee; padding: 12px 20px; display: flex; align-items: center; border-bottom: 1px solid #ffcdd2;">
           <span style="font-size: 20px; margin-right: 12px;">❌</span>
           <strong style="color: #c62828; font-size: 17px;">MITOS:</strong>
           <span style="margin-left: 10px; color: #b71c1c;">Rokok ringan (mild), shisha, atau vape lebih aman.</span>
         </div>
         <div style="padding: 15px 20px; background-color: #f9fbe7; display: flex; align-items: flex-start;">
           <span style="font-size: 20px; margin-right: 12px;">✅</span>
           <div>
             <strong style="color: #33691e; font-size: 17px;">FAKTA:</strong>
             <p style="margin: 5px 0 0 0; color: #555;">Semua bentuk tembakau berbahaya. Vape mengandung nikotin dan zat kimia karsinogenik lainnya. Tidak ada batas aman dalam merokok.</p>
           </div>
         </div>
       </div>

       <div style="background-color: #fff; border: 1px solid #e0e0e0; border-radius: 10px; margin-bottom: 20px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
         <div style="background-color: #ffebee; padding: 12px 20px; display: flex; align-items: center; border-bottom: 1px solid #ffcdd2;">
           <span style="font-size: 20px; margin-right: 12px;">❌</span>
           <strong style="color: #c62828; font-size: 17px;">MITOS:</strong>
           <span style="margin-left: 10px; color: #b71c1c;">Merokok membuat saya tenang dan menghilangkan stres.</span>
         </div>
         <div style="padding: 15px 20px; background-color: #f9fbe7; display: flex; align-items: flex-start;">
           <span style="font-size: 20px; margin-right: 12px;">✅</span>
           <div>
             <strong style="color: #33691e; font-size: 17px;">FAKTA:</strong>
             <p style="margin: 5px 0 0 0; color: #555;">Efek tenang hanya sementara karena pemenuhan adiksi nikotin. Faktanya, ketergantungan rokok justru meningkatkan tingkat stres dan kecemasan jangka panjang.</p>
           </div>
         </div>
       </div>

       <div style="background-color: #fff; border: 1px solid #e0e0e0; border-radius: 10px; margin-bottom: 20px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
         <div style="background-color: #ffebee; padding: 12px 20px; display: flex; align-items: center; border-bottom: 1px solid #ffcdd2;">
           <span style="font-size: 20px; margin-right: 12px;">❌</span>
           <strong style="color: #c62828; font-size: 17px;">MITOS:</strong>
           <span style="margin-left: 10px; color: #b71c1c;">Saya masih muda, jadi belum berbahaya.</span>
         </div>
         <div style="padding: 15px 20px; background-color: #f9fbe7; display: flex; align-items: flex-start;">
           <span style="font-size: 20px; margin-right: 12px;">✅</span>
           <div>
             <strong style="color: #33691e; font-size: 17px;">FAKTA:</strong>
             <p style="margin: 5px 0 0 0; color: #555;">Kerusakan akibat rokok dimulai sejak hisapan pertama. Pada remaja, rokok mengganggu perkembangan otak dan paru-paru.</p>
           </div>
         </div>
       </div>

    </div>',
    '/public/modules/3.MitosFakta.png',
    NULL, NULL, NULL
) ON CONFLICT (id) DO UPDATE SET text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 4: Dampak Kesehatan (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    4, 1, 4,
    'Dampak Kesehatan',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="color: #212121; margin-top: 0; font-size: 22px; display: flex; align-items: center; justify-content: left;">
         <span style="font-size: 30px; margin-right: 10px;">🏥</span> DAMPAK KESEHATAN SERIUS
       </h2>
       <p style="text-align: left; margin-bottom: 25px; color: #555;">Merokok merusak hampir setiap organ tubuh, bukan hanya paru-paru.</p>

       <div style="display: grid; gap: 15px;">
         <div style="display: flex; align-items: center; padding: 15px; background-color: #fff; border-radius: 10px; border: 1px solid #e0e0e0; border-left: 5px solid #d32f2f; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
           <span style="font-size: 30px; margin-right: 15px;">🧠</span>
           <div>
             <strong style="text-transform: uppercase; color: #c62828; font-size: 17px;">Stroke & Penyakit Jantung</strong>
             <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Penyempitan dan kerusakan pembuluh darah, meningkatkan risiko serangan jantung dan stroke fatal.</p>
           </div>
         </div>
         <div style="display: flex; align-items: center; padding: 15px; background-color: #fff; border-radius: 10px; border: 1px solid #e0e0e0; border-left: 5px solid #f57c00; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
           <span style="font-size: 30px; margin-right: 15px;">🛡️</span>
           <div>
             <strong style="text-transform: uppercase; color: #e65100; font-size: 17px;">Sistem Imun Melemah</strong>
             <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Perokok lebih mudah sakit dan proses penyembuhan luka menjadi lebih lambat.</p>
           </div>
         </div>
         <div style="display: flex; align-items: center; padding: 15px; background-color: #fff; border-radius: 10px; border: 1px solid #e0e0e0; border-left: 5px solid #d32f2f; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
           <span style="font-size: 30px; margin-right: 15px;">⚠️</span>
           <div>
             <strong style="text-transform: uppercase; color: #c62828; font-size: 17px;">Gangguan Reproduksi</strong>
             <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Menyebabkan impotensi pada pria, gangguan kesuburan, dan risiko komplikasi kehamilan pada wanita.</p>
           </div>
         </div>
         <div style="display: flex; align-items: center; padding: 15px; background-color: #fff; border-radius: 10px; border: 1px solid #e0e0e0; border-left: 5px solid #1976d2; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
           <span style="font-size: 30px; margin-right: 15px;">🦷</span>
           <div>
             <strong style="text-transform: uppercase; color: #1565c0; font-size: 17px;">Kerusakan Mulut & Kulit</strong>
             <p style="margin: 5px 0 0 0; color: #555; font-size: 15px;">Bau mulut, gigi kuning, penyakit gusi, kanker mulut, dan penuaan dini pada kulit (keriput).</p>
           </div>
         </div>
       </div>
    </div>',
    '/public/modules/4.DampakKesehatan.png',
    'VIDEO',
    'https://www.youtube.com/embed/273CDxUJdAA?si=dCHD6lET2IKTihCJ',
    'Animasi: Vape/Rokok Elektrik dan Rokok'
) ON CONFLICT (id) DO UPDATE SET text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 5: Perokok Pasif (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    5, 1, 5,
    'Perokok Pasif',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="text-transform: uppercase; color: #2e7d32; margin-top: 0; font-size: 22px; display: flex; align-items: center;">
         <span style="text-transform: uppercase; font-size: 28px; margin-right: 10px;">🌬️</span> Bahaya Bagi Orang Lain
       </h2>
       <div style="background-color: #fff3e0; padding: 20px; border-radius: 10px; border: 1px solid #ffe0b2; margin-bottom: 20px;">
         <p style="font-size: 17px; color: #e65100; margin: 0; text-align: left;">
           <strong>Perokok Pasif</strong> (orang yang menghirup asap rokok orang lain) memiliki risiko kesehatan serius, bahkan jika mereka tidak pernah merokok.
         </p>
       </div>

       <div style="display: grid; gap: 20px;">
         <div style="background-color: #f9f9f9; padding: 20px; border-radius: 10px; border-left: 5px solid #d32f2f; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
           <div style="display: flex; align-items: center; margin-bottom: 5px;">
             <span style="font-size: 28px; margin-right: 12px;">👶</span>
             <strong style="text-transform: uppercase; color: #c62828; font-size: 18px;">Dampak pada Anak & Bayi</strong>
           </div>
           <ul style="color: #555; margin: 0; font-size: 15px; line-height: 1.7;">
             <li>1. Meningkatkan risiko Sindrom Kematian Bayi Mendadak (SIDS).</li>
             <li>2. Terkena infeksi telinga, batuk, pilek, dan serangan asma yang lebih parah.</li>
             <li>3. Menghambat pertumbuhan paru-paru anak.</li>
           </ul>
         </div>
         <div style="background-color: #f9f9f9; padding: 20px; border-radius: 10px; border-left: 5px solid #2e7d32; box-shadow: 0 2px 5px rgba(0,0,0,0.05);">
           <div style="display: flex; align-items: center; margin-bottom: 5x;">
             <span style="font-size: 28px; margin-right: 12px;">🏠</span>
             <strong style="text-transform: uppercase; color: #2e7d32; font-size: 18px;">Lindungi Keluarga Anda</strong>
           </div>
           <p style="color: #555; margin: 0; font-size: 15px;">
             Tidak ada tingkat paparan asap rokok yang aman. Menjadikan rumah dan kendaraan anda zona 100% bebas rokok adalah satu-satunya cara melindungi keluarga.
           </p>
         </div>
       </div>
    </div>',
    '/public/modules/5.PerokokPasif.png',
    NULL, NULL, NULL
) ON CONFLICT (id) DO UPDATE SET text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 6: Dampak Sosial dan Ekonomi (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    6, 1, 6,
    'Dampak Sosial dan Ekonomi',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="text-transform: uppercase; color: #2e7d32; margin-top: 0; font-size: 22px; text-align: left; margin-bottom: 25px;">Lebih dari Sekadar Masalah Kesehatan</h2>
       <div style="display: grid; gap: 20px;">
         <div style="background-color: #fff; padding: 22px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); border: 1px solid #e0e0e0; border-top: 4px solid #2e7d32;">
           <div style="display: flex; align-items: center; margin-bottom: 5px;">
             <span style="font-size: 32px; margin-right: 15px; color: #2e7d32;">💸</span>
             <strong style="text-transform: uppercase; color: #2e7d32; font-size: 20px;">Kerugian Finansial (Pemborosan)</strong>
           </div>
           <p style="color: #555; margin: 0; font-size: 16px; line-height: 1.7;">
             Jika satu bungkus rokok seharga Rp25.000 sehari, setahun anda membakar <strong>Rp9.125.000</strong>. Bayangkan apa yang bisa anda beli, tabung, atau investasikan dengan uang tersebut.
           </p>
         </div>
         <div style="background-color: #fff; padding: 22px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); border: 1px solid #e0e0e0; border-top: 4px solid #1976d2;">
           <div style="display: flex; align-items: center; margin-bottom: 5px;">
             <span style="font-size: 32px; margin-right: 15px; color: #1976d2;">🤝</span>
             <strong style="text-transform: uppercase; color: #1565c0; font-size: 20px;">Dampak Sosial & Penampilan</strong>
           </div>
           <p style="color: #555; margin: 0; font-size: 16px; line-height: 1.7;">
             Bau asap yang menempel di baju, rambut, dan napas bisa mengganggu orang lain. Gigi kuning dan kulit kusam memengaruhi penampilan. Anda tetap bisa bergaul, terlihat keren, dan diterima tanpa harus merokok. Teman sejati akan mendukung kesehatanmu.
           </p>
         </div>
       </div>
    </div>',
    '/public/modules/6.SosialEkonomi.png',
    NULL, NULL, NULL
) ON CONFLICT (id) DO UPDATE SET text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 7: Aturan dan Hak Bukan Perokok (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    7, 1, 7,
    'Aturan dan Hak Bukan Perokok',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="text-transform: uppercase; color: #2e7d32; margin-top: 0; font-size: 22px; display: flex; align-items: center;">
         <span style="font-size: 28px; margin-right: 10px; margin-bottom: 10px;">⚖️</span> Kawasan Tanpa Rokok (KTR)
       </h2>

       <div style="background-color: #f1f8e9; padding: 25px; border-radius: 12px; border-left: 5px solid #2e7d32; margin-bottom: 25px;">
         <p style="font-size: 17px; color: #33691e; margin-bottom: 20px; line-height: 1.8;">
           Tahukah kamu? Pemerintah telah menetapkan aturan tegas mengenai <strong style="color: #2e7d32;">Kawasan Tanpa Rokok (KTR)</strong> untuk melindungi masyarakat.
         </p>
         <p style="color: #555; margin-bottom: 10px;">Tempat-tempat KTR antara lain:</p>
         <ul style="color: #555; display: grid; grid-template-columns: 1fr 1fr; gap: 10px; padding-left: 20px; margin-bottom: 20px;">
            <li>🏫 Sekolah & Kampus</li><li>🏥 Fasilitas Kesehatan</li>
            <li>🚌 Angkutan Umum</li><li>🕌 Tempat Ibadah</li>
            <li>🎡 Tempat Bermain Anak</li><li>🏢 Tempat Kerja</li>
         </ul>

         <div style="background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.05); border: 1px solid #c5e1a5;">
           <strong style="color: #2e7d32; font-size: 18px; display: flex; align-items: center;"><span style="margin-right: 10px;">✋</span> Hak Anda Sebagai Bukan Perokok:</strong>
           <p style="margin-top: 10px; color: #555; font-size: 16px;">
             Anda memiliki hak fundamental untuk menghirup udara bersih. Jangan ragu untuk dengan sopan meminta orang lain mematikan rokoknya jika mereka merokok di area KTR atau di dekat anda. Ini demi kesehatan bersama.
           </p>
         </div>
       </div>
    </div>',
    '/public/modules/7.AturanHak.png',
    NULL, NULL, NULL
) ON CONFLICT (id) DO UPDATE SET title = EXCLUDED.title, text_content = EXCLUDED.text_content, step_order = EXCLUDED.step_order, image_url = EXCLUDED.image_url;

-- STEP 8: Hidup Lebih Baik Tanpa Rokok (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    8, 1, 8,
    'Hidup Lebih Baik Tanpa Rokok',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="text-transform: uppercase; color: #2e7d32; margin-top: 0; font-size: 22px; text-align: left; margin-bottom: 10px;">
         <span style="font-size: 24px;">🌟</span>
         Tubuh Mulai Pulih
       </h2>
       <p style="text-align: left; color: #555; margin-bottom: 25px;">Manfaat berhenti merokok dimulai segera setelah rokok terakhir anda:</p>

       <div style="display: grid; gap: 15px; margin-bottom: 30px;">
         <div style="background-color: #e8f5e9; padding: 18px; border-radius: 10px; border-left: 4px solid #43a047; display: flex; align-items: center;">
           <span style="font-size: 24px; margin-right: 15px; color: #2e7d32;">⏱️</span>
           <div>
             <strong style="color: #2e7d32; font-size: 18px; display: block;">20 Menit Pertama</strong>
             <span style="color: #555;">Tekanan darah dan denyut jantung mulai kembali normal. Suhu tangan dan kaki meningkat.</span>
           </div>
         </div>
         <div style="background-color: #e8f5e9; padding: 18px; border-radius: 10px; border-left: 4px solid #43a047; display: flex; align-items: center;">
           <span style="font-size: 24px; margin-right: 15px; color: #2e7d32;">🗓️</span>
           <div>
             <strong style="color: #2e7d32; font-size: 18px; display: block;">2 Minggu - 3 Bulan</strong>
             <span style="color: #555;">Sirkulasi darah membaik. Fungsi paru-paru meningkat hingga 30%. Napas terasa lebih lega dan energi bertambah.</span>
           </div>
         </div>
         <div style="background-color: #e8f5e9; padding: 18px; border-radius: 10px; border-left: 4px solid #43a047; display: flex; align-items: center;">
           <span style="font-size: 24px; margin-right: 15px; color: #2e7d32;">🎂</span>
           <div>
             <strong style="color: #2e7d32; font-size: 18px; display: block;">1 Tahun Bebas Rokok</strong>
             <span style="color: #555;">Risiko tambahan terkena penyakit jantung koroner berkurang menjadi setengah dari risiko seorang perokok.</span>
           </div>
         </div>
       </div>
       <p style="text-align: left; color: #2e7d32; font-weight: bold; font-size: 18px; background-color: #f1f8e9; padding: 15px; border-radius: 8px;">
         Berhenti merokok adalah investasi kesehatan yang bisa anda lakukan!
       </p>
    </div>',
    '/public/modules/8.TanpaRokok.png',
    'VIDEO',
    'https://www.youtube.com/embed/DB9n7aNM6q0?si=3ja18y0CRc0xy0bC',
    'Animasi: Hidup Tanpa Rokok'
) ON CONFLICT (id) DO UPDATE SET step_order = EXCLUDED.step_order, text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 9: Tips Berhenti Merokok (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    9, 1, 9,
    'Tips Berhenti Merokok',
    '<div style="padding: 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333;">
       <h2 style="text-transform: uppercase; color: #2e7d32; margin-top: 0; font-size: 22px; text-align: left; margin-bottom: 10px;">
         <span style="font-size: 32px; margin-right: 10px;">💪</span> Metode 4D
       </h2>
       <div style="background-color: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); border: 1px solid #e0e0e0;">
         <p style="color: #555; text-align: left; margin-bottom: 25px; font-size: 16px;">
           Saat keinginan kuat untuk merokok (craving) datang, ingatlah bahwa rasa itu hanya bertahan beberapa menit. Lawan dengan <strong>4D</strong>:
         </p>
         <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
           <div style="background-color: #f5f5f5; padding: 20px; border-radius: 10px; border-top: 4px solid #ef5350; text-align: center;">
             <span style="font-size: 32px; display: block; margin-bottom: 10px;">⏳</span>
             <strong style="text-transform: uppercase; color: #c62828; font-size: 18px; display: block;">1. Delay (Tunda)</strong>
             <p style="margin: 10px 0 0 0; color: #555; font-size: 15px;">Tunda keinginan itu. Katakan "nanti 10 menit lagi". Biasanya keinginan itu akan hilang sendiri.</p>
           </div>
           <div style="background-color: #f5f5f5; padding: 20px; border-radius: 10px; border-top: 4px solid #42a5f5; text-align: center;">
             <span style="font-size: 32px; display: block; margin-bottom: 10px;">🧘</span>
             <strong style="text-transform: uppercase; color: #1565c0; font-size: 18px; display: block;">2. Deep Breath (Napas)</strong>
             <p style="margin: 10px 0 0 0; color: #555; font-size: 15px;">Tarik napas dalam-dalam lewat hidung, keluarkan perlahan lewat mulut. Ulangi 3x sampai rileks.</p>
           </div>
           <div style="background-color: #f5f5f5; padding: 20px; border-radius: 10px; border-top: 4px solid #66bb6a; text-align: center;">
             <span style="font-size: 32px; display: block; margin-bottom: 10px;">💧</span>
             <strong style="text-transform: uppercase; color: #2e7d32; font-size: 18px; display: block;">3. Drink Water (Minum)</strong>
             <p style="margin: 10px 0 0 0; color: #555; font-size: 15px;">Minum air putih secara perlahan. Ini membantu membasuh tenggorokan dan mengalihkan rasa ingin.</p>
           </div>
           <div style="background-color: #f5f5f5; padding: 20px; border-radius: 10px; border-top: 4px solid #ffa726; text-align: center;">
             <span style="font-size: 32px; display: block; margin-bottom: 10px;">🏃</span>
             <strong style="text-transform: uppercase; color: #e65100; font-size: 18px; display: block;">4. Do Something Else</strong>
             <p style="margin: 10px 0 0 0; color: #555; font-size: 15px;">Alihkan perhatian! Berolahraga, mengunyah permen karet bebas gula, atau ngobrol dengan teman yang mendukung.</p>
           </div>
         </div>
       </div>
    </div>',
    '/public/modules/9.TipsBerhenti.png',
    NULL, NULL, NULL
) ON CONFLICT (id) DO UPDATE SET step_order = EXCLUDED.step_order, text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;

-- STEP 10: Game Teka-Teki Silang (Tema Terang & Hijau)
INSERT INTO steps (id, module_id, step_order, title, text_content, image_url, interactive_type, interactive_url, media_description)
VALUES (
    10, 1, 10,
    'Game Teka-Teki Silang',
    '<div style="padding: 40px 20px; font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 1.6; color: #333; text-align: center;">
       <div style="margin-bottom: 15px;">
         <h2 style="text-transform: uppercase; color: #2e7d32; font-size: 28px; margin: 10px 0 5px 0;"><span style="font-size: 45px; color: #2e7d32;">🎮</span> FUN TIME!</h2>
         <p style="color: #777; font-size: 18px; margin: 0;">Tema: Bahaya & Manfaat Berhenti Merokok</p>
       </div>
       <div style="background-color: #f1f8e9; padding: 30px; border-radius: 15px; border: 2px solid #a5d6a7; max-width: 600px; margin: 0 auto; box-shadow: 0 4px 10px rgba(0,0,0,0.05);">
         <p style="color: #33691e; font-size: 18px; margin-bottom: 20px;">
           Sudah paham semua materi sebelumnya? Mari kita buktikan dengan menyelesaikan tantangan Teka-Teki Silang ini!
         </p>
         <p style="color: #555; font-size: 16px;">Klik tombol di bawah untuk memulai permainan.</p>
       </div>
    </div>',
    '/public/modules/10.Game.png',
    'GAME',
    'https://www.educaplay.com/game/25878514-crossword_puzzle_9.html',
    'Teka-Teki Silang'
) ON CONFLICT (id) DO UPDATE SET step_order = EXCLUDED.step_order, text_content = EXCLUDED.text_content, image_url = EXCLUDED.image_url;