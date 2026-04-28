
Принудительно освободите флешку
Эта команда найдет и «убьет» все процессы, которые используют любые тома на вашей флешке. Просто скопируйте и вставьте это в Терминал, нажмите Enter и введите свой пароль:

bash
sudo kill -9 $(lsof | grep "/Volumes/USB" | awk '{print $2}' | sort -u)
Размонтируйте разделы
Теперь дайте системе понять, что вы «главный»:

bash
sudo diskutil unmountDisk force /dev/disk6
Запустите создание установщика
Теперь, когда флешка абсолютно свободна, немедленно выполняйте знакомую вам команду:

bash
sudo /Applications/Install\ macOS\ Sequoia.app/Contents/Resources/createinstallmedia --volume /Volumes/USB
