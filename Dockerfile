# Use uma imagem base oficial do Python
FROM python:3.10-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
# --no-cache-dir: Desativa o cache para manter o tamanho da imagem menor
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# O comando para executar a aplicação será especificado no docker-compose.yml,
# mas é uma boa prática ter um comando padrão aqui.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]