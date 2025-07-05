#PARA CONSTRUIR A IMAGEM DO DOCKER


# Use uma imagem oficial do Python como base
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependências para o container
COPY requirements.txt ./

# Instala as dependências
#no cache faz com q   sempre fique de olho p ver se n alterou algo, roda tudo
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante da aplicação para o container
COPY . .

# Expõe a porta que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação
# Define o comando padrão q sera executado quando o container for iniciado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# marvel para obter o certificado  

