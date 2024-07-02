import os
import json

# Direktori di mana file JSON surah berada
directory = 'lib/core/data/quran/surah/'

# List untuk menampung semua data surah
all_surahs = []

# Membaca setiap file JSON di direktori dalam urutan numerik
for i in range(1, 115):
    filename = f'{i}.json'
    filepath = os.path.join(directory, filename)
    with open(filepath, 'r', encoding='utf-8') as file:
        data = json.load(file)
        all_surahs.append(data)

# Direktori output dan nama file output
output_directory = 'lib/core/data/quran/'
output_filename = 'all_surahs.json'
output_filepath = os.path.join(output_directory, output_filename)

# Menyimpan semua data surah ke dalam satu file JSON
with open(output_filepath, 'w', encoding='utf-8') as output_file:
    json.dump(all_surahs, output_file, ensure_ascii=False, indent=4)

print(f"Semua file surah telah digabungkan dan disimpan dalam {output_filepath}")
