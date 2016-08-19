# Работа с Journalctl
```
journalctl
```

## Размер журнала

```
journalctl --disk-usage
```

## Журнал последней сессии

```
journalctl -b
```
	
## Варианты очистки журнала (По времени, по размеру)
```
journalctl --vacuum-time=2d
journalctl --vacuum-size=500M
```