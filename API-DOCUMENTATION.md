# 🔗 API для предсказателя

## Новые эндпоинты в основной игре

### 1. Получение состояния игры
```
GET /predictor-api/mines/debug/state?playerId=user_xxx
```

**Ответ:**
```json
{
  "sessionId": "abc123",
  "lastRound": 2,
  "bombs": [{"col": 1, "row": 2}, {"col": 3, "row": 4}],
  "revealed": [{"col": 0, "row": 0}],
  "safe": [{"col": 2, "row": 1}],
  "balance": 1000,
  "currency": "RUB",
  "minesLeft": 3,
  "gameState": "Active",
  "playerId": "user_xxx",
  "bet": 100,
  "coefficient": 1.24,
  "availableCashout": 124
}
```

### 2. Информация о пользователе
```
GET /predictor-api/mines/user?playerId=user_xxx
```

**Ответ:**
```json
{
  "id": "user_xxx",
  "balance": 1000,
  "currency": "RUB",
  "name": "Player",
  "hasActiveSession": true,
  "sessionId": "abc123"
}
```

### 3. История игр
```
GET /predictor-api/mines/history?playerId=user_xxx
```

**Ответ:**
```json
{
  "history": [
    {
      "id": "game1",
      "state": "Win",
      "bet": 100,
      "coefficient": 2.5,
      "startDate": "2025-09-28T19:00:00Z"
    }
  ],
  "playerId": "user_xxx"
}
```

## Как использовать:

### В предсказателе:
```javascript
// Получить состояние игры
const response = await fetch('https://1waion-life.vercel.app/predictor-api/mines/debug/state?playerId=user_xxx');
const gameData = await response.json();

// Получить информацию о пользователе
const userResponse = await fetch('https://1waion-life.vercel.app/predictor-api/mines/user?playerId=user_xxx');
const userData = await userResponse.json();
```

## CORS настройки:
- ✅ `Access-Control-Allow-Origin: *`
- ✅ `Access-Control-Allow-Methods: GET, POST, OPTIONS`
- ✅ `Access-Control-Allow-Headers: Content-Type, Cache-Control, X-User-ID`

## Безопасность:
- Player ID передается через query parameter или заголовок X-User-ID
- Данные возвращаются только для существующих пользователей
- Внутренние данные игры (мины) не раскрываются в обычном API
