python << EOF
# add cwd to pythonpath
import os
import sys
import vim
sys.path.insert(0, '.')

# check for virtualenv
# thx s0undt3ch! (http://blog.ufsoft.org/2009/1/29/ipython-and-virtualenv)
import site
from os import environ
from os.path import join
from sys import version_info
if 'VIRTUAL_ENV' in environ:
    virtual_env = join(environ.get('VIRTUAL_ENV'),
                       'lib',
                       'python%d.%d' % version_info[:2],
                       'site-packages')
    site.addsitedir(virtual_env)
    del virtual_env
del site, environ, join, version_info

# enable python completion by making vim aware of all libraries in sys.path
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
