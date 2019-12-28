# .bashrc

export PYTHONBUFFERED=0
export PYTHONUNBUFFERED=1

export PYTHON_ENV="dev"
alias celerymon='nodemon --exec "celery"'
alias pythonmon='nodemon --exec "python3"'
alias pmon='pythonmon'
alias python='python3'
alias pip='python -m pip'
alias pip3='python3 -m pip'
alias python_clean='find . -name "*.py[co]" -delete -o -name "__pycache__" -delete'
