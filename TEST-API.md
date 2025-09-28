# 🧪 Тестирование API предсказателя

## 1. Тест основной игры

### Проверьте, что API работает:
```bash
# Откройте в браузере:
https://1waion-life.vercel.app/predictor-api/mines/debug/state?playerId=test_user_123
```

**Ожидаемый ответ:**
```json
{
  "sessionId": null,
  "lastRound": 0,
  "bombs": [],
  "revealed": [],
  "safe": [],
  "balance": 1000,
  "currency": "RUB",
  "minesLeft": null,
  "gameState": "No active session",
  "playerId": "test_user_123"
}
```

## 2. Тест предсказателя

### Проверьте подключение:
```bash
# Откройте в браузере:
https://predictorver-roua.vercel.app/predictor-api/mines/debug/state?playerId=test_user_123
```

**Ожидаемый ответ:** Тот же JSON, что и выше (данные от основной игры)

## 3. Полный тест

### Шаг 1: Откройте основную игру
1. Перейдите на `https://1waion-life.vercel.app`
2. Нажмите F12 → Console
3. Скопируйте Player ID

### Шаг 2: Начните игру
1. Поставьте ставку
2. Начните игру
3. Сделайте несколько ходов

### Шаг 3: Откройте предсказатель
1. Перейдите на `https://predictorver-roua.vercel.app`
2. Введите Player ID
3. Предсказатель должен показать мины!

## 4. Отладка

### Если API не работает:
```javascript
// Проверьте в консоли браузера:
fetch('https://1waion-life.vercel.app/predictor-api/mines/debug/state?playerId=YOUR_ID')
  .then(r => r.json())
  .then(console.log)
  .catch(console.error);
```

### Если предсказатель не работает:
1. Проверьте консоль на ошибки CORS
2. Убедитесь, что Player ID правильный
3. Проверьте, что основная игра запущена

## 5. Логи

### В основной игре:
- API запросы логируются в консоль
- Ошибки CORS показываются в Network tab

### В предсказателе:
- Ошибки подключения к основной игре
- Статус ответов от API
