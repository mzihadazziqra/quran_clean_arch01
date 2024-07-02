import json

# Path ke file JSON
file_path = 'lib/core/data/quran/all_surahs.json'

# Fungsi untuk mengubah struktur audioFull
def update_audio_full(data):
    for surah in data:
        if "audioFull" in surah:
            audio_full = surah["audioFull"]
            # Buat struktur baru
            new_audio_full = {
                "Abdullah-Al-Juhany": audio_full.get("01"),
                "Abdul-Muhsin-Al-Qasim": audio_full.get("02"),
                "Abdurrahman-as-Sudais": audio_full.get("03"),
                "Ibrahim-Al-Dossari": audio_full.get("04"),
                "Misyari-Rasyid-Al-Afasi": audio_full.get("05")
            }
            # Update data dengan struktur baru
            surah["audioFull"] = new_audio_full
    return data

# Membaca file JSON
with open(file_path, 'r', encoding='utf-8') as file:
    data = json.load(file)

# Mengubah struktur audioFull
updated_data = update_audio_full(data)

# Menulis kembali ke file JSON
with open(file_path, 'w', encoding='utf-8') as file:
    json.dump(updated_data, file, ensure_ascii=False, indent=4)

print("Struktur audioFull telah diperbarui.")
