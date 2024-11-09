FROM python:3.9-slim

# Установка зависимостей для сборки
RUN apt-get update && \
    apt-get install -y build-essential python3-dev

# Обновление pip и установка необходимых пакетов
RUN pip install --upgrade pip
RUN pip install build pybind11 numpy scipy

# Копирование кода для сборки пакета в контейнер
WORKDIR /packages
COPY ./linalg-packages /packages

# Сборка пакета
RUN python3 -m build

# Установка пакета
RUN pip install dist/*.whl

# Копирование тестового скрипта
WORKDIR /app
COPY test_entropy.py /app

# Запуск тестового скрипта при запуске контейнера
CMD ["python3", "test_entropy.py"]
