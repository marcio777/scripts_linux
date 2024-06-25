#!/bin/bash

# Verifica se o Python está instalado
if ! command -v python3 &> /dev/null
then
    echo "Python3 não está instalado. Por favor, instale o Python3."
    exit
else
    echo "Python3 está instalado."
fi

# Verifica se o pip está instalado
if ! command -v pip3 &> /dev/null
then
    echo "pip3 não está instalado. Instalando pip3..."
    sudo apt-get install -y python3-pip
else
    echo "pip3 está instalado."
fi

# Verifica se o ffmpeg está instalado
if ! command -v ffmpeg &> /dev/null
then
    echo "ffmpeg não está instalado. Instalando ffmpeg..."
    sudo apt-get install -y ffmpeg
else
    echo "ffmpeg está instalado."
fi

# Cria um ambiente virtual
if [ ! -d "venv" ]; then
    echo "Criando um ambiente virtual..."
    python3 -m venv venv
else
    echo "Ambiente virtual já existe."
fi

# Ativa o ambiente virtual
source venv/bin/activate

# Instala pacotes necessários
pip install --upgrade pip
pip install SpeechRecognition pydub

# Desativa o ambiente virtual
deactivate

# Cria um arquivo settings.json para o VS Code
VSCODE_DIR=".vscode"
if [ ! -d "$VSCODE_DIR" ]; then
    mkdir $VSCODE_DIR
fi

cat <<EOL > $VSCODE_DIR/settings.json
{
    "python.pythonPath": "\${workspaceFolder}/venv/bin/python3",
    "python.analysis.extraPaths": [
        "\${workspaceFolder}/venv/lib/python3.8/site-packages"
    ],
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "python.linting.pylintArgs": ["--load-plugins", "pylint_django"]
}
EOL

# Cria um arquivo launch.json para o VS Code
cat <<EOL > $VSCODE_DIR/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "\${file}",
            "console": "integratedTerminal"
        }
    ]
}
EOL

# Instala a extensão do Python para o VS Code
code --install-extension ms-python.python

echo "Configuração concluída. Abra o Visual Studio Code e comece a codificar!"

