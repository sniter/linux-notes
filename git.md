# Git

## Объединение коммитов

```
git reset --soft HEAD~3
git commit -m "Uniting last 3 commits"
```

## Удаление веток, в т.ч. на удаленном серваке

```
git branch -D issue/5535
git push origin --delete issues/5535
```

## Подготовка патча

```
git diff --no-color commit1..commit2 > patch.txt
```


## Применение патча

```
git apply patch.txt
```

