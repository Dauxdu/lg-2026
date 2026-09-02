# Лабораторная работа №2

## Задание 1. Локальные и глобальные переменные среды.

### 1. Просмотрите существующие в вашей системе глобальные и локальные переменные среды.

```bash
env
# or
printenv
```

### 2. Добавьте новую локальную переменную с именем MY_LOCAL_VAR и установите ее значение равным “local_var_value”. Откройте терминал в новом окне и проверьте наличие созданной переменной.

```bash
MY_LOCAL_VAR="local_var_value"
```

```bash
env | grep MY_LOCAL_VAR
# or
env | grep local_var_value
```

### 3. Используя конфигурационный файл .bashrc создайте переменную оболочки с именем MY_SHELL_VAR и значением равным “shell_var_value”. Убедитесь, что она доступна в любом окне терминала.

```bash
echo 'MY_SHELL_VAR="shell_var_value"' >> ~/.bashrc
```

```bash
env | grep MY_SHELL_VAR
# or
env | grep shell_var_value
```

### 4. Используя файл environment в /etc/environment создайте глобальную переменную MY_GLOBAL_VAR со значением "global_var_value". Проверьте ее доступность в новом окне терминала. Выполните команду python3 -c 'import os; print(os.getenv("MY_GLOBAL_VAR"))' и убедитесь, что вы получили значение переменной.

```bash
echo 'MY_GLOBAL_VAR="global_var_value"' | sudo tee -a /etc/environment
```

## Задание 2. Пользователи, группы и права доступа.

### 1. Для текущего пользователя системы вывести все группы, в которых он состоит.

```bash
groups
```

### 2. Создайте группу “new_group” с произвольным паролем, новую директорию и файл test_file.txt внутри этой директории, содержащий произвольную информацию.

```bash
sudo groupadd new_group
sudo gpasswd new_group
mkdir -p new_group_dir
echo "test_text" > new_group_dir/test_file.txt
```

### 3. Запретите чтение, запись и исполнение файла test_file.txt для всех остальных пользователей. Для данного файла измените закрепленную за ним группу пользователей на new_group, а владельца файла на root.

```bash
chmod 770 new_group_dir/test_file.txt
sudo chown root:new_group new_group_dir/test_file.txt
ls -lh new_group_dir/test_file.txt
```

### 4. Попробуйте записать новую информацию в файл. Добавьте текущего пользователя в группу new_group и добавьте в конец файла строку "User currently in the group".

```bash
echo "test" >> new_group_dir/test_file.txt
```

```bash
sudo usermod -aG new_group $USER
newgrp new_group
```

```bash
echo "User currently in the group" >> new_group_dir/test_file.txt
cat new_group_dir/test_file.txt
```

## Задание 3. Символические ссылки и псевдонимы.

### 1. Создайте символическую ссылку с именем tf на новый файл test_file.txt в любой директории указанной в $PATH. Запретите чтение, запись и выполнение ссылки для группы и всех остальных пользователей. Измените владельца файла на root. Проверьте, сохранился ли у вас доступ к файлу по ссылке? Присутствует ли у вас доступ к файлу напрямую?

```bash
sudo ln -s "$PWD/new_group_dir/test_file.txt" /usr/local/bin/tf
sudo chown root "$PWD/new_group_dir/test_file.txt"
```

### 2. Создайте сокращение lr, которое будет эквивалентно выполнению в терминале команды ls -l. Проверьте работу сокращения. Закройте текущее окно терминала и попробуйте применить сокращение снова. Используя конфигурационный файл .bashrc обеспечьте возможность выполнения сокращенной команды для любого окна терминала.

```bash
alias lr='ls -l'
lr
```

```bash
echo "alias lr='ls -l'" >> ~/.bashrc
```

## Задание 4. Управление процессами. Мультиплексоры.

### 1. Просмотрите список активных задач. Запустите произвольную задачу в фоновом режиме. Отложите выполнение произвольной задачи, а затем возобновите ее с передачей управления над ней на активный терминал.

```bash
jobs
sleep 1000 & traceroute ssau.ru
```

Приостановка процесса: `Ctrl + Z`

```bash
fg
```

Завершение процесса `Ctrl + C`

### 2. Используя tmux создайте две новые сессии. В первой выполните команду cat, а во второй echo "the second session". Подключитесь к первой сессии и остановите задачу cat. Отключитесь от сессии и завершите ее. Закройте окно терминала. Открыв новое окно терминала подключитесь ко второй сессии и выполните произвольную команду.

```bash
sudo apt install tmux
```

```bash
tmux new-session -d -s session1
tmux new-session -d -s session2

tmux send-keys -t session1 'cat' Enter
tmux send-keys -t session2 'echo "the second session"' Enter
```

```bash
tmux attach -t session1
```

Отключиться от сессии `Ctrl + B + D`

Завершить сессию от сессии `Ctrl + D`

```bash
tmux kill-session -t session1
```

```bash
tmux attach -t session2
id
```
