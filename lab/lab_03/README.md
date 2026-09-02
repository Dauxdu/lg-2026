# Лабораторная работа №3

## Задание 1. Основные команды git.

### 1. Создайте новый git репозиторий в пустой директории.

```bash
git config --global user.name "dauxdu"
git config --global user.email "dauxdu@example.com"
```

```bash
git init
git status
```

### 2. Внутри директории создайте файл text.txt и выполните коммит данного файла в репозиторий.

```bash
echo "Linux" > text.txt
git add text.txt
git commit -m "Add Linux"
git log
```

### 3. Измените файл и выполните коммит внесенных изменений в репозиторий.

```bash
echo "Git" >> text.txt
git add text.txt
git commit -m "Add Git"
git log
```

### 4. Выполните откат изменений и вернитесь к предыдущему коммиту. Просмотрите файл и убедитесь, что перед вами его предыдущая версия.

```bash
git checkout HEAD~1
cat text.txt
git switch master
```

### 5. Сравните две версии файла и изучите вашу историю коммитов.

```bash
git diff HEAD~1 HEAD
git log
```

## Задание 2. Базовые навыки работы с ветками git.

### 1. Разделите ваш репозиторий на две ветки.

```bash
git branch slave
# or
git switch -c slave
```

### 2. Измените текущую ветку.

```bash
git checkout slave
```

### 3. Измените файл и выполните коммит на каждой из веток.

```bash
echo "100503D" >> text.txt
git add text.txt
git commit -m "Add 100503D"
```

```bash
git switch master
echo "2026" >> text.txt
git add text.txt
git commit -m "Add 2026"
```

### 4. Выполните слияние двух веток.

```bash
git merge slave
# fix conflicts
git add text.txt
git commit -m "Fix"
```

```bash
git log --oneline --graph
```

### 5. Выполните уровни из раздела основы руководства по git на сайте: https://learngitbranching.js.org/?locale=ru_RU.

#### level intro1

```bash
git commit
git commit
```

#### level intro2

```bash
git branch bugFix
git checkout bugFix
```

or

```bash
git checkout -b bugFix
```

#### level intro3

```bash
git checkout -b bugFix
git commit
git checkout main
git commit
git marge bugFix
```

#### level intro4

```bash
git checkout -b bugFix
git commit
git checkout main
git commit
git checkout bugFix
git rebase main
```
