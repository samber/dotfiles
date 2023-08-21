# .bashrc

#if [ -f /usr/bin/virtualenvwrapper.sh ];
#then
#    export WORKON_HOME=$HOME/.virtualenvs
#    source /usr/bin/virtualenvwrapper.sh
#fi

#alias scope_postgres='docker run --privileged=true -d -e POSTGRES_USER="foodnet" -e POSTGRES_PASSWORD="foodnet" -v /var/run/postgresql/:/var/run/postgresql -p 5432:5432 postgres:9.3'
#alias scope_syncdb='python manage.py syncdb --all --noinput'
#alias scope_redis='docker run -d -p 6379:6379 redis'
#alias scope_test='workon foodnet && DJANGO_SETTINGS_MODULE=foodnet.settings.test ENV=test py.test --reuse-db foodnet/apps/'
