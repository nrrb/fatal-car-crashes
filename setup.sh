if [ ! -d "pythonenv" ]; then
    virtualenv pythonenv
fi
pythonenv/bin/pip install -r requirements.txt
pythonenv/bin/pip install lib/dbfpy-2.2.5.tar.gz
