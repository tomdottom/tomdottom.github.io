---
tags: post
layout: blog
title: Testing uWSGI applications
summaryLength: 5
date: 2017-02-21
---
Testing uWSGI applications can be tricky because you can't actually install and import uWSGI.

It's not very well [documented](https://github.com/unbit/uwsgi/issues/686), but

> there is no uwsgi module. It does only exist when you run the python engine from uWSGI.

Many a developer has been frustrated by this during testing running into:

``` py
import uwsgi
```
``` text
>> Traceback (most recent call last):
>>   File "<stdin>", line 1, in <module>
>> ImportError: No module named uwsgi
```

And although much of an application can be factored out into independent testable modules you will always have a small section that remains untested unless you engage in various levels of mocking.

# 1. Ignore the error

The easiest way to overcome the ImportError is just to ignore it.

``` py
try:
    import uwsgi
except ImportError:
    uwsgi = None
```

I've never been happy with doing this. Ignoring errors in this manner is a code smell!

# 2. Mocking the uwsgi module at the system level

I much prefer creating a mock uwsgi module before importing any applications under test.

The gist below shows how easy it really is:

``` py
import mock
import sys

# Create a mock `uwsgi` module so that
# import uwsgi does not throw an ImportError

uwsgi = mock.MagicMock()
sys.modules.setdefault('uwsgi', uwsgi)

uwsgidecorators = mock.MagicMock()
uwsgidecorators.postfork = lambda x: x
sys.modules.setdefault('uwsgidecorators', uwsgidecorators)
```

# 3. A project for another day

I would love to be able to do

``` shell
pip install mock_uwsgi
```

Then import it at the top of my test files

``` py
import mock_uwsgi as uwsgi
```
