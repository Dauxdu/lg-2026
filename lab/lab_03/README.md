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

#### level rampup1

```bash
git checkout C4
```

#### level rampup2

```bash
git checkout bugFix^
```

#### level rampup3

```bash
git branch -f main C6
git checkout C1
git branch -f bugFix HEAD~1
```

#### level rampup4

```bash
git reset HEAD~1
git revert C2
```

#### level move1

```bash
git cherry-pick C3 C4 C7
```

#### level move2

```bash
git rebase -i overHere
```

#### level move3

```bash
git add app.js
git commit
git add styles.css
git commit
```

#### level move4

```bash
git restore --staged secret.env
git restore experiment.js
git commit
```

#### level mixed1

```bash
git rebase -i main
git branch -f main bugFix
```

#### level mixed2

```bash
git rebase -i main
git commit --amend
git rebase -i main
git branch -f main caption
```

#### level mixed3

```bash
git checkout main
git cherry-pick C2
git branch -f main HEAD~1
git cherry-pick C2 C3
```

#### level mixed4

```bash
git tag v0 C1
git tag v1 C2
git checkout v1
```

#### level mixed5

```bash
git commit
```

#### level advanced1

```bash
git rebase main bugFix
git rebase bugFix side
git rebase side another
git branch -f main HEAD
```

#### level advanced2

```bash
git branch bugWork HEAD~^2~
```

#### level advanced3

```bash
git checkout one
git cherry-pick C4 C3 C2
git checkout two
git cherry-pick C5 C4 C3 C2
git branch -f three main~3
```
