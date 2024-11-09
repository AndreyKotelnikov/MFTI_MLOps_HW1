# MLOps ДЗ-1: Python пакет с биндингами


## Шаг 1: Реализовать функцию на C++

Была выбрана функция Vector Entropy: Implement a function to calculate the entropy of a vector representing a probability distribution.

Функция `vector_entropy` принимает вектор вероятностей и вычисляет его энтропию по формуле:

$$
\begin{aligned}
    & H(p) = -\sum_{i} p_i \log p_i
\end{aligned}
$$


Функция реализована в файлах `entropy.cpp` и `entropy.h` (путь linalg-packages/vector-entropy/src)


## Шаг 2: Обернуть функцию с помощью Pybind11 и создать Makefile

В файле `bindings.cpp` (путь linalg-packages/vector-entropy/python) созданы биндинги для функции `vector_entropy` с помощью Pybind11, чтобы она была доступна из Python.

И создан файл `Makefile` (путь linalg-packages) для компиляции C++ кода и сборки модуля Python.


## Шаг 3: Подготовить Python-пакет

Созданы файлы `pyproject.toml`, `setup.py` и `MANIFEST.in` для сборки пакета. (путь linalg-packages)


## Шаг 4: Сборка и установка пакета внутри Docker

Создан `Dockerfile`, который настроит окружение, соберет пакет и установит его.

Для удобства запуска `Dockerfile` был создан `docker-compose.yml`


## Шаг 5: Проверка работоспособности

Создан тестовый скрипт `test_entropy.py`, который сравнивает результат нашей функции из C++ с эталонной реализацией из библиотеки SciPy.

Запуск скрипта прописан в `Dockerfile` при старте docker контейнера


# Запуск проекта

Для сборки и запуска проекта в docker контейнере требуется:
- Передти в консоле в корневую дирекорию проекта
- И выполнить команду: `docker compose up --build`